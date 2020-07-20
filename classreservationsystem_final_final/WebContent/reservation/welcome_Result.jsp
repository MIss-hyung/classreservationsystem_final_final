<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
response.setContentType("text/html");
request.setCharacterEncoding("utf-8");  
response.setCharacterEncoding("utf-8");


ServletContext sc = getServletContext();
Connection conn = (Connection) sc.getAttribute("DBconnection");
/* PrintWriter out = response.getWriter(); */

RequestDispatcher requestDispatcher;

String id = request.getParameter("id");
String name = request.getParameter("name");
String count = request.getParameter("count");
String countdate = request.getParameter("countdate");


//한달이 지나면 업데이트 시켜주는 쿼리문 호출 
Member member = DBUtil.MonthUserCountUpdate(sc,id, count, countdate);

response.sendRedirect("reser_stu_main.jsp");
%>

<% session.setAttribute("id",id);
session.setAttribute("name" , name);

request.setAttribute("id",id);
request.setAttribute("name" , name);

%>
</body>
</html>