<html>
<head>
<title>Twitter App</title>
</head>
<body>
	<!-- Retrieve negative and positive tweets from session storage, and use them to generate two word clouds -->
	<%
		String positive, negative;
		positive = session.getAttribute("positive").toString();
		negative = session.getAttribute("negative").toString();
	%>

	<p>Positive tweets</p>
	<jsp:plugin align="middle" height="400" width="500" type="applet"
		code="com.oodproject.WordCloud.class"
		archive="Version_1.0.jar, processing-core-1.0.3_0.1.0.jar, WordCram.jar, cue.language.jar"
		name="cloud" codebase=".">
		<jsp:params>
			<jsp:param name="applicationURL" value="<%=positive%>" />
		</jsp:params>
	</jsp:plugin>

	<p>Negative tweets</p>
	<jsp:plugin align="middle" height="400" width="500" type="applet"
		code="com.oodproject.WordCloud.class"
		archive="Version_1.0.jar, processing-core-1.0.3_0.1.0.jar, WordCram.jar, cue.language.jar"
		name="cloud" codebase=".">
		<jsp:params>
			<jsp:param name="applicationURL" value="<%=negative%>" />
		</jsp:params>
	</jsp:plugin>
</body>
</html>