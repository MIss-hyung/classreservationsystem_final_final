<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="javax.servlet.RequestDispatcher" %>
 
<%
response.setContentType("text/html");
request.setCharacterEncoding("utf-8");  
response.setCharacterEncoding("utf-8");


ServletContext sc = getServletContext();
Connection conn = (Connection) sc.getAttribute("DBconnection");
/* PrintWriter out = response.getWriter(); */

RequestDispatcher requestDispatcher;

String id = request.getParameter("adminid"); 
String passwd = request.getParameter("adminpassword");
String phonenum =  request.getParameter("adminphonenumber");



System.out.println(id);
System.out.println(passwd);
System.out.println(phonenum);
	


   request.setAttribute("id", id);
   request.setAttribute("passwd", passwd);
   request.setAttribute("phonenum", phonenum);


   Member member = DBUtil.joinAdmin(sc, id, passwd, phonenum);
   
 
	out.println("<script>alert('회원가입되었습니다.');</script>");
    response.sendRedirect("../login.html");
 
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

</body>
</html>