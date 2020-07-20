<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.DBConnection" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="javax.servlet.RequestDispatcher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
String id = request.getParameter("id");

System.out.println("confirm " + id);

%>

<script type="text/javascript"> //이메일 입력방식 선택 
function select(userinput){ 
	var select = userinput.reject_reason.value;
	if(select == "4"){
		userinput.reason.value = '';
		userinput.reason.readOnly = false;
	}else{
		userinput.reason.value = '';
		userinput.reason.readOnly = true;
	}
}
	
</script>


</head>
<body>
<form method="post" action="permissionupdate.jsp" name="list">
<input type="hidden" name = "id" name = "id" value="<%=id%>"> 

거부사유: <select name="reject_reason" onchange="select(this.form)" class="custom-select"> <!-- clickon(this) -->
		
           <option value="1" selected>사용용도 부적합</option>
           <option value="2">패널티 과다</option>
           <option value="3">해당날짜 full</option>
           <option value="4">기타(직접입력)</option>
         </select>
         
         <input type="text" name="reason" readonly="readonly"/>
         <input type = submit name = "button" value = "확인"></input>
         </form>
         

</body>
</html>