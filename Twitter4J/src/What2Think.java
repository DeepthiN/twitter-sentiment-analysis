import java.util.ArrayList;

public class What2Think {

	public static void main(String[] args) {
		String topic = "#Android";
		ArrayList<String> tweets = TweetManager.getTweets(topic);
		NLP.init();
		int i =1;
		int count=0;
		float avg;
		for(String tweet : tweets) {
			System.out.println(i + ")  "+ tweet + " : " + NLP.findSentiment(tweet) + "," + (count+=NLP.findSentiment(tweet)));
			i++;
		}
		avg = (float)count/(i-1);
		System.out.println ("Average Sentiment Score = " + avg);
		
	}
}

