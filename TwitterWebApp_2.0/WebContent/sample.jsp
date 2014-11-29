<html>
<head>
<title>Input JSp</title>
</head>
<body>

<jsp:plugin align="middle" height="400" width="500" type="applet"  code="com.oodproject.WordCloud.class" 
 archive = "Version_1.0.jar, processing-core-1.0.3_0.1.0.jar, WordCram.jar, cue.language.jar"
name="cloud" codebase="."/>

<h2 align="center">Enter a twitter Hash tag</h2>

<form name="myForm" method="post">
  <input type="text" name="userId" id="userId" value="#" />
  <input type="submit" value="Submit" />
</form>

</body>
</html>