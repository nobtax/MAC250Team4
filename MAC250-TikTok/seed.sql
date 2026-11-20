-- MAC 250 Team 4: TikTok
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Parent tables
INSERT INTO users (user_id, username, display_name, joined_at, is_private) VALUES
    (1, 'nycfoodtrail', 'Maya Chen', '2026-01-12', 0),
    (2, 'codewithari', 'Ari Patel', '2026-02-03', 0),
    (3, 'fitwithlea', 'Lea Torres', '2026-02-18', 0),
    (4, 'cityframes', 'Jordan Kim', '2026-03-09', 1),
    (5, 'studywithnoor', 'Noor Ahmed', '2026-04-21', 0);

INSERT INTO sounds (sound_id, title, creator_name, duration_seconds) VALUES
    (1, 'Morning Metro Beat', 'Metro Loops', 24),
    (2, 'Quiet Study Piano', 'Blue Desk Audio', 45),
    (3, 'Quick Recipe Groove', 'Kitchen Tracks', 30),
    (4, 'Workout Count-In', 'Pulse Sounds', 20),
    (5, 'City Walk Ambience', 'Street Sounds', 40);

-- Child/relationship tables
INSERT INTO videos (video_id, user_id, sound_id, caption, posted_at, view_count) VALUES
    (101, 1, 3, 'Three affordable dumpling spots in Queens', '2026-09-01 12:00:00', 18500),
    (102, 2, 2, 'SQL joins in sixty seconds', '2026-09-02 18:15:00', 4200),
    (103, 3, 4, 'Twenty minute beginner workout', '2026-09-03 07:30:00', 9100),
    (104, 4, 5, 'Sunset walk across the bridge', '2026-09-04 19:10:00', 3800),
    (105, 5, 2, 'How I plan my study week', '2026-09-05 08:00:00', 11600),
    (106, 1, 3, 'Budget lunch near campus', '2026-09-07 13:05:00', 14200),
    (107, 2, 1, 'Python list tips for beginners', '2026-09-08 16:40:00', 7600),
    (108, 3, 4, 'Stretch routine after work', '2026-09-09 20:10:00', 5400),
    (109, 4, 5, 'Rainy evening in Manhattan', '2026-09-11 18:30:00', 2200),
    (110, 5, 2, 'My favorite library study setup', '2026-09-12 10:25:00', 6800),
    (111, 1, 3, 'Easy homemade noodle bowl', '2026-09-14 12:35:00', 23100),
    (112, 2, 1, 'Primary keys versus foreign keys', '2026-09-15 15:20:00', 8700),
    (113, 3, 4, 'Four simple gym exercises', '2026-09-16 06:50:00', 12200),
    (114, 4, 5, 'Favorite quiet corner of the city', '2026-09-18 17:45:00', 4700),
    (115, 5, 2, 'Five tips before exam week', '2026-09-20 09:00:00', 15900);

INSERT INTO comments (comment_id, video_id, user_id, comment_text, commented_at) VALUES
    (201, 101, 2, 'Adding this to my weekend list!', '2026-09-01 13:05:00'),
    (202, 101, 5, 'Which place has vegetarian options?', '2026-09-01 13:22:00'),
    (203, 102, 5, 'That JOIN explanation helped.', '2026-09-02 19:00:00'),
    (204, 103, 1, 'Perfect length for a busy morning.', '2026-09-03 08:10:00'),
    (205, 104, 3, 'The lighting looks amazing.', '2026-09-04 20:00:00'),
    (206, 105, 2, 'I need a planner like that.', '2026-09-05 09:15:00'),
    (207, 106, 4, 'That lunch looks great.', '2026-09-07 13:50:00'),
    (208, 107, 1, 'Could you cover dictionaries next?', '2026-09-08 17:30:00'),
    (209, 108, 5, 'Saved this routine.', '2026-09-09 21:00:00'),
    (210, 109, 3, 'Love the rainy city atmosphere.', '2026-09-11 19:00:00'),
    (211, 110, 2, 'The desk setup is so clean.', '2026-09-12 11:00:00'),
    (212, 111, 4, 'What noodles did you use?', '2026-09-14 13:30:00'),
    (213, 112, 5, 'Exactly what I needed for class.', '2026-09-15 16:00:00'),
    (214, 113, 2, 'Great beginner-friendly list.', '2026-09-16 08:00:00'),
    (215, 115, 1, 'Exam week tips are always useful.', '2026-09-20 10:10:00');

INSERT INTO video_likes (user_id, video_id, liked_at) VALUES
    (2, 101, '2026-09-01 13:06:00'),
    (5, 101, '2026-09-01 13:24:00'),
    (1, 102, '2026-09-02 20:00:00'),
    (5, 102, '2026-09-02 20:05:00'),
    (1, 103, '2026-09-03 09:00:00'),
    (4, 103, '2026-09-03 09:10:00'),
    (3, 104, '2026-09-04 21:00:00'),
    (2, 105, '2026-09-05 10:00:00'),
    (3, 106, '2026-09-07 14:00:00'),
    (1, 107, '2026-09-08 18:00:00'),
    (5, 108, '2026-09-09 22:00:00'),
    (3, 109, '2026-09-11 20:00:00'),
    (2, 110, '2026-09-12 12:00:00'),
    (4, 111, '2026-09-14 14:00:00'),
    (5, 112, '2026-09-15 17:00:00');

INSERT INTO follows (follower_id, followed_id, followed_at) VALUES
    (1, 2, '2026-05-01'),
    (1, 3, '2026-05-02'),
    (1, 5, '2026-05-03'),
    (2, 1, '2026-05-04'),
    (2, 3, '2026-05-05'),
    (2, 4, '2026-05-06'),
    (3, 1, '2026-05-07'),
    (3, 4, '2026-05-08'),
    (3, 5, '2026-05-09'),
    (4, 1, '2026-05-10'),
    (4, 2, '2026-05-11'),
    (4, 5, '2026-05-12'),
    (5, 1, '2026-05-13'),
    (5, 2, '2026-05-14'),
    (5, 3, '2026-05-15');

COMMIT;
