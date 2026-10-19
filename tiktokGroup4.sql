
CREATE DATABASE IF NOT EXISTS tiktok_db;
USE tiktok_db;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    role VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    body TEXT,
    user_id INT NOT NULL,
    status VARCHAR(30) NOT NULL,
    shares INT NOT NULL DEFAULT 0,
    likes INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_posts_users
        FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    body TEXT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_videos_users
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_videos_categories
        FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE follows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_follows_follower
        FOREIGN KEY (follower_id) REFERENCES users(id),

    CONSTRAINT fk_follows_followee
        FOREIGN KEY (followee_id) REFERENCES users(id),

    CONSTRAINT uq_follows_pair
        UNIQUE (follower_id, followee_id),

    CONSTRAINT chk_no_self_follow
        CHECK (follower_id <> followee_id)
);


CREATE TABLE friends_lists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    friend_user_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_friends_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_friends_friend
        FOREIGN KEY (friend_user_id) REFERENCES users(id),

    CONSTRAINT uq_friends_pair
        UNIQUE (user_id, friend_user_id),

    CONSTRAINT chk_no_self_friend
        CHECK (user_id <> friend_user_id)
);


CREATE TABLE shops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    body TEXT,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_shops_users
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT chk_shops_price
        CHECK (price >= 0)
);


CREATE TABLE watch_histories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    watched_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_watch_users
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_watch_videos
        FOREIGN KEY (video_id) REFERENCES videos(id)
);


CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_comments_users
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_comments_videos
        FOREIGN KEY (video_id) REFERENCES videos(id)
);


CREATE TABLE video_likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_likes_users
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_likes_videos
        FOREIGN KEY (video_id) REFERENCES videos(id),

    CONSTRAINT uq_video_likes
        UNIQUE (user_id, video_id)
);
