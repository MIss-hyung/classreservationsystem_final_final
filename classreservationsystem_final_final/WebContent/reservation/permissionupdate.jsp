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
String id = request.getParameter("id");
String rejectreason = request.getParameter("reject_reason");
String reason = request.getParameter("reason");
System.out.println("permissiontupdate.jsp button" + button);
System.out.println("permissiontupdate.jsp id" + id);
int permissionstate = 0;

if(!button.equals("OK")){
	
 if(rejectreason.equals("1")){
	rejectreason="사용용도 부적합";
	    }
	    else if(rejectreason.equals("2")){
	    	rejectreason="패널티 과다";
	    }else if(rejectreason.equals("3")){
	    	rejectreason="해당날짜 full";
	    }else if(rejectreason.equals("4")){
	    	rejectreason=reason;
	          } 
}
System.out.println("rejectreason" + rejectreason);
ServletContext sc = getServletContext();
Reserve reserve = DBUtil.permissionupdate(sc, button ,id, permissionstate, rejectreason);

request.setAttribute("rejectreason", rejectreason);

System.out.println("permissiontupdate.jsp permissionstate " + permissionstate);

response.sendRedirect("reser_ad_main.jsp");

%> 

</head>
<body>

</body>
</html>