<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="model.DBUtil"%>
<%@ page import="model.Member"%>
<%@ page import="model.DBConnection"%>
<%@ page import="java.sql.Connection" %> 
<%@ page import="model.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@page import="java.util.*"%>

<%String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
String count = (String) session.getAttribute("count");
String countdate = (String) session.getAttribute("countdate");
%>

<% session.setAttribute("id",id);
session.setAttribute("name" , name);
session.setAttribute("count" , count);
session.setAttribute("countdate" , countdate);

request.setAttribute("id",id);
request.setAttribute("name" , name);
request.setAttribute("count" , count);
request.setAttribute("countdate" , countdate);

String today = new java.text.SimpleDateFormat("yyyy/MM").format(new java.util.Date());
if(!today.equals(countdate)){
   count = "4";
   System.out.println(count);
}
System.out.println(count);
countdate = today;
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id='gopage' method="post" action="welcome_Result.jsp">
<input type="hidden" name = "id" value="<%=id%>">
<input type="hidden" name = "name" value="<%=name%>">
<input type="hidden" name = "count" value="<%=count%>">
<input type="hidden" name = "countdate" value="<%=countdate%>">
</form>

<script> 
 document.getElementById('gopage').submit(); 
</script>
</body>



<%--    <%response.sendRedirect("reser_stu_main.jsp"); %> --%>
</html>