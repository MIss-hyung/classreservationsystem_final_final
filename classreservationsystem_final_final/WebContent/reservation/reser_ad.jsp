<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.DBUtil" %>
<%@ page import="model.Member" %>
<%@page import="java.util.*"%>
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
 
 <style>
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

.date {
margin-top:50px;
}

.place {
margin-top: 30px;
}

 </style>

 <script>
 $(document).ready(function(){
       $('#datepicker').datepicker({
          minDate : 31,
           dateFormat : 'yy/mm/dd',
           altField : "#datepicker",
      });

   });
 </script>
 
 
<script type="text/javascript">

   

   //예약하기
   //fix) 이미 예약된 시간 중복 예약 가능!
function check_1(){
    
        if (document.reservation_ad.re_day.value == "") {
           alert('날짜를 선택해주세요.');
        }else if(document.reservation_ad.re_place.value == ""){
           alert('장소를 선택해주세요.');
        }else if((parseInt(document.reservation_ad.starttime.value))-(parseInt(document.reservation_ad.endtime.value))>=0){
            alert('시작시간이 종료시간보다 빠르거나 같습니다. 다시 선택해주세요.');
        }else {reservation_ad.action = "ajax_reser_ad.jsp"
            document.reservation_ad.submit();
        }
           
        }

function classSelect(v){
	if (v.value == "") {
		alert('장소를 선택해주세요');
	}else if(v.value == "1"){
		$("#classroom").find("option").remove();
		$("#classroom").append("<option value='101'>101호</option>");
		$("#classroom").append("<option value='102'>102호</option>");
		$("#classroom").append("<option value='103'>103호</option>");
		$("#classroom").append("<option value='104'>104호</option>");
        $("#classroom").append("<option value='105'>105호</option>");
        $("#classroom").append("<option value='106'>106호</option>");
	}else if(v.value =="2"){
		$("#classroom").find("option").remove();
		$("#classroom").append("<option value='111'>111호</option>");
		$("#classroom").append("<option value='112'>112호</option>");
        $("#classroom").append("<option value='113'>113호</option>");
        $("#classroom").append("<option value='114'>114호</option>");
        $("#classroom").append("<option value='115'>115호</option>");
        $("#classroom").append("<option value='116'>116호</option>");
	}else if(v.vaule=="3"){
		$("#classroom").find("option").remove();
        $("#classroom").append("<option value='121'>121호</option>");
        $("#classroom").append("<option value='122'>122호</option>");
        $("#classroom").append("<option value='123'>123호</option>");
        $("#classroom").append("<option value='124'>124호</option>");
        $("#classroom").append("<option value='125'>125호</option>");
        $("#classroom").append("<option value='126'>126호</option>");

	}
	}
      
      

   
   </script>


</head>
<body>

   <%String id = (String) session.getAttribute("id");
String phonenum = (String) session.getAttribute("phonenum");%>


<% session.setAttribute("id",id);

session.setAttribute("phonenum" , phonenum);

request.setAttribute("id",id);

request.setAttribute("phonenum" , phonenum);
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

   
       <center><div>
          <form method="post" name="reservation_ad" action="ajax_reser_ad.jsp">
      <p class=date > 날짜조회 : <input type="text" name="re_day" id="datepicker" readonly></p>      
      <p class=place> 장소조회 : <select id="re_place" name="re_place" class="custom-select" onchange="classSelect(this)">
              <option value="">전체</option>
              <option value="1">수정관</option>
              <option value="2">성신관</option>
              <option value="3">난향관</option>
         </select>
         <select id="classroom" name="classroom">
       <option value="">전체</option>
       </select> 
       <p> 시간선택
       <select id="starttime" name="starttime">
            <option value="9">9:00</option>
              <option value="10">10:00</option>
              <option value="11">11:00</option>
              <option value="12">12:00</option>
              <option value="13">13:00</option>
              <option value="14">14:00</option>
              <option value="15">15:00</option>
              <option value="16">16:00</option>
              <option value="17">17:00</option>
       </select> 부터
       <select id="endtime" name="endtime">
              <option value="10">10:00</option>
              <option value="11">11:00</option>
              <option value="12">12:00</option>
              <option value="13">13:00</option>
              <option value="14">14:00</option>
              <option value="15">15:00</option>
              <option value="16">16:00</option>
              <option value="17">17:00</option>
              <option value="18">18:00</option>
       </select> 까지
       </p>
       <button type="button" class="button" onclick="check_1()">저장하기</button>
       </form>
          
         
     
      </div></center>
      
      
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
      src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
      
   <script src="../js\index.js"></script>

</body>
</html>