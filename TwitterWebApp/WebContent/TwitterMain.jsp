<%@page import="com.oodproject.TweetAnalyzer"%>
<%@page import="com.oodproject.TweetResults"%>
<%@page import="java.util.*"%>
<%@page import="static java.lang.System.*"%>

<%!
String positive;
String negative;
 %>

<%
	if (request.getMethod() == "POST") {
        TweetAnalyzer tweetAnalyzer = new TweetAnalyzer();
        TweetResults tweetResult = tweetAnalyzer.generateString(request.getParameter("hashtag"));
        List <String> stringList = tweetResult.tweets;
        for (int i=0; i < stringList.size(); i++) {
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
%>



<html>
<head>
<title>Twitter App</title>
<link rel="stylesheet" type="text/css" href="resources/style.css">
<script src="resources/Chart.js"></script>

<script>
	document.addEventListener("DOMContentLoaded", function(event) { 
		hideButton = <% if (request.getMethod() == "POST") { out.println("false"); } else { out.println("true"); }  %>;
		if (hideButton) {
			button = document.getElementById("wordClowdBox");
			console.log(button);
			button.style.display = 'none';
			
		}
	});
	
	var randomScalingFactor = function(){ return Math.round(Math.random()*100)};

	var barChartData = {
	labels : ["0","1","2","3","4","5"],
	datasets : [
	{
	fillColor : "rgba(220,200,220,0.5)",
	strokeColor : "rgba(220,200,220,0.8)",
	highlightFill: "rgba(220,200,220,0.75)",
	highlightStroke: "rgba(220,200,220,1)",
	data : <% 
	TweetAnalyzer tweetAnalyzer = new TweetAnalyzer();
	TweetResults tweetResult = tweetAnalyzer.generateString(request.getParameter("hashtag"));
	out.println(tweetResult.scores);%>
	}
	
	]

	}
	window.onload = function(){
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myBar = new Chart(ctx).Bar(barChartData, {
	responsive : true
	});
	}

</script>

</head>
<body>
	<img src="resources/twitter-logo-bird.gif" style="display: block;margin-left: auto;margin-right: auto;height:500px">
	<h3 align="center">Enter a Hash tag to get tweets</h3>

	<form name="myForm" method="post" >
		<input type="text" name="hashtag" id="hashtag" value="#" size="20" /> 
		
		 <br>
   		 <br>
		<input type="submit" value="Submit" onClick="showButton()" style="display: block;margin-left: auto;margin-right: auto;" />
	</form>
    <div id="wordClowdBox">
		<form id="appletForm" name="showApplet" action="WordCloudApplet.jsp">
			<input type="submit" value="Show Word Cloud">
		</form>
		<div style="width: 50%">
		<canvas id="canvas" height="450" width="600"></canvas>
		</div>
	</div>

	<script>
		/* function showAppletButton(){
		 document.getElementByName(showApplet).style.visibility = "visible";
		 } */

		function showButton() {
			document.getElementById("appletForm").style.display = 'visible';
		}
	</script>

</body>
</html>