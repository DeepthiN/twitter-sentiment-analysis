package com.oodproject;

/*
 * This class serves as 'controller' to retrieve tweets and calculate sentiment score
 * Uses classes NLP and TweetManager
 */

import java.util.ArrayList;
import java.util.List;

public class TweetAnalyzer {
	/*
	 * Generate a list of strings with all tweets, their sentiment scores and
	 * some analytics
	 * @param topic represents hashtag
	 * @return param1 tweets as list of strings
	 */
	private TweetManager tweetManager;
	private NLP nlp;
	public TweetResults generateString(String topic) {
		tweetManager =  new TweetManager();
		nlp = new NLP();
		int i = 1, sentimentScore;
		TweetResults tweetResult = new TweetResults();
		StringBuilder positive = new StringBuilder();
		StringBuilder negative = new StringBuilder();
		StringBuilder tweetPrint;
		List<String> param1 = new ArrayList<String>();
		ArrayList<String> tweets = tweetManager.getTweets(topic);
		NLP.init();

		float totalScore = 0, count0 = 0, count1 = 0, count2 = 0, count3 = 0, count4 = 0;

		float avg, NSR;
		for (String tweet : tweets) {
			tweetPrint = new StringBuilder();
			sentimentScore = nlp.findSentiment(tweet);
			tweetPrint.append(i).append(")  ").append(tweet).append(" : ")
					.append(sentimentScore);
			totalScore += sentimentScore;
			param1.add(i - 1, tweetPrint.toString());
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
		
		
		param1.add("Tweets with positive Sentiment Score = " + positive);
		param1.add("Tweets with negative Sentiment Score = " + negative);
		avg = (float) totalScore / (i - 1);
		NSR = ((count3+count4) - (count0+count1))/(float) totalScore;
		
		param1.add("Net Sentiment Rate (NSR) = " + NSR);
		param1.add("Average Sentiment Score = " + avg);
		param1.add("Tweets with Sentiment Score 0 = " + count0);
		param1.add("Tweets with Sentiment Score 1 = " + count1);
		param1.add("Tweets with Sentiment Score 2 = " + count2);
		param1.add("Tweets with Sentiment Score 3 = " + count3);
		param1.add("Tweets with Sentiment Score 4 = " + count4);
		tweetResult.tweets = param1;
		
		tweetResult.scores = new ArrayList<Float>();
		tweetResult.scores.add(count0);
		tweetResult.scores.add(count1);
		tweetResult.scores.add(count2);
		tweetResult.scores.add(count3);
		tweetResult.scores.add(count4);
		

		return tweetResult;

	}
}
