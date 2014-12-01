package com.oodproject;

import java.util.ArrayList;
import java.util.List;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

public class TweetManager {
	
	/*
	 * Return tweets for a given hashtag
	 * @param topic : given Hashtag
	 * @return tweetList tweets as arraylist
	 */

	public static ArrayList<String> getTweets(String topic) {

		Twitter twitter = new TwitterFactory().getInstance();
		ArrayList<String> tweetList = new ArrayList<String>();
		try {
			Query query = new Query(topic + " -filter:retweets -filter:links -filter:replies -filter:images");
			query.setLang("en");
			query.setLocale("en");
			query.setCount(200);
			QueryResult result;
				result = twitter.search(query);
				List<Status> tweets = result.getTweets();
				for (Status tweet : tweets)
					tweetList.add(tweet.getText());
		} catch (TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to search tweets: " + te.getMessage());
		}
		return tweetList;
	}
}