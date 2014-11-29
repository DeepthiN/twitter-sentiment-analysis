package com.oodproject;

import java.util.List;

import processing.core.*; 
import wordcram.*; 

public class WordCloud extends PApplet { 
    
	private static final long serialVersionUID = 1L;
	/** 
     * 
     */ 
	What2Think main = new What2Think();
	List<String>  tweetsList =  main.generateString("#Android");
    WordCram words = new WordCram(this); 
    

    @Override 
    public void setup() { 
        System.out.println("hello"); 
        this.size(500, 400); 
        this.background(255); 
        this.words.fromTextString(tweetsList.get(tweetsList.size()-2));
        this.words.drawAll(); 
        this.save("positive"); 
    }
    
} 