<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
 
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의실을 부탁해</title>

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

<style>


.body{
margin-left:50px;
}
.line{border-bottom:2px solid #4c4c4c;}


.content {
	background-color: #ddd;
	background-image: -webkit-linear-gradient(to bottom, #cdcdcd 0%, #cdcdcd 70%);
  	background-image: linear-gradient(to bottom, #cdcdcd 0%, #cdcdcd 100%);
	margin: 20px 20px;
}

.con-date {
	color: #4c4c4c; 
	padding: 30px 50px;
}

.con-table {
	color: #4c4c4c; 
	margin-left:450px;
}

.con-info {
	color: #004080;
	padding: 0 50px;
}

.btn-ok {
text-decoration: none;
	padding-left:;
	
	
}

.btn-no {
text-decoration: none;
	padding: 50px 50px;
}

.btn-cancel {
	padding: 50px 70px;
}

.btn {
	color: #4c4c4c;
	text-decoration: none;
	padding: 7px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
/* 	border-color: #b3b3b3;
	border: 1px solid; */
}

.btn:hover {
	color: #white;
	background-color: #39404d;
}

.btn:active {
	color: #white;
	background-color: #39404d;
}

.btn:focus {
	color: #4c4c4c;
	text-decoration: none;
	padding: 7px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
}

td {
	padding: 5px
}

th {
	padding: 10px
}
</style>
</head>

<body>
<%String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
%>

<% session.setAttribute("id",id);
session.setAttribute("name" , name);

request.setAttribute("id",id);
request.setAttribute("name" , name);

%>
<%
//마이페이지 정보 띄우기 
Connection con = null;
PreparedStatement psm = null;
ResultSet rs = null;

String sql="SELECT * From user WHERE id =\""+id+"\";";
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
				<li><a href="#"> ● 이름 : <%=name%> 님
				</a></li>
				<li><a href="#"> ● 학번 : <%=id %>
				</a></li>
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
		<h5 align="center"><%=name %>님의 예약내역</h5>
		<%
		
		System.out.println(id);
		//db 에서 사용자가 예약한 내용 얻어와 테이블에 출력하기.
		Connection con1 = null;
		PreparedStatement psm1 = null;
		ResultSet rs1 = null;
		
		try{
			//
			con1 = DBConnection.getCon();
			String sql1="SELECT * From reservation WHERE cancelstate=0 and user_id =\""+id+"\";";
			
			psm1 = con1.prepareStatement(sql1);
			rs1 = psm1.executeQuery();
			System.out.println(sql1);
			while(rs1.next()){
				String indexid = rs1.getString("id");
				String date = rs1.getString("date");
				String place = rs1.getString("place");
				String starttime = rs1.getString("starttime");
				String stay = rs1.getString("stay");
				String object = rs1.getString("object");
				String num = rs1.getString("num");
				String rejectreason = rs1.getString("rejectreason");
				String requestdate = rs1.getString("requestdate");
				
				System.out.println("myReservationList ai 아이디값  " + indexid);
				String permissionstate = rs1.getString("permissionstate");
				
				String permissiontext;
				
				if(permissionstate.equals("2")){
				 	permissiontext = "승인 거부";
				}else if(permissionstate.equals("1")){
					permissiontext = "승인 대기중";
					rejectreason ="";
				}else{
					permissiontext = "승인 완료";
					rejectreason ="";
				}
				
				int endtime = Integer.parseInt(starttime) + Integer.parseInt(stay);
				//String requestdate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
				
%>

<%-- <h5 align="center"><%=name %>의 예약내역</h5> --%>
		

		<table class="con-table" cellspacing='1'>
			<tbody>
			<br>

				<tr>
					<td>예약을 신청한 날짜 </td>
					<td class="con-info"><%=requestdate %></td>
				</tr>
				<tr>
					<td>날 짜</td>
					<td class="con-info"><%=date %></td>
				</tr>

				<tr>
					<td>장 소</td>
					<td class="con-info"><%=place %></td>
				</tr>

				<tr>
					<td>시 간</td>
					<td class="con-info"><%=starttime%>:00 ~ <%=endtime %>:00 (사용시간 : <%=stay %>시간)</td>
				</tr>

				<tr>
					<td>인 원</td>
					<td class="con-info"><%=num %></td>
				</tr>
				
				<tr>
					<td>용 도</td>
					<td class="con-info"><%=object %></td>
				</tr>
				
				<tr>
					<td>승인 여부 </td>
					<td class="con-info"><%=permissiontext%> <%=rejectreason%></td>
					
				<!-- 	<td class="btn-ok"><input type = button class="btn" value ="예약취소" onClick="reserCancelCheck()"></input></td> -->
		<form method="post" action= "reser_cancel.jsp" name="resercancel" onsubmit="return reserCancelCheck();">
		<input type="hidden" name = "id" value="<%=id%>">
		<input type="hidden" name = "indexid" value="<%=indexid%>">
		<input type="hidden" name = "date" value="<%=date%>">
		<td class="btn-ok"><input type = submit name = "button" class="btn" value = "예약취소" ></input></td>
		</form>
		
				</tr>

				<tr>
<td class="line"></td>
<td class="line"></td>
<td class="line"></td>
</tr>

				
				<%
			}
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}finally{
			try{
				if(rs1!=null)  rs1.close();
				if(psm1!=null)  psm1.close();
				if(con1!=null)  con1.close();
			}catch(SQLException se){
				System.out.println(se.getMessage());
			}
		}
	%>
			</tbody>
		</table>


		</main>
	</div>
	
	
	<script>
	function logoutCheck(){
	    
	    if( confirm("정말로 로그아웃하시겠습니까?") ){
	       
	        location.href="logout.jsp";
	    }
	}
	
	//예약취소하기
	  function reserCancelCheck(){
		if( confirm("정말로 예약을 취소하시겠습니까?") ){
		       
			alert("정상적으로 처리 되었습니다."); 
			return true;
			} else { 
			return false;

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