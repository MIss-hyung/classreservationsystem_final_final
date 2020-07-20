<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn {
margin-top: 20px;
  color: #4c4c4c;
	text-decoration: none;
	padding: 7px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
}
.btn:hover {
	color: white;
	background-color: #39404d;
}
</style>
</head>

<body>
<div align="center">
<h2>예약 안내</h2> 
최대 3시간 예약 가능<br>
<% String today = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date()); %>
오늘<%=today %>기준 
<p>
<% java.util.Calendar cal = java.util.Calendar.getInstance();
java.text.DateFormat format = new java.text.SimpleDateFormat("yyyy/MM/dd");
cal.add(cal.DATE, 3); // 3일 더함
String starttime = format.format(cal.getTime());
java.util.Calendar calm = java.util.Calendar.getInstance();
calm.add(calm.DATE, 30); // 30일 더함
String endtime = format.format(calm.getTime());%>
<%=starttime %>부터 <%=endtime %>까지 예약 가능
</p>
<h2>패널티 안내</h2> 
3일전 취소 시 1주간 예약 불가<br>
당일 취소 시 2주간 예약 불가<br>
한 학생당 한달에 4번만 예약 가능<br>
<button class='btn' type="button" onclick="javascript:self.close();">Close</button>
</div>
</body>
</html>