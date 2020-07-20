<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Reserve" %>
<%@ page import="java.sql.Connection" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");


String id = request.getParameter("id");
String indexid = request.getParameter("indexid");

System.out.println("reser_cancelresult.jsp id" + id);
System.out.println("reser_cancelresult.jsp indexid" + indexid);

String canceldate="1";

ServletContext sc = getServletContext();
Reserve Reserve = DBUtil.CancelstateUpdate(sc, canceldate, indexid);

response.sendRedirect("reser_stu_main.jsp");

%>
</body>
</html>