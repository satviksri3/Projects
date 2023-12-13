# Projects
# Social Media Database (SQL)

A relational database for a social media platform, including tables for Users, Posts, Comments, Likes, and Friendships.

## Getting Started

1. Clone the repository.
2. Set up the database using the provided SQL scripts.
3. Run sample queries to explore the database.

## Database Schema

- Users
- Posts
- Comments
- Likes
- Friendships

## Usage

To retrieve all posts by a specific user:

```sql
SELECT * FROM Posts WHERE user_id = 1;
-- Find friends of a given user (e.g., Alice):
SELECT u.username as friend_name
FROM Friendships f
JOIN Users u ON (f.user2_id = u.user_id AND f.user1_id = 1)
UNION
SELECT u.username as friend_name
FROM Friendships f
JOIN Users u ON (f.user1_id = u.user_id AND f.user2_id = 1);

(More queries on file)







