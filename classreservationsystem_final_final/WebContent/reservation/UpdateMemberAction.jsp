<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@ page import="java.sql.*"%>  

<%

response.setContentType("text/html");
request.setCharacterEncoding("utf-8");  
response.setCharacterEncoding("utf-8");

    String id = (String)session.getAttribute("id");
    String passwd = request.getParameter("passwd");
    String major = request.getParameter("major");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phonenum = (String) request.getParameter("phonenum");
    

request.setAttribute("id", id);
request.setAttribute("passwd", passwd);
request.setAttribute("name", name);
request.setAttribute("major", major);
request.setAttribute("email", email);
request.setAttribute("phonenum", phonenum);
request.setAttribute("loginpermission", 1);
    
System.out.println("Update id " +id);
//System.out.println("Update passwd " +passwd);
System.out.println("Update major " +major);
//System.out.println("Update name " +name);
System.out.println("Update email " +email);
System.out.println("Update phonenum" +phonenum);

 
    ServletContext sc = getServletContext();
    Member member = DBUtil.modifyMemberInfo(sc, id, major, email, phonenum);
    out.println("<script>alert('회원정보가 변경되었습니다.');</script>");
    

request.setAttribute("id", id);
request.setAttribute("passwd", passwd);
request.setAttribute("name", name);
request.setAttribute("major", major);
request.setAttribute("email", email);
request.setAttribute("phonenum", phonenum);
request.setAttribute("loginpermission", 1);

     response.sendRedirect("reser_stu_main.jsp");
     
     System.out.println("aUpdate id " +id);
     System.out.println("aUpdate major " +major);
     System.out.println("aUpdate email " +email);
     System.out.println("aUpdate phonenum " +phonenum);

 /*    RequestDispatcher view = request.getRequestDispatcher("reser_stu_main.jsp");
    view.forward(request, response); */
    //DBConn db = new DBConn();
    //Connection conn = db.getConnection();
  
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>