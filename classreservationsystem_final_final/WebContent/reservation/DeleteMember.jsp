<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	ServletContext sc = getServletContext();
	Member member = DBUtil.memberout(sc, id);
	
	out.println("<script>alert('회원 탈퇴가 완료되었습니다!');</script>");

	response.sendRedirect("../main.html");
	//RequestDispatcher view = request.getRequestDispatcher("../main.html");
	//view.forward(request, response);
	//session.invalidate();
%>

</body>
</html>