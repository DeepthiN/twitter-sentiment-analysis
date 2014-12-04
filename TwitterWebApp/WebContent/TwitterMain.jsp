<%@page import="com.oodproject.TweetAnalyzer"%>
<%@page import="java.util.*"%>
<%@page import="static java.lang.System.*"%>

<%!String positive, negative;%>

<%
	if (request.getMethod() == "POST") {
        TweetAnalyzer tweetAnalyzer = new TweetAnalyzer();
        List<String> stringList=  tweetAnalyzer.generateString(request.getParameter("hashtag"));
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
   
	<form id="appletForm" name="showApplet" action="WordCloudApplet.jsp">
		<input type="submit" value="Show Word Cloud">
	</form>

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