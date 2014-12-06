<%@page import="com.oodproject.TweetAnalyzer"%>
<%@page import="com.oodproject.TweetResults"%>
<%@page import="java.util.*"%>
<%@page import="static java.lang.System.*"%>

<!-- Global variables used for session storage -->
<%!
String positive;
String negative;
 %>

<%
	if (request.getMethod() == "POST") {
        TweetAnalyzer tweetAnalyzer = new TweetAnalyzer();
        TweetResults tweetResult = tweetAnalyzer.generateString(request.getParameter("hashtag"));
        List <String> stringList = tweetResult.getTweets();
        
      // If no tweets are returned, stringList size would be '9' (from TweetAnalyzer class)
        if (stringList.size() < 10) {
        	out.println("Sorry, we couldn't find tweets for "+ request.getParameter("hashtag") + 
        			". Please try some other key word." + "<br> <br>");
        	session.setAttribute("positive", null);	
        	session.setAttribute("negative", null);
        } else {
        out.println("Here are some recent tweets for "+ request.getParameter("hashtag") +
        			"<br> <br>");
        		
        for (int i=0; i < stringList.size(); i++) {
        	// A tweet has a max. of 140 characters.
        	// So anything above 150 is a string that contains all the positive or negative tweets
        	if (stringList.get(i).length() < 150) { 
        	out.println(stringList.get(i) + "<br> <br>");
        	 } else if (stringList.get(i).contains("Tweets with positive Sentiment Score")) {
        		positive = stringList.get(i);
        		session.setAttribute("positive", positive);
        	} else 
        		negative = stringList.get(i); 
        		session.setAttribute("negative", negative);
        }
        }
    }
%>



<html>
<head>
<title>Twitter App</title>
<link rel="stylesheet" type="text/css" href="resources/style.css">
<script src="resources/Chart.js"></script>

<script>

// Show wordcloud and chart only if there are tweets, else hide those buttons
	document
			.addEventListener(
					"DOMContentLoaded",
					function(event) {
						hideButton =
<% if (request.getMethod() == "POST" && (session.getAttribute("positive") != null || session.getAttribute("negative") != null))
		{ out.println("false"); } else { out.println("true"); }  %>
	;
						if (hideButton) {
							button = document.getElementById("wordClowdBox");
							console.log(button);
							button.style.display = 'none';
						}
					});
	
   // Code for sentiment score chart
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100)
	};

	var barChartData = {
		labels : [ "Very Negative", "Negative", "Neutral", "Positive",
				"Very Positive" ],
		datasets : [ {
			fillColor : "rgba(85,172,238,0.5)",
			strokeColor : "rgba(85,172,238,0.8)",
			highlightFill : "rgba(85,172,238,0.75)",
			highlightStroke : "rgba(85,172,238,1)",
			data :
<% 
	TweetAnalyzer tweetAnalyzer = new TweetAnalyzer();
	// Data used to generate charts
	TweetResults tweetResult = tweetAnalyzer.generateString(request.getParameter("hashtag"));
	out.println(tweetResult.getScores());%>
	}

		]

	}
	window.onload = function() {
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});
	}
</script>

</head>
<body>
	<div id="wordClowdBox">
		<form id="appletForm" name="showApplet" action="WordCloudApplet.jsp">
			<input type="submit" value="Show Word Cloud">
		</form>
		<div style="width: 50%">
			<canvas id="canvas" height="450" width="600"></canvas>
		</div>
	</div>
	<img src="resources/twitter-logo-bird.gif"
		style="display: block; margin-left: auto; margin-right: auto; height: 500px">
	<h3 align="center">Enter a key word to get tweets</h3>

	<form name="myForm" method="post">
		<input type="text" name="hashtag" id="hashtag" value="#" size="20" />

		<br> <br> <input type="submit" value="Submit" id="submit"
			style="display: block; margin-left: auto; margin-right: auto;" />
	</form>


</body>
</html>