# TikTok Database Management System

**MAC 250 – Database Concepts and Programming**  
**LaGuardia Community College**  
**Team 4 – Group Project**

---

## Project Overview

This project is a relational database system designed to simulate TikTok's short-form video platform operations using SQLite.

The database manages users, sounds, videos, comments, video likes, and user follows. It also includes SQL analytical queries and database views to evaluate creator popularity, video comment engagement, sound usage, high-output creators, and privacy-filtered public feeds.

---

## Database Tables

* **users** – Stores user accounts, usernames, display names, join dates, and privacy flags (`is_private`).
* **sounds** – Stores audio track details, titles, creator names, and durations in seconds.
* **videos** – Stores video posts, captions, timestamps, view counts, and links to users and sounds.
* **comments** – Records comments left on videos by users along with timestamps.
* **video_likes** – Records user likes on videos and when each like occurred.
* **follows** – Records follower and followed user relationships along with follow dates.

---

## Database Relationships

* One user can post multiple videos, write multiple comments, give multiple likes, and follow or be followed by multiple users.
* One sound can be used across multiple videos.
* Each video belongs to one user and uses one sound, and can receive multiple comments and likes.
* Composite primary keys prevent duplicate likes or duplicate follow pairs for the same user and target.

---

## SQL Analytics & Views

### Analytical Queries (`queries.sql`)
1. **Creator Popularity:** Total views and total likes across videos per creator.
2. **Content Engagement:** Total number of comments per individual video.
3. **Sound Utilization & Trends:** How many times each sound track is used across videos.
4. **High-Activity Creators:** Creators with more than 2 published videos filtered using the `HAVING` clause.

### Database Views (`views.sql`)
1. **`public_records`** – Privacy filter view exposing only videos from public user accounts (`is_private = 0`).
2. **`public_user_profiles`** – Secure profile view exposing only safe public columns (`user_id`, `username`, `display_name`) for non-private accounts.
3. **`vw_video_feed`** – Feed view combining public videos, creators, and sounds with total likes and comment counts.

These files demonstrate SQL concepts including `JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, `COUNT`, `SUM`, `CREATE VIEW`, and correlated subqueries.

---

## Project Files

* `schema.sql` – Creates the SQLite tables, primary/foreign keys, and constraints.
* `seed.sql` – Inserts sample records into the parent and relationship tables.
* `queries.sql` – Contains the four analytical SQL queries.
* `views.sql` – Creates the virtual views for privacy filtering and video feed aggregation.

---

## How to Run

1. Install **DB Browser for SQLite**.
2. Create a new empty SQLite database (or open an existing one) using DB Browser.
3. Navigate to the **Execute SQL** tab.
4. To build from scratch, execute the files in the following order:
   1. `schema.sql`
   2. `seed.sql`
   3. `views.sql`
   4. `queries.sql`
5. Inspect the analytical results or query the created views (e.g., `SELECT * FROM vw_video_feed;`).

---

## Team Members

**Team 4 – MAC 250**
* *Maximo Vicuna*
* *YanCarlos Alvarez*
* *Tsetan Tashi*
* *Lewis Victoria*
* *Curtis Fowler*
* *Donte Geathers*

---

## Tools Used

* DB Browser for SQLite
* GitHub
