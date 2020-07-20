<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.DBUtil"%>
<%@ page import="model.Member"%>
<%@ page import="model.DBConnection"%>
<%@ page import="java.sql.Connection" %> 
<%@ page import="model.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Timestamp" %>
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

String user_id = (String)session.getAttribute("id");
String name =  request.getParameter("name");
String requestdate = request.getParameter("requestdate");
String day = request.getParameter("day");
String place = request.getParameter("place");
String classroom = request.getParameter("classroom");
String num =  request.getParameter("num");
String object =  request.getParameter("object");
String stay =  request.getParameter("stay");
String starttime = request.getParameter("starttime");


/*  String user_id = (String)request.getAttribute("id");
String name =  (String)request.getAttribute("name");
String requestdate = (String)request.getAttribute("requestdate");
String day = (String)request.getAttribute("day");
String place = (String)request.getAttribute("place");
String num =  (String)request.getAttribute("num");
String object =  (String)request.getAttribute("object");
String stay =  (String)request.getAttribute("stay");
String starttime =  (String)request.getAttribute("starttime"); */
int permissionstate = 1; 
String rejectreason = " ";
String cancelstate = "0";

System.out.println("user_id " + user_id);
System.out.println("name "+ name);
System.out.println("requestdate " + requestdate);
System.out.println("starttime " + starttime);
System.out.println("stay " + stay);
System.out.println("day " + day);
System.out.println("place " + place);
System.out.println("classroom " + classroom);
System.out.println("num " +num);
System.out.println("object " + object);




Reserve reserve = DBUtil.reservein(sc, day, requestdate, place, classroom, object, num, starttime, stay, permissionstate, user_id, rejectreason,cancelstate);
   
//out.println("<script>alert('회원가입 완료');</script>"); 	
//out.println("<script>alert('예약 저장 내역 완료 ');</script>"); 


//response.sendRedirect("../login.html");
 
%>    
<%
//마이페이지 갱신 
Connection con = null;
PreparedStatement psm = null;
ResultSet rs = null;

String sql="SELECT * From user WHERE id =\""+user_id+"\";";
System.out.println("Call confirm sql        " + sql);

try{
	con = DBConnection.getCon();
	psm = con.prepareStatement(sql);
	rs = psm.executeQuery();
	
	while(rs.next()){
		String major = rs.getString("major");
 		String email = rs.getString("email");
 		String phonenum = rs.getString("phonenum");
 		String count = rs.getString("count");
 		
	 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"> function goback() { location.href="reser_stu_main.jsp"; } </script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel="stylesheet" href="../css\style_reser_main.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,400italic|Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel="stylesheet" href="../css\header_style.css">

<style type="text/css">

.btn {
margin-top: 40px;
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
.form{
margin-top:70px;
text-align:center;
font-size: 20px;
}
</style>

</head>
<body>
<div id="wrapper">
		<main> <header id="app-header" class="app-header">

			<div class="background-container">
				<div id="background-back" class="background"></div>
				<div id="background-front" class="background"></div>
			</div>

		 	<div class="header-content">
				<div id="small-toolbar" class="app-toolbar">
					<div id="small-title" class="small-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				</div>  

			<div id="large-toolbar" class="app-toolbar tall">
				<div id="large-title" class="large-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size = 5>강의실을 부탁해</font></div>
				</div> 
			</div>
		</header>

		<nav class="navbar navbar-inverse navbar-fixed-top"
			id="sidebar-wrapper" role="navigation">

			<ul class="nav sidebar-nav">
				<br>
		
				<li class="sidebar-brand"><a href="#"> 마이페이지 </a></li>
				<li><a href="#"> ● 이름 : <%=name%> 님  </a></li>
				<li><a href="#"> ● 학번 :  <%=user_id %>   </a></li>
				<li><a href="#"> ● 전공 : <%=major%></a></li>
				<li><a href="#"> ● 이메일 : <%=email%></a></li>
				<li><a href="#"> ● 전화번호 : <%=phonenum%></a></li>	
			
				<li><a href="#"><i class="fa fa-fw fa-file-o"></i> 이번달 남은 예약횟수: <%=count%> </a></li>
				<li><a href="reser_stu_main.jsp"><i class="fa fa-home fa-fw"></i> &nbsp; 홈으로 돌아가기 </a></li>
				<li><a href="MypageEdit.jsp"><i class="fa fa-cog fa-fw"></i> &nbsp;&nbsp;마이페이지 수정 </a></li>
				<li><a href="#" onclick="logoutCheck();"><i
						class="fa fa-fw fa-twitter"></i>  &nbsp;&nbsp;로그아웃 </a></li>
				<li><a href="MemberOut.jsp"><i class="fa fa-fw fa-twitter"></i>
						 &nbsp;&nbsp;회원탈퇴</a></li>
			</ul>
		</nav>

		<button type="button" class="hamburger is-closed animated fadeInLeft"
			data-toggle="offcanvas">
			<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
				class="hamb-bottom"></span>
		</button>
		<div class=form>
예약이 완료되었습니다. 
<form method="post" action="countdown.jsp">
<input type="hidden" name = "user_id" value="<%=user_id%>">
<input type="submit" class=btn name = "button" value = "OK">
</form>
</div>
</main>
	</div>
	
	<script>
	function logoutCheck(){
	    
	    if( confirm("정말로 로그아웃하시겠습니까?") ){
	       
	        location.href="logout.jsp";
	    }
	}
	</script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js'></script>
	<script src="../js/header_index.js"></script>

	<div class="overlay"></div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
		
	<script src="../js\index.js"></script>

</body>
<%
		
   
}
	}catch(SQLException se){
		se.printStackTrace();
	}

%>
</html>