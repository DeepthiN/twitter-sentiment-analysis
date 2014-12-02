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
</head>
<body>
	<h2 align="center">Please Enter a twitter Hash tag</h2>

	<form name="myForm" method="post">
		<input type="text" name="hashtag" id="hashtag" value="#" /> <input
			type="submit" value="Submit" onClick="showButton()" />
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