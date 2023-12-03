CREATE DATABASE social_media;
USE social_media;
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  username VARCHAR(255),
  email VARCHAR(255),
  birthdate DATE,
  join_date TIMESTAMP,
  gender VARCHAR(10),
  phone_number VARCHAR(20)
);
CREATE TABLE Posts (
  post_id INT PRIMARY KEY,
  user_id INT,
  content TEXT,
  timestamp TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
  -- Add more columns as needed
);
CREATE TABLE Comments (
  comment_id INT PRIMARY KEY,
  user_id INT,
  post_id INT,
  content TEXT,
  timestamp TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (post_id) REFERENCES Posts(post_id)
  -- Add more columns as needed
);
CREATE TABLE Likes (
  like_id INT PRIMARY KEY,
  user_id INT,
  post_id INT,
  timestamp TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (post_id) REFERENCES Posts(post_id)
  -- Add more columns as needed
);
CREATE TABLE Friendships (
  friendship_id INT PRIMARY KEY,
  user1_id INT,
  user2_id INT,
  friendship_date DATE,
  FOREIGN KEY (user1_id) REFERENCES Users(user_id),
  FOREIGN KEY (user2_id) REFERENCES Users(user_id)
  -- Add more columns as needed
);
INSERT INTO Posts (post_id, user_id, content, timestamp)
VALUES
(1, 1, 'Hello, world!', '2023-01-01 12:00:00'),
(2, 2, 'A great day!', '2023-01-02 14:30:00'),
(3, 3, 'Just chilling.', '2023-01-03 18:45:00');
INSERT INTO Comments (comment_id, user_id, post_id, content, timestamp)
VALUES
(1, 2, 1, 'Nice post!', '2023-01-01 12:30:00'),
(2, 3, 2, 'I agree!', '2023-01-02 15:00:00'),
(3, 1, 3, 'Looks fun!', '2023-01-03 19:00:00');
INSERT INTO Likes (like_id, user_id, post_id, timestamp)
VALUES
(4, 1, 1, '2023-01-01 13:00:00'), -- Additional like for post 1
(5, 2, 1, '2023-01-01 13:15:00'), -- Another like for post 1
(6, 3, 2, '2023-01-02 16:00:00'); -- Like for post 2
INSERT INTO Friendships (friendship_id, user1_id, user2_id, friendship_date)
VALUES
(1, 1, 2, '2023-01-01'),
(2, 2, 3, '2023-01-02'),
(3, 1, 3, '2023-01-03');
-- Find which post has the most likes
SELECT post_id, COUNT(*) as like_count
FROM Likes
GROUP BY post_id
ORDER BY like_count DESC
LIMIT 1;
-- Retrieve all posts by a specific user (e.g., Alice):
SELECT * FROM Posts WHERE user_id = 1;
-- Get the latest comments on a particular post (e.g., Post with ID 2):

-- Find friends of a given user (e.g., Alice):
SELECT u.username as friend_name
FROM Friendships f
JOIN Users u ON (f.user2_id = u.user_id AND f.user1_id = 1)
UNION
SELECT u.username as friend_name
FROM Friendships f
JOIN Users u ON (f.user1_id = u.user_id AND f.user2_id = 1);
-- Count the number of likes on a post (e.g., Post with ID 1):	
SELECT COUNT(*) as like_count FROM Likes WHERE post_id = 1;