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









Sentiment Analysis Project (PYTHON)
Overview
This project performs sentiment analysis on text using the transformers library for machine learning-based sentiment analysis and the textblob library for rule-based sentiment analysis. The script combines the results from both methods to provide a more nuanced sentiment analysis.

Requirements
Python 3.9
PyCharm (optional but recommended for easier development)
Setup
Clone the repository:

bash
Copy code
git clone <repository_url>
Navigate to the project directory:

bash
Copy code
cd Sentiment_Analysis
Create a virtual environment:

bash
Copy code
python -m venv venv
Activate the virtual environment:

bash
Copy code
source venv/bin/activate
Install required libraries:

bash
Copy code
pip install transformers textblob
If you are using PyCharm, you can also install the libraries through PyCharm preferences.

Usage
Open the script Sentiment_Analysis.py in PyCharm.

Update the text to be analyzed in the text_to_analyze variables.

Run the script.

Custom Threshold Adjustment
To customize the sentiment classification based on your criteria, you can adjust the custom_threshold variable in the script. This threshold determines when to classify sentiments as positive, negative, or neutral based on the sentiment score.

python
Copy code
# Adjust the threshold as needed
custom_threshold = -0.5
Troubleshooting
Library Installation
If you encounter issues with library installations, ensure that you are installing the libraries in the correct virtual environment. If using PyCharm, install the libraries through PyCharm preferences.

Sentiment Analysis Results
The sentiment analysis results might not always align with expectations. Consider adjusting the custom_threshold based on your specific criteria for sentiment classification.

Contributing
Feel free to contribute to this project by opening issues or submitting pull requests.
