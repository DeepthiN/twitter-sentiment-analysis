import java.util.ArrayList;
import wordcram.*;

public class What2Think {

	public static void main(String[] args) {
		String topic = "#Apple";
		ArrayList<String> tweets = TweetManager.getTweets(topic);
		NLP.init();
		int i = 1;
		int count = 0;
		int count0 = 0;
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		StringBuilder positive = new StringBuilder ();
		StringBuilder negative = new StringBuilder ();
				
		float avg;
		for(String tweet : tweets) {
			System.out.println(i + ")  "+ tweet + " : " + NLP.findSentiment(tweet) + "," + (count+=NLP.findSentiment(tweet)));
			i++;
			switch (NLP.findSentiment(tweet)) {
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
		avg = (float)count/(i-1);
		System.out.println ("Average Sentiment Score = " + avg);
		System.out.println ("Tweets with Sentiment Score 0 = " + count0);
		System.out.println ("Tweets with Sentiment Score 1 = " + count1);
		System.out.println ("Tweets with Sentiment Score 2 = " + count2);
		System.out.println ("Tweets with Sentiment Score 3 = " + count3);
		System.out.println ("Tweets with Sentiment Score 4 = " + count4);
		System.out.println ("Tweets with positive Sentiment Score = " + positive);
		System.out.println ("Tweets with negative Sentiment Score = " + negative);
		
			 
		WordCram wordCram = new WordCram(positive,
			    ("sans", 1)),
			    Sizers.byWeight(5, 60),
			    Colorers.TwoHuesRandomSats(this),
			    Anglers.MostlyHoriz,
			    new CenterClumpWordPlacer(),
			    new SpiralWordNudger());
			 
			  while (wordCram.hasMore()) {
			    wordCram.drawNext();
		
	}
}

