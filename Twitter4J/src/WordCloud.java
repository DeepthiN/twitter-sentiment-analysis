import processing.core.*; 
import wordcram.*; 

public class WordCloud extends PApplet { 
    
	private static final long serialVersionUID = 1L;
	/** 
     * 
     */ 
	What2Think main = new What2Think();
	String []  tweetsList =  main.generateString("#Android");
    WordCram words = new WordCram(this); 
    

    @Override 
    public void setup() { 
        System.out.println("hello"); 
        this.size(500, 400); 
        this.background(255); 
        this.words.fromTextString(tweetsList[0]);
        this.words.drawAll(); 
        this.save("positive"); 
    }
    
} 