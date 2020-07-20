<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@page import="java.util.*"%> 
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
.header {
    width: 100%;
    height: 10%;
    position : fixed;
    margin: 0 auto;
    font-family: 'Open Sans', sans-serif;
    color : #636363;
    font-weight : 300;
  	text-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
    text-align: center;
    
}

.header div {
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 25px;
	font-weight: 200;
}

.content {
	padding: 16px;
  margin: 24px;
  border-radius: 2px;
  background-color: #fff;
  color: rgba(0, 0, 0, 0.87);
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.btn {
	color: #4c4c4c;
	text-decoration: none;
	padding: 3px 15px;
	font-size: 15px;
	font-weight: 400;
	line-height: 1.4;
	background-color: white;
	border-radius: 5px;
/*  	border-color: #b3b3b3;
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
	padding: 3px
}

th {
	padding: 5px

}
</style>

</head>
<body>
	<%String userid = (String) session.getAttribute("id");
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
		<br>
		
			<li class="sidebar-brand"><a href="#"> 마이페이지 </a></li>
			<li><a href="#"><i class="fa fa-fw fa-file-o"></i> 관리자 : <%=userid %>
			</a></li>
			<li><a href="#"><i class="fa fa-fw fa-file-o"></i> 전화번호 : <%=phonenum %></a></li>
			<li><a href="reser_ad_main.jsp"><i class="fa fa-home fa-fw"></i> &nbsp; 홈으로 돌아가기 </a></li>
			<li><a href="#" onclick="logoutCheck();"><i
					class="fa fa-fw fa-twitter"></i> 로그아웃 </a></li>
			<li><a href="#"><i class="fa fa-fw fa-twitter"></i> 회원탈퇴</a></li>
		</ul>
		</nav>


		<button type="button" class="hamburger is-closed animated fadeInLeft"
			data-toggle="offcanvas">
			<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
				class="hamb-bottom"></span>
		</button>

			<h5 align="center">사용자들의 예약목록</h5>
<table align= "center" border="0" width="800">
	<tr align= "center">
		<td>사용자</td>
		<td>예약 신청 날짜</td>
		<td>대여날짜</td>
		<td>대여시간</td>
		<td>대여장소</td>
		<td>사용용도</td>
		<td>인원</td>
		<td>예약 취소 횟수</td>
		
		<td colspan="2">승인여부</td>
	
	</tr>
	
	<%
		//(예약 허가 승인을 위한) db 에서 회원목록 얻어와 테이블에 출력하기.
		Connection con = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try{
			con = DBConnection.getCon();
			String sql="SELECT * From reservation WHERE permissionstate=1 AND cancelstate=0";
			psm = con.prepareStatement(sql);
			rs = psm.executeQuery();
			
			while(rs.next()){
				String id = rs.getString("id");
				String user_id = rs.getString("user_id");
				String date = rs.getString("date");
				String place = rs.getString("place");
				String object = rs.getString("object");
				String num = rs.getString("num");
				String starttime = rs.getString("starttime");
				String stay = rs.getString("stay");
				String requestdate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
				
				System.out.println("confirm list id  " + id);
				
				int endtime = Integer.parseInt(starttime) + Integer.parseInt(stay);
%>

<%
//db 에서 취소 갯수 불러오기
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs2 = null;
String sql2="SELECT * FROM cancel WHERE user_id =\""+user_id+"\";";
System.out.println("Call confirm sql222222        " + sql2);
try{
	conn = DBConnection.getCon();
	psmt = con.prepareStatement(sql2);
	rs2 = psmt.executeQuery();
	
	List<Integer> value = new ArrayList<Integer>();
	System.out.println("while문 전에 쿼리 밖   " );
	while(rs2.next()){
		System.out.println("while문 안에  " );
		String canceldate = rs2.getString("canceldate");
 		String availabledate = rs2.getString("availabledate");
 		user_id = rs2.getString("user_id");
 		String reservation_id = rs2.getString("reservation_id");
 		
 		System.out.println("예약가능날짜 " + availabledate);
 		
 		/* request.setAttribute("availabledate", availabledate); */
 		
 		String availabledateyear = availabledate.substring(0,4);
 		System.out.println("reser_stu.jsp availabledate year      " + availabledateyear);

		String availabledatemonth = availabledate.substring(5,7);
		System.out.println("reser_stu.jsp availabledate month     " + availabledatemonth);

		String availabledateday = availabledate.substring(8,10);
		System.out.println("reser_stu.jsp availabledate day     " + availabledateday);
		
 		value.add(Integer.parseInt(availabledateday));
	
} System.out.print(value);
System.out.print(value.size());

%>


	<tr align= "center" class="content">

<form method="post" action= "permissionupdate.jsp" >
<input type="hidden" name = "id" value="<%=id%>">

		<td><%=user_id %></td>
		<td><%=requestdate %></td>
		<td><%=date %></td>
		<td><%=starttime%>:00 ~ <%=endtime %>:00 </td>
		<td><%=place %></td>
		<td><%=object %></td>
		<td><%=num %></td>
		<td><%=value.size() %></td>
		
		
		<td><input class=btn type = submit name = "button" value = "OK" ></input></td>
		</form>
		
		<form method="post" action= "selectReason.jsp" name="list">
		<input type="hidden" name = "id" value="<%=id%>">
		<td><input class=btn type = submit name = "button" value = "거부"></input></td>
		</form>
		
		<%-- <td><a href="permissionupdate.jsp">승인</a></td>
		<td><a href="../member/modify.jsp?id=<%=user_id%>">거부</a></td> --%>
	</tr>
	<%
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

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

</table>
		</div>
		</main>
	</div>
	<script>
	function logoutCheck(){
	    
	    if( confirm("정말로 로그아웃하시겠습니까?") ){
	       
	        location.href="logout.jsp";
	    }
	}
	
function reject(){
    var gsWin = window.open('selectReason.jsp','selectreason','width=300,height=200');
    var frm = document.list.id.value;
    frm.action = 'selectReason.jsp';
    frm.target ="selectreason";
    frm.method ="post";
    frm.submit();
   }
   
function submit(){
	var uid = document.list.id.value;
	window.open("selectReason.jsp?id=" + uid, "아이디 중복 체크", "width =300,height = 200");
	
}

function Check() {
	form1.target = 'newW'; //타겟지정, 아래에는 url을 적지않는다
	window.open ('', 'newW', 'width=300,height=300,resizable=no,scrollbars=no');
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