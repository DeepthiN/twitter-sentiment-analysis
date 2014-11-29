<%
    if (request.getMethod() == "POST") {
    	What2Think what2Think = new What2Think();
    	List<String> stringList=  what2Think.generateString("#Android");
    
        for (int i=0; i < stringList.size()-2; i++) {
        	out.println(stringList.get(i) + "<br> <br>");
        	}
        out.println(request.getParameter("userId"));
    }
%>
<%@ page import="com.oodproject.TweetManager" %>
<%@ page import="com.oodproject.What2Think" %>
<%@ page import="com.oodproject.WordCloud" %>
<%@ page import="java.util.*" %>
<%@ page import= "static java.lang.System.out" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Twitter App</title>
</head>
<body>
<%-- 
	<%!
    private What2Think what2Think = new What2Think();
	private List<String> stringList=  what2Think.generateString("#Android");
	%>
	
    <%
    for (int i=0; i < stringList.size()-2; i++) {
    	out.println(stringList.get(i) + "<br> <br>");
    	}
	%> --%>
	
	<!-- <OBJECT 
  classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
  width="200" height="200">
  <PARAM name="code" value="com.oodproject.WordCloud.class">
</OBJECT> -->

<%-- <jsp:plugin type="applet" codebase="Version_1.0.jar" code ="WordCloud.class" width="200" height="200"/>  --%>
<!-- <applet code = "WordCloud.class" archive = "Version_1.0.jar, processing-core-1.0.3_0.1.0.jar, stanford-corenlp-3.5.0-models.jar, standford-corenlp-3.5.0.jar, twitter4j-core-4.0.2.jar" width="200" height="200"> </applet>
	<p>Enter the twitter search word</p> -->
	<input type="text" id="myText" value="#">
	<button onClick="sendInput">Submit</button>
	<p id ="demo"> </p>


	<script>
		function sendInput() {
     	var x = document.getElementById("myText").value;
     	
		document.getElementById("demo").innerHTML = chars;
		}
	</script>
</body>
</html>