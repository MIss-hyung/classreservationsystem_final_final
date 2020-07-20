<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.sql.*"%>   
<%@ page import="model.Cancel" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@page import="java.util.*"%>
<%@page import= "java.util.Date"%>
<%@ page import="model.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="model.Cancel" %>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <script type="text/javascript">

function submit() 
{ 
var f = document.f; 
/* alert( f.var1.value ); 
alert( f.var2.value );  */
f.submit(); 
} 

</script> -->

<%
String user_id = request.getParameter("id");
System.out.println("Call confirm id           " + user_id);

%>

</head>
<body> <!-- onload="javascript:submit()" -->

<%
//db 에서 예약가능한 날짜 불러오기
Connection con = null;
PreparedStatement psm = null;
ResultSet rs = null;
String sql="SELECT * FROM cancel WHERE user_id =\""+user_id+"\";";
System.out.println("Call confirm sql        " + sql);
try{
	con = DBConnection.getCon();
	psm = con.prepareStatement(sql);
	rs = psm.executeQuery();
	
	List<Date> value = new ArrayList<Date>();
	
	while(rs.next()){
 		String availabledate = rs.getString("availabledate");
 		user_id = rs.getString("user_id");
	 
 		System.out.println("예약가능날짜 " + availabledate);
 		
		
 		java.text.SimpleDateFormat transFormat = new java.text.SimpleDateFormat("yyyy/MM/dd");
		java.util.Date availabledateToDate = transFormat.parse(availabledate);
		System.out.println("date         :" + availabledateToDate);
	
		value.add(availabledateToDate);
		
	} System.out.print(value);
	System.out.println("배열 사이즈    " + value.size());

/* int i = Collections.max(value);
System.out.println("예약i    " + i); */

java.text.SimpleDateFormat Format = new java.text.SimpleDateFormat("yyyy/MM/dd");
String maxDate;
if(value.size() == 0 ){
	maxDate = "";
}else{
maxDate = Format.format(Collections.max(value));}


System.out.println("예약안되는 maxDate    " + maxDate);


%>

<form id='gopage' name="calldate" method="post" action="reser_stu.jsp"> 
<input type="hidden" name = "user_id" value="<%=user_id%>">

<input type="hidden" name="availabledate" value="<%=maxDate %>">
</form>

<script> 
 document.getElementById('gopage').submit(); 
</script>

<%
	}catch(SQLException se){
		se.printStackTrace();
	}


/* response.sendRedirect("reser_stu.jsp"); */

%>


</body>
</html>