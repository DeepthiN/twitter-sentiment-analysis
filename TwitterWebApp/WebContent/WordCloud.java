package com.oodproject;

/*
 * Uses WordCram API to make work clouds for positive and negative tweets
 */

import processing.core.*;
import wordcram.*;

public class WordCloud extends PApplet {

	private static final long serialVersionUID = 1L;

	WordCram words = new WordCram(this);

	@Override
	public void setup() {
			System.out.println("hello");
			this.size(500, 400);
			this.background(255);
			this.words
					.fromTextString(getParameter("applicationURL").toString());
			this.words.drawAll();
	}

}