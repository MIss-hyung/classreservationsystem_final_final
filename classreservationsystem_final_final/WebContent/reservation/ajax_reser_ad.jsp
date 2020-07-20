<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBConnection" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Reserve" %>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.servlet.RequestDispatcher" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <%String id = (String) session.getAttribute("id");
String phonenum = (String) session.getAttribute("phonenum");%>
   <%Member member = new Member(); %>
   <%
   session.setAttribute("id",id);
   session.setAttribute("phonenum" , phonenum);
   
   request.setAttribute("id",id);
   request.setAttribute("phonenum" , phonenum);
   
   response.setContentType("text/html");
   request.setCharacterEncoding("utf-8");  
   response.setCharacterEncoding("utf-8");
   
   String re_day = request.getParameter("re_day");
   String re_place = request.getParameter("re_place");
   String starttime = request.getParameter("starttime");
   String endtime =  request.getParameter("endtime");
   String classroom =  request.getParameter("classroom");
   String cancelstate = "0";
   String stay = null;
   
   stay = Integer.toString(Integer.valueOf(endtime) - Integer.valueOf(starttime));
   
   
   if(re_place.equals("1")){
      re_place="수정관";
       }
       else if(re_place.equals("2")){
          re_place="성신관";
       }else if(re_place.equals("3")){
          re_place="난향관";
       }
   System.out.println("id " + id);
   System.out.println("starttime " + starttime);
   System.out.println("endtime " + endtime);
   System.out.println("day " + re_day);
   System.out.println("place " + re_place);
   System.out.println("stay " + stay);
   System.out.println("classroom " + classroom);
   
   ServletContext sc = getServletContext();
   Connection conn = (Connection) sc.getAttribute("DBconnection");
   
   Reserve reserve = DBUtil.ad_reservein(sc, re_day, re_place, classroom, starttime, stay, id, cancelstate);

%>

            

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
   color : #4c83a5;
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

.roomstay table, tr, td{
    border: 1px solid black;
}
.re_str{
display:none;
}
.form{
margin-top:70px;
text-align:center;
font-size: 20px;
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

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="../style.css"> 
<script type="text/javascript">
//이전으로 다시돌아가기   
function check_back() {

   window.history.back();

   }
   </script>
   </head>
<title>Insert title here</title>
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
   <center>
   <div class=form>
일정 추가가 완료되었습니다. 
</div>
<input type="submit" class=btn name = "button" value = "OK" onclick="window.location='reser_ad_main.jsp';">
      </center>
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
      src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
      
   <script src="../js\index.js"></script>
</body>
</html>