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

//int id = Integer.parseInt(request.getParameter("userid")); 
String id = request.getParameter("userid");
//String userpasswordconfirm = (String) request.getParameter("userpasswordconfirm"); 
String name = request.getParameter("username");
String major =  request.getParameter("major");
String passwd = request.getParameter("userpassword");
String email = request.getParameter("email");
String phonenum =  request.getParameter("phonenumber");
String countdate = new java.text.SimpleDateFormat("yyyy/MM").format(new java.util.Date());
String count = "4";
int loginpermission=1;



System.out.println(id);
System.out.println(name);
System.out.println(major);
System.out.println(passwd);
System.out.println(email);
System.out.println(phonenum);
System.out.println(countdate);

   


request.setAttribute("id", id);
request.setAttribute("passwd", passwd);
request.setAttribute("name", name);
request.setAttribute("major", major);
request.setAttribute("email", email);
request.setAttribute("phonenum", phonenum);

Member member = DBUtil.joinUser(sc,id,name,major,passwd,email,phonenum,countdate,count,loginpermission);
   
//out.println("<script>alert('회원가입 완료');</script>");    
out.println("<script>document.write('회원가입 완료');</script>"); 

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