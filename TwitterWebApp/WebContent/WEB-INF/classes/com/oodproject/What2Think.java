package com.oodproject;
/*
 * This class serves as 'controller' to retrieve tweets and calculate sentiment score
 * Uses classes NLP and TweetManager
 */

import java.util.ArrayList;
import java.util.List;

public class What2Think {
	/*
	 * Generate a list of strings with all tweets, their sentiment scores and some analytics
	 * @param topic represents hashtag
	 * @return param1 tweets as list of strings 
	 */

	public List<String> generateString(String topic){
		
		int i = 1, sentimentScore;
		StringBuilder positive = new StringBuilder ();
		StringBuilder negative = new StringBuilder ();
		StringBuilder tweetPrint;
		List<String> param1 = new ArrayList<String>();
		ArrayList<String> tweets = TweetManager.getTweets(topic);
		NLP.init();
	
		int totalScore = 0, count0 = 0, count1 = 0, count2 = 0, count3 = 0, count4 = 0;
		
		float avg;
		for(String tweet : tweets) {
			tweetPrint = new StringBuilder();
			sentimentScore = NLP.findSentiment(tweet);
			tweetPrint.append(i).append(")  ").append(tweet).append(" : ").append(sentimentScore);
			totalScore += sentimentScore;
			param1.add(i-1, tweetPrint.toString());
			i++;
			switch (sentimentScore) {
			case 0:
				count0++;
				negative.append(tweet);
				break;
			case 1:
				count1++;
				negative.append(tweet);
				break;
			case 2:
				count2++;
				break;
			case 3:
				count3++;
				positive.append(tweet);
				break;
			case 4:
				count4++;
				positive.append(tweet);
				break;
				
			}
		}
		avg = (float)totalScore/(i-1);
		param1.add("Average Sentiment Score = " + avg);
		param1.add("Tweets with Sentiment Score 0 = " + count0);
		param1.add("Tweets with Sentiment Score 1 = " + count1);
		param1.add("Tweets with Sentiment Score 2 = " + count2);
		param1.add("Tweets with Sentiment Score 3 = " + count3);
		param1.add("Tweets with Sentiment Score 4 = " + count4);
		param1.add("Tweets with positive Sentiment Score = " + positive);
		param1.add("Tweets with negative Sentiment Score = " + negative);
		
		return param1;
		
	}
}

