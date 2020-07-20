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

form{
   width: 300px;
   height: 62px;
}
.reserbutton {
   position: relative;
   color: #fff;
}

.reserbutton {
   position: absolute;
   top: calc(40% - 75px);
   left: calc(44% - 60px);
   height: 150px;
   width: 250px;
   padding: 10px;
   z-index: 2;
}

.reserbutton input[type=submit] {
   width: 300px;
   height: 70px;
   background: #fff;
   border: 1px solid #fff;
   cursor: pointer;
   border-radius: 2px;
   color: #a18d6c;
   font-family: 'Exo', sans-serif;
   font-size: 20px;
   font-weight: 500;
   padding: 6px;
   margin-top: 10px;
   margin-left: auto;
   margin-right: auto;
}

.reserbutton input[type=submit]:hover {
   opacity: 0.8;
   color: #4c83a5;
}

.reserbutton input[type=submit]:active {
   opacity: 0.6;
}

.reserbutton input[type=submit]:focus {
   outline: none;
}
.reserbutton input[type=button] {
   width: 300px;
   height: 70px;
   background: #fff;
   border: 1px solid #fff;
   cursor: pointer;
   border-radius: 2px;
   color: #a18d6c;
   font-family: 'Exo', sans-serif;
   font-size: 20px;
   font-weight: 500;
   padding: 6px;
   margin-top: 10px;
   margin-left: auto;
   margin-right: auto;
}

.reserbutton input[type=button]:hover {
   opacity: 0.8;
   color: #4c83a5;
}

.reserbutton input[type=button]:active {
   opacity: 0.6;
}

.reserbutton input[type=button]:focus {
   outline: none;
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
a:link {
   text-decoration: none;
   color: white;
}

a:visited {
   text-decoration: none;
   color: white;
}

a:active {
   text-decoration: none;
   color: white;
}

a:hover {
   text-decoration: underline;
   color: white;
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

<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../style.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

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


      <div class="reserbutton">
         <div>
            <form method="post" action="CallAvailabledate.jsp">
               <input type="hidden" name="id" value="<%=id%>">
               <input type="submit" value="강의실 예약하기" onClick="reserpermission();">
            </form> 
   <%--          <form method="post"  onsubmit="return reserpermission();" name="reserpermission">
               <input type="hidden" name="id" value="<%=id%>">
               <input type="submit" value="강의실 예약하기" >
            </form> 
 --%>
            <%-- <form method="post" action="myReservationList.jsp">
<input type="hidden" name = "id" value="<%=id%>">
</form> --%>
            <input type="button" value="나의 예약내역 보기"
               onclick="window.location='myReservationList.jsp';"> 
            <input
               type="button" value="강의실 예약안내"
               onclick="clickon();">
         </div>
      </div>


      </main>
   </div>
   <script>
      function logoutCheck() {

         if (confirm("정말로 로그아웃하시겠습니까?")) {

            location.href = "logout.jsp";
         }
      }
      function clickon() {

            window.open("reservationExplain.jsp", "", "width=500, height=400, status=1");

         }
   
<%--  
    function reserpermission(){
         
         var count1 = "<%=count%>";

         if(count1=="0"){
            alert("한달 예약횟수를 초과하였습니다. - 한달 예약 가능한 횟수는 4번 입니다. -");
         }else{
            location.href = "reser_stu.jsp";
         } 
      }  --%> 
      
       
   <%--     function reserpermission(){
            
            var count1 = "<%=count%>";

            if(count1=="0"){
               alert("한달 예약횟수를 초과하였습니다. - 한달 예약 가능한 횟수는 4번 입니다. -");
            }else{
            	reserpermission.action = "CallAvailabledate.jsp";
               document.reserpermission.submit();
            } 
         }  --%>
   
      
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