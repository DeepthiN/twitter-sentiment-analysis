
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
<title>Input JSp</title>
</head>
<body>
<h2 align="center">Enter a twitter Hash tag</h2>

<form name="myForm" method="post">
  <input type="text" name="userId" id="userId" value="#" />
  <input type="submit" value="Submit" />
</form>

<object 
  data="com.oodproject.WordCloud" 
  codebase="."
  archive="MyApplet.jar" 
  width=400
  height=400>
</object>

</body>
</html>