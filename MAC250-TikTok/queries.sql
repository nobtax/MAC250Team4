
-- 1. TIKTOK POPULARITY
-- Calculates total likes across all videos for each creator to measure overall popularity.
SELECT 
    v.user_id, 
    u.username, 
    SUM(v.view_count) AS total_views,
    COUNT(vl.video_id) AS total_likes
FROM videos v
JOIN users u ON v.user_id = u.user_id
LEFT JOIN video_likes vl ON v.video_id = vl.video_id
GROUP BY v.user_id, u.username
ORDER BY total_likes DESC;

-- 2. CONTENT ENGAGEMENT
-- Counts the total number of comments left on each individual video.
SELECT 
    v.video_id,
    v.caption,
    COUNT(c.comment_id) AS total_comments
FROM videos v
LEFT JOIN comments c ON v.video_id = c.video_id
GROUP BY v.video_id, v.caption
ORDER BY total_comments DESC;

-- 3. SOUND UTILIZATION & PLATFORM TRENDS
-- Counts how many videos use each specific sound track to measure audio popularity.
SELECT 
    s.sound_id,
    s.title AS sound_title,
    s.creator_name,
    COUNT(v.video_id) AS times_used
FROM sounds s
LEFT JOIN videos v ON s.sound_id = v.sound_id
GROUP BY s.sound_id, s.title, s.creator_name
ORDER BY times_used DESC;

-- Filters creators who have published more than 2 videos using the HAVING clause.
SELECT 
    u.user_id,
    u.username,
    COUNT(v.video_id) AS total_videos_posted
FROM users u
JOIN videos v ON u.user_id = v.user_id
GROUP BY u.user_id, u.username
HAVING COUNT(v.video_id) > 2
ORDER BY total_videos_posted DESC;
