<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@ page import="java.sql.*"%>   
<%@ page import="model.Reserve" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<% 
String button = request.getParameter("button");
String id = (String)session.getAttribute("id");
String count = (String)session.getAttribute("count");
/* int count = ((Integer)request.getAttribute("count")).intValue(); */
System.out.println("id" + id);
System.out.println("countttttttttdown" + count);

ServletContext sc = getServletContext();

System.out.println("count" + count);

Member member = DBUtil.countUpdate(sc, button, id, count);

/* request.setAttribute("count", count); */

response.sendRedirect("reser_stu_main.jsp");

%>
</head>
<body>

</body>
</html>