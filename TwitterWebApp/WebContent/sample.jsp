
<%@page import="com.oodproject.What2Think"  %>

<%@page import="java.util.*" %>
<%@page import= "static java.lang.System.*" %>

<%
    if (request.getMethod() == "POST") {
        What2Think what2Think = new What2Think();
        List<String> stringList=  what2Think.generateString(request.getParameter("userId"));
        for (int i=0; i < stringList.size()-1; i++) {
        	if (stringList.get(i).length() < 150)
        	out.println(stringList.get(i) + "<br> <br>");
        	}
        out.println(request.getParameter("userId"));
    }
%>


<html>
<head>
<title>Twitter App</title>
</head>
<body>
<h2 align="center">Please Enter a twitter Hash tag</h2>

<form name="myForm" method="post">
  <input type="text" name="userId" id="userId" value="#" />
  <input type="submit" value="Submit" />
</form>


<jsp:plugin align="middle" height="400" width="500" type="applet"  code="com.oodproject.WordCloud.class" 
 archive = "Version_1.0.jar, processing-core-1.0.3_0.1.0.jar, WordCram.jar, cue.language.jar"
name="cloud" codebase=".">
<jsp:params>
<jsp:param name="applicationURL" value="Welcome! We need your help to improve wikiHow. Click 'Start' to try an activity below"/> </jsp:params>
 </jsp:plugin>




</body>
</html>