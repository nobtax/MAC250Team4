-- MAC 250 Team 4: TikTok database schema (SQLite)
PRAGMA foreign_keys = ON;

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    joined_at TEXT NOT NULL,
    is_private INTEGER NOT NULL DEFAULT 0 CHECK (is_private IN (0,1))
);

CREATE TABLE sounds (
    sound_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    creator_name TEXT NOT NULL,
    duration_seconds INTEGER NOT NULL CHECK (duration_seconds > 0)
);

CREATE TABLE videos (
    video_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    sound_id INTEGER NOT NULL,
    caption TEXT NOT NULL,
    posted_at TEXT NOT NULL,
    view_count INTEGER NOT NULL DEFAULT 0 CHECK (view_count >= 0),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (sound_id) REFERENCES sounds(sound_id)
);

CREATE TABLE comments (
    comment_id INTEGER PRIMARY KEY,
    video_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    commented_at TEXT NOT NULL,
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE video_likes (
    user_id INTEGER NOT NULL,
    video_id INTEGER NOT NULL,
    liked_at TEXT NOT NULL,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followed_id INTEGER NOT NULL,
    followed_at TEXT NOT NULL,
    PRIMARY KEY (follower_id, followed_id),
    CHECK (follower_id <> followed_id),
    FOREIGN KEY (follower_id) REFERENCES users(user_id),
    FOREIGN KEY (followed_id) REFERENCES users(user_id)
);
