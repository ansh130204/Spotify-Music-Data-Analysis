SELECT * FROM sqlproject.spotifyfeatures;

-- Q1} Find the total number of songs in the dataset?
	SELECT COUNT(*) AS total_songs 
	FROM spotifyfeatures;

-- Q2} What are the top 10 most popular songs in the dataset?
	SELECT track_name, artist_name, popularity
	FROM spotifyfeatures
	ORDER BY popularity DESC
	LIMIT 10;
 
 -- Q3} Which genre dominates the Spotify dataset in terms of total number of tracks?
	SELECT genre, COUNT(*) AS total_tracks
	FROM spotifyfeatures
	GROUP BY genre
	ORDER BY total_tracks DESC
	LIMIT 5;
    
-- Q4} Which artist has produced the most tracks on Spotify?
	SELECT artist_name, COUNT(*) AS total_songs
	FROM spotifyfeatures
	GROUP BY artist_name
	ORDER BY total_songs DESC
	LIMIT 10;
    
-- Q5} Which genres have the highest average danceability?
	SELECT genre, ROUND(AVG(danceability), 3) AS avg_danceability
	FROM spotifyfeatures
	GROUP BY genre
	ORDER BY avg_danceability DESC
	LIMIT 10;
    
-- Q6} Find the average loudness and energy per genre.
	SELECT genre,
       ROUND(AVG(loudness), 2) AS avg_loudness,
       ROUND(AVG(energy), 2) AS avg_energy
	FROM spotifyfeatures
	GROUP BY genre
	ORDER BY avg_energy DESC;
    
-- Q7} Which genres produce the happiest (valence) songs?
	SELECT genre, ROUND(AVG(valence), 2) AS avg_valence
	FROM spotifyfeatures
	GROUP BY genre
	ORDER BY avg_valence DESC
	LIMIT 10;
    
-- Q8} What is the average duration of songs by genre?
	SELECT genre, ROUND(AVG(duration_ms) / 60000, 2) AS avg_duration_min
	FROM spotifyfeatures
	GROUP BY genre
	ORDER BY avg_duration_min DESC;
    
-- Q9} Find songs that are mostly instrumental?
	SELECT artist_name, track_name, instrumentalness
	FROM spotifyfeatures
	WHERE instrumentalness > 0.8
	ORDER BY instrumentalness DESC;
    
-- Q10} Find the distribution of tempo among all songs?
	SELECT 
	  CASE 
		WHEN tempo < 80 THEN 'Slow'
		WHEN tempo BETWEEN 80 AND 120 THEN 'Moderate'
		WHEN tempo BETWEEN 120 AND 160 THEN 'Fast'
		ELSE 'Very Fast'
	  END AS tempo_category,
	  COUNT(*) AS total_songs
	FROM spotifyfeatures
	GROUP BY tempo_category
	ORDER BY total_songs DESC;
    
-- Q11} Which artists dominate each genre?
	SELECT genre, artist_name, COUNT(*) AS total_songs
	FROM spotifyfeatures
	GROUP BY genre, artist_name
	HAVING COUNT(*) = (
		SELECT MAX(song_count)
		FROM (
			SELECT COUNT(*) AS song_count
			FROM spotifyfeatures AS s2
			WHERE s2.genre = spotifyfeatures.genre
			GROUP BY s2.artist_name
		) AS sub
	);
    
-- Q12} Compare average acousticness of pop vs. rock genres?
	SELECT genre, ROUND(AVG(acousticness), 2) AS avg_acousticness
	FROM spotifyfeatures
	WHERE genre IN ('Pop', 'Rock')
	GROUP BY genre;
    
-- Q13} Categorize songs based on tempo as ‘Slow’, ‘Medium’, or ‘Fast’ and count how many songs fall into each category per genre?
	SELECT genre,
       CASE 
         WHEN tempo < 90 THEN 'Slow'
         WHEN tempo BETWEEN 90 AND 120 THEN 'Medium'
         ELSE 'Fast'
       END AS tempo_category,
       COUNT(*) AS song_count
	FROM spotifyfeatures
	GROUP BY genre, tempo_category
	ORDER BY genre, song_count DESC;
    
-- Q14} Find the top 5 most “versatile” artists which appear in the most number of unique genres?
	SELECT artist_name, COUNT(DISTINCT genre) AS genre_count
	FROM spotifyfeatures
	GROUP BY artist_name
	ORDER BY genre_count DESC
	LIMIT 5;
    
-- Q15} Find the 5 longest songs (in minutes) and their genres?
	SELECT track_name, artist_name, genre,
		   ROUND(duration_ms / 60000, 2) AS duration_minutes
	FROM spotifyfeatures
	ORDER BY duration_minutes DESC
	LIMIT 5;