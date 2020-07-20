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

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);

@import
	url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300)
	;


.header div {
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 25px;
	font-weight: 200;
}

::-webkit-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}

::-moz-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}

.modal-footer {
	text-align: center;
	margin-top: 10px;
	font-size: 13px;
	justify-content: center;
	color: #fff;
}

.user-type {
	text-align: center;
	margin-bottom: 10px;
}
</style>
<style type="text/css">

.con-table {
	color: #4c4c4c; 
	margin-left:450px;
}

.button {
margin-left:20px;
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

.button:hover {
	color: white;
	background-color: #39404d;
}

.button:active {
	color: white;
	background-color: #39404d;
}

.button:focus {
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
	padding: 10px
}

th {
	padding: 10px
}
.line{border-bottom:2px solid #4c4c4c;}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="../style.css">

</head>
<body>

<body>

	<%String id = (String) session.getAttribute("id");
String phonenum = (String) session.getAttribute("phonenum");%>
	<%Member member = new Member(); %>
	<div id="wrapper">
		<main> 
		<header id="app-header" class="app-header">

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
				<li class="sidebar-brand"><a href="#"> 강의실을 부탁해 </a></li>
			<br>
			<br>
			<br>
			<li><a href="#"><i class="fa fa-fw fa-file-o"></i> 관리자 : <%=id %>
			</a></li>
			<li><a href="#"><i class="fa fa-fw fa-file-o"></i> 전화번호 : <%=phonenum %></a></li>
			<li><a href="reser_ad_main.jsp"><i class="fa fa-home fa-fw"></i> &nbsp; 홈으로 돌아가기 </a></li>
			<li><a href="#" onclick="logoutCheck();"><i
					class="fa fa-fw fa-twitter"></i> 로그아웃 </a></li>
		</ul>
		</nav>

		<button type="button" class="hamburger is-closed animated fadeInLeft"
			data-toggle="offcanvas">
			<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
				class="hamb-bottom"></span>
		</button>
		
		<h5 align="center">관리자님의 일정 추가 목록</h5>
		<%
		System.out.println(id);
		//db 에서 사용자가 예약한 내용 얻어와 테이블에 출력하기.
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try{
			//
			con = DBConnection.getCon();
			String sql="SELECT * From administratormanage WHERE cancelstate=0 and administrator_id =\""+id+"\";";
			
			psm = con.prepareStatement(sql);
			rs = psm.executeQuery();
			System.out.println(sql);
			while(rs.next()){
				String indexid = rs.getString("id");
				String date = rs.getString("date");
				String place = rs.getString("place");
				String classroom = rs.getString("classroom");
				String starttime = rs.getString("starttime");
				String stay = rs.getString("stay");
				
			
				
				System.out.println("administrator ai 아이디값  " + indexid);
				
				
				int endtime =  Integer.parseInt(starttime) + Integer.parseInt(stay);
	
				//String requestdate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
				
%>

<%-- <h5 align="center"><%=name %>의 예약내역</h5> --%>
		

		<table class="con-table" cellspacing='1'>
			<tbody>
			<br>

				<tr>
					<td>날 짜</td>
					<td class="con-info"><%=date %></td>
				</tr>

				<tr>
					<td>장 소 </td>
					<td class="con-info"><%=place %></td>
				</tr>
				<tr>
					<td>강의실 &nbsp;</td>
					<td class="con-info"> <%=classroom %> 호 </td>
				</tr>
				
				<tr>
					<td>시 간</td>
					<td class="con-info"><%=starttime%>:00 ~ <%=endtime %>:00 (사용시간 : <%=stay %>시간)</td>
					<form method="post" action= "reser_ad_cancel.jsp" onsubmit="return reserCancelCheck();">
		<input type="hidden" name = "id" value="<%=id%>">
		<input type="hidden" name = "indexid" value="<%=indexid%>">
		<input type="hidden" name = "date" value="<%=date%>">
		<td class="btn-ok"><input type =submit name = "button" class="button" value = "일정삭제" ></input></td>
		</form>
		
				</tr>


		<td></td>

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
				if(rs!=null)  rs.close();
				if(psm!=null)  psm.close();
				if(con!=null)  con.close();
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
</html>