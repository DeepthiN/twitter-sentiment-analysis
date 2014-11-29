package com.oodproject;



import processing.core.*; 
import wordcram.*; 

public class WordCloud extends PApplet { 
    
	private static final long serialVersionUID = 1L;
	/** 
     * 
     */ 
	
	String  tweetsList =  "Jimmy Wales and Larry Sanger launched Wikipedia on January 15, 2001. Sanger[9] coined its name,[10] a portmanteau of wiki (from the Hawaiian word for quick)[11] and encyclopedia. Although Wikipedia's content was initially only in English, it quickly became multilingual, through the launch of versions in different languages. All versions of Wikipedia are similar, but important differences exist in content and in editing practices. The English Wikipedia is now one of more than 200 Wikipedias, but remains the largest one, with over 4.6 million articles. As of February 2014, it had 18 billion page views and nearly 500 million unique visitors each month.[12] Wikipedia has more than 22 million accounts, out of which there were over 73,000 active editors globally as of May 2014.[2]";
    WordCram words = new WordCram(this); 

    @Override 
    public void setup() { 
        System.out.println("hello"); 
        this.size(500, 400); 
        this.background(255); 
        this.words.fromTextString(tweetsList);
        this.words.drawAll(); 
     
    }
    
} 