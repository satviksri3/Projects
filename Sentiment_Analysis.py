from transformers import pipeline
from textblob import TextBlob


def analyze_sentiment_transformers(text):
    sentiment_analyzer = pipeline('sentiment-analysis')
    result = sentiment_analyzer(text)[0]
    return result['label'], result['score']


def analyze_sentiment_textblob(text):
    analysis = TextBlob(text)
    return 'positive' if analysis.sentiment.polarity > 0 else 'negative' if analysis.sentiment.polarity < 0 else \
        'neutral', analysis.sentiment.polarity


def analyze_sentiment_combined(text):
    label_transformers, score_transformers = analyze_sentiment_transformers(text)
    label_textblob, score_textblob = analyze_sentiment_textblob(text)

    if score_transformers > 0.7 or score_textblob > 0.5:
        final_label = 'positive'
    elif score_transformers < 0.3 or score_textblob < -0.5:
        final_label = 'negative'
    else:
        final_label = 'neutral'

    return final_label, (score_transformers, score_textblob)


if __name__ == "__main__":
    text_to_analyze = "I love using Python for data science projects!"

    label, scores = analyze_sentiment_combined(text_to_analyze)

    print(f"Text: {text_to_analyze}")
    print(f"Combined Sentiment: {label}")
    print(f"Sentiment Scores: {scores}")

if __name__ == "__main__":
    text_to_analyze_2 = "The service at the restaurant was terrible, and the food was awful. I wouldn't recommend it to anyone."

    # Analyze the second text
    label_2, scores_2 = analyze_sentiment_combined(text_to_analyze_2)

    # Adjust the threshold as needed
    custom_threshold = -0.5

    # Classify based on the custom threshold
    final_label_2 = 'negative' if scores_2[1] < custom_threshold else label_2

    print(f"Text 2: {text_to_analyze_2}")
    print(f"Customized Sentiment 2: {final_label_2}")
    print(f"Sentiment Scores 2: {scores_2}")
