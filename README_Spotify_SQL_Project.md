# 🎵 Spotify Music Data Analysis Using SQL  

![SQL Badge](https://img.shields.io/badge/Language-SQL-blue?logo=postgresql&logoColor=white)
![MySQL Badge](https://img.shields.io/badge/Database-MySQL-orange?logo=mysql&logoColor=white)
![Dataset Badge](https://img.shields.io/badge/Dataset-SpotifyFeatures.csv-green?logo=spotify&logoColor=white)
![Data Analysis Badge](https://img.shields.io/badge/Focus-Data%20Analysis-purple?logo=tableau&logoColor=white)
![License Badge](https://img.shields.io/badge/License-Open--Source-brightgreen)

> 🎧 *Explore how SQL reveals the rhythm behind Spotify’s most popular songs.*

---

## 📊 Project Overview  
This project performs a detailed analysis of the **Spotify Music Dataset** using **SQL** to uncover insights about music trends, genre popularity, and artist versatility.  
Through analytical SQL queries, it explores how attributes like **energy**, **danceability**, and **valence** influence a song’s popularity and listener engagement.  

The goal is to demonstrate practical data analysis using **aggregations, subqueries, window functions, CTEs, and case logic** — all applied to a real-world dataset.  

---

## 🧩 Dataset Description  
The dataset used is **`SpotifyFeatures.csv`**, containing metadata and audio features for thousands of songs across various genres.  

### **Key Columns**
| Column | Description |
|---------|-------------|
| `genre` | The music genre (e.g., Pop, Rock, Jazz) |
| `artist_name` | Performing artist or band |
| `track_name` | Title of the song |
| `popularity` | Popularity score (0–100) |
| `danceability` | Suitability of a song for dancing (0.0–1.0) |
| `energy` | Intensity and activity level (0.0–1.0) |
| `musical_key` | Musical key (e.g., C, D#, F) |
| `loudness` | Average decibel level |
| `mode` | Modality (1 = Major, 0 = Minor) |
| `speechiness` | Presence of spoken words |
| `acousticness` | Confidence that a track is acoustic |
| `instrumentalness` | Likelihood that a track is instrumental |
| `liveness` | Probability that a track was recorded live |
| `valence` | Musical positivity/happiness level |
| `tempo` | Estimated tempo in beats per minute (BPM) |
| `duration_ms` | Duration of the track in milliseconds |

---

## ⚙️ Database Setup  

### **1️⃣ Create the Database**
```sql
CREATE DATABASE spotify_analysis;
USE spotify_analysis;
```

### **2️⃣ Create the Table**
```sql
CREATE TABLE spotify_features (
    genre VARCHAR(255),
    artist_name VARCHAR(255),
    track_name VARCHAR(255),
    popularity INT,
    danceability DOUBLE,
    energy DOUBLE,
    musical_key VARCHAR(10),
    loudness DOUBLE,
    mode TINYINT,
    speechiness DOUBLE,
    acousticness DOUBLE,
    instrumentalness DOUBLE,
    liveness DOUBLE,
    valence DOUBLE,
    tempo DOUBLE,
    duration_ms BIGINT
);
```

### **3️⃣ Load the CSV File**
```sql
LOAD DATA LOCAL INFILE 'C:/path_to_file/SpotifyFeatures.csv'
INTO TABLE spotify_features
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(genre, artist_name, track_name, popularity, danceability, energy, @csv_key, loudness,
 mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, duration_ms)
SET musical_key = NULLIF(@csv_key, '');
```

> 💡 **Tip:** If you face a file-loading error, enable local imports with:  
> ```sql
> SET GLOBAL local_infile = 1;
> ```

---

## 🎯 Project Objectives  
- Identify **top-performing genres** and **most popular artists**  
- Compare **energy, valence, and tempo** across genres  
- Categorize songs based on **tempo and danceability**  
- Explore **acoustic vs. electronic** song patterns  
- Demonstrate **real-world SQL analytics** on music data  

---

## 💡 Key Insights  

### 🎶 Music Trends  
- **Pop**, **Hip-Hop**, and **EDM** dominate Spotify’s catalog by volume and popularity.  
- Songs with **higher energy and valence** tend to perform better commercially.  
- Most popular songs fall between **100–120 BPM**, aligning with optimal rhythm for dancing.  

### 🎤 Artist Patterns  
- Some artists contribute **20% or more** of their genre’s total tracks.  
- Artists spanning **multiple genres** have significantly higher average popularity.  

### 🔊 Musical Features  
- **Acousticness** peaks in genres like Jazz and Classical.  
- **Energy and loudness** are highly correlated, especially in Rock and EDM.  
- Songs with high **instrumentalness** often have lower popularity but longer durations.  

### 🧠 Analytical Takeaways  
- SQL can effectively analyze feature-level data in the music industry.  
- Feature combinations (like energy, valence, and danceability) help identify **song mood profiles**.  
- Such analysis supports **playlist recommendations** and **audience targeting** strategies.  

---

## 🧰 Technologies Used  
| Tool | Purpose |
|------|----------|
| **MySQL** | Database and SQL query execution |
| **SQL** | Data analysis and transformation |
| **SpotifyFeatures.csv** | Dataset for exploration |
| **GitHub** | Version control and sharing |


---

## 🚀 How to Run  
1. Clone or download this repository.  
2. Open your SQL environment (e.g., MySQL Workbench).  
3. Create the database and table using the scripts above.  
4. Import the dataset with `LOAD DATA LOCAL INFILE`.  
5. Run the queries from **`SQL PROJECT.sql`** to generate insights.  

---

## 🏁 Outcome  
This project demonstrates the power of SQL for **data-driven storytelling** using real-world Spotify data.  
By analyzing the musical attributes of thousands of songs, it provides a deeper understanding of:  
- What makes songs popular 🎧  
- How genres differ by rhythm, mood, and sound 🎵  
- The data patterns that define modern music trends 📊  

---

