
-- MAC 250 - Team 4: TikTok Views (SQLite)

-- 1. PRIVACY FILTER VIEW
-- Exposes only videos from public user accounts (is_private = 0)
DROP VIEW IF EXISTS public_records;
CREATE VIEW public_records AS
SELECT
    v.video_id,
    v.user_id AS author_id,
    v.caption AS content_payload,
    v.posted_at AS created_at,
    v.view_count
FROM videos v
JOIN users u ON v.user_id = u.user_id
WHERE u.is_private = 0;

-- 2. SECURE PUBLIC PROFILE VIEW
-- Shows safe profile columns only for public accounts
DROP VIEW IF EXISTS public_user_profiles;
CREATE VIEW public_user_profiles AS
SELECT
    user_id,
    username,
    display_name
FROM users
WHERE is_private = 0;

-- 3. VIDEO FEED VIEW
-- Combines public videos, creators, and sounds with like and comment counts
DROP VIEW IF EXISTS vw_video_feed;
CREATE VIEW vw_video_feed AS
SELECT
    v.video_id,
    u.username,
    v.caption,
    s.title AS sound_title,
    v.view_count,
    (SELECT COUNT(*) FROM video_likes vl WHERE vl.video_id = v.video_id) AS like_count,
    (SELECT COUNT(*) FROM comments c WHERE c.video_id = v.video_id) AS comment_count
FROM videos v
JOIN users u ON v.user_id = u.user_id
JOIN sounds s ON v.sound_id = s.sound_id
WHERE u.is_private = 0;