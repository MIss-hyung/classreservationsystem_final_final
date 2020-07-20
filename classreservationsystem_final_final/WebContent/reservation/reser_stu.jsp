<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.DBUtil"%>
<%@ page import="model.Member"%>
<%@ page import="model.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
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
.roomstay table, tr, td {
	border: 1px solid black;
}

.button {
	margin-top: 70px;
	color: #4c4c4c;
	text-decoration: none;
	padding: 7px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
}

.button:hover {
	color: white;
	background-color: #39404d;
}

.button:active {
	color: #abb4be;
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

.button2 {
	color: #4c4c4c;
	text-decoration: none;
	padding: 7px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
}

.button2:hover {
	color: white;
	background-color: #39404d;
}

.button2:active {
	color: #abb4be;
	background-color: #39404d;
}

.button2:focus {
	color: #4c4c4c;
	text-decoration: none;
	padding: 7px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
}
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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../style.css">

<script>
 $(document).ready(function(){
       $('#datepicker').datepicker({
          minDate : 3,
          maxDate : 30,
           dateFormat : 'yy/mm/dd',
           altField : "#datepicker",
      });

   });
 </script>


<script type="text/javascript">

//예약시스템안내
function clickon() {

      window.open("reservationExplain.jsp", "", "width=500, height=400, status=1");

   }
   
 
   
</script>

</head>
<body>

	<%String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");

%>

	<% session.setAttribute("id",id);
session.setAttribute("name" , name);


request.setAttribute("id",id);
request.setAttribute("name" , name);

String availabledate =(String)request.getParameter("availabledate");
System.out.println("maxdate   reser_stu.jsp  : " + availabledate);
java.text.SimpleDateFormat transFormat = new java.text.SimpleDateFormat("yyyy/MM/dd");

//현재날짜구하기
String requestdate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
java.util.Date currentday = transFormat.parse(requestdate);
System.out.println("현재날짜 currentday   " + currentday);

java.util.Date availabledateToDate;
if(availabledate==""){
	//max데이를 데이트타입으로 바꾼거에 현재날짜를 넣어줌 
	availabledateToDate = currentday;
}else{
 availabledateToDate = transFormat.parse(availabledate);
 }


long diff = availabledateToDate.getTime() - currentday.getTime();
long diffDays = diff / (24 * 60 * 60 * 1000);

System.out.println("날짜차이=" + diffDays);

%>
	<%

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

	<%Member member = new Member(); %>


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
					<div id="large-title" class="large-title">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=5>강의실을 부탁해</font>
					</div>
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

				<li><a href="#"><i class="fa fa-fw fa-file-o"></i> 이번달 남은
						예약횟수: <%=count%> </a></li>
				<li><a href="reser_stu_main.jsp"><i
						class="fa fa-home fa-fw"></i> &nbsp; 홈으로 돌아가기 </a></li>
				<li><a href="MypageEdit.jsp"><i class="fa fa-cog fa-fw"></i>
						&nbsp;&nbsp;마이페이지 수정 </a></li>
				<li><a href="#" onclick="logoutCheck();"><i
						class="fa fa-fw fa-twitter"></i> &nbsp;&nbsp;로그아웃 </a></li>
				<li><a href="MemberOut.jsp"><i class="fa fa-fw fa-twitter"></i>
						&nbsp;&nbsp;회원탈퇴</a></li>
			</ul>
		</nav>

		<button type="button" class="hamburger is-closed animated fadeInLeft"
			data-toggle="offcanvas">
			<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
				class="hamb-bottom"></span>
		</button>
	
		<center>
			<div>
				<p>
					<button type="button" class="button" onclick="clickon()">예약시스템안내</button>
				</p>
				<form method="post" name="reservation_1" action="ajax_reser_stu.jsp">
					<p>
						날짜조회 : <input type="text" name="re_day" id="datepicker" readonly>
					</p>
					<p>
						장소조회 : <select name="re_place" class="custom-select">
							<option value="1">수정관</option>
							<option value="2">성신관</option>
							<option value="3">난향관</option>
						</select>
					</p>


					<button type="button" class="button2" onclick="check_1()">조회하기</button>
				</form>

			</div>
		</center>


		</main>
	</div>
	<script>
	
	  var availabledate = "<%=availabledate%>";
	  var availabledateToDate = "<%=availabledateToDate%>";
	  var currentday = "<%=currentday%>";
	  var diffDays = "<%=diffDays%>";
	
   
	   //조회하기
	   function check_1(){
			  
		   var count1 = "<%=count%>";
		   
	       if (document.reservation_1.re_day.value == "") {
	          alert('날짜를 선택해주세요.' );
	       }else if(count1=="0"){
	    	   alert("한달 예약횟수를 초과하였습니다. - 한달 예약 가능한 횟수는 4번 입니다. -");
	       }
	       else if((parseInt(diffDays))>0 ){
	    	   	alert('예약은 ' + availabledate +'일 이후로 가능합니다.');
	       }else {
	          reservation_1.action = "ajax_reser_stu.jsp"
	          document.reservation_1.submit();
	       }  
	       
	    }
	
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