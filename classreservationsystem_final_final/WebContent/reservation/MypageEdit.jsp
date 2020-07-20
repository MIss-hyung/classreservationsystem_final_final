<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import="model.DBConnection"%>
<%@ page import="model.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보수정</title>

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

table {
    width: 300px;
    height: 300px;
    cellspacing:10px;
    cellpadding:10px;
    margin-top: 80px;
  }
  
td{
padding :5px
}

th{
padding : 20px
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

}
.btn:hover {
	color: white;
	background-color: #39404d;
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
//마이페이지 정보 가져오기 
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
					<div id="large-title" class="large-title">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=5>강의실을 부탁해</font>
					</div>
					<div>
				
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
		<h5 align="center">내 정보 수정</h5>
    <form method="post" action="UpdateMemberAction.jsp">
        <table  align="center" cellspacing='1'>
         
      <tr>
                <td>아이디</td>
                 <td><%=id%></td>
            </tr>
            <tr>
                <td>이름 </td>
                 <td><%=name %></td>
            </tr>
            <tr>
                <td>전공</td>
                <td><input type="text" name="major" value="<%=major%>"></td>
            </tr>
            <tr>
                <td>이메일 </td>
                <td><input type="text" name="email" value="<%=email%>"></td>
            </tr>
            <tr>
                <td>폰번호 </td>
                <td><input type="text" name="phonenum" value="<%=phonenum%>"></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <input class=btn type="submit" value="변경">
                 </td>
            </tr> 
            
        </table>
        
    </form>
    
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
 