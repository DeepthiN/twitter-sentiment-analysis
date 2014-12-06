package com.oodproject;

import java.util.List;

public class TweetResults {
	private List<String> tweets;
	private List<Float> scores;
	
	public void setTweets (List<String> tweets){
		this.tweets = tweets;
	}
	
	public void setScores (List<Float> scores){
		this.scores = scores;
	}
	
	public List<String> getTweets(){
		return tweets;
	}
	
	public List<Float> getScores(){
		return scores;
	}
}
