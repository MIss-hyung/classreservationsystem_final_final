<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>

<%@ page import="javax.servlet.RequestDispatcher" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
.btn {
margin-top: 20px;
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
}
</style>

</head>
<body>

<% 
response.setContentType("text/html");
request.setCharacterEncoding("utf-8");  
response.setCharacterEncoding("utf-8");

int error=0;
String str = request.getParameter("re_str");
String starttime = null;
String classroom = null;
starttime = str.substring(4);
classroom = str.substring(0,3);

String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
/* String major = (String) session.getAttribute("major");
String email = (String) session.getAttribute("email");
String phonenum = (String) session.getAttribute("phonenum"); */
String day = request.getParameter("re_day");
String place = request.getParameter("re_place");
String num = request.getParameter("re_num");
String object = request.getParameter("re_object");
String stay = request.getParameter("re_stay");


System.out.println("confirm " +  id);
System.out.println("confirm " +  day);
//System.out.println("confirm " +  place);
System.out.println("confirm " +  num);
System.out.println("confirm " + object);
System.out.println("confirm " + starttime);


if(object.equals("1")){
   object="강연";
    }
    else if(object.equals("2")){
   object="스터디그룹";
    }else if(object.equals("3")){
   object="동아리모임";
    }else if(object.equals("4")){
       String object_4 = request.getParameter("re_object_4");
       System.out.println("confirm " + object_4);
       request.setAttribute("object_4",object_4); 
     object=object_4;
    }
String requestdate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date()); //현재날짜구하기




/* request.setAttribute("id",id);
request.setAttribute("name",name);
request.setAttribute("day",day);
request.setAttribute("place",place);
request.setAttribute("num",num);
request.setAttribute("object",object);
request.setAttribute("requestdate",requestdate);
request.setAttribute("starttime",starttime);  */
session.setAttribute("id",id);
request.setAttribute("name",name);
/* request.setAttribute("major" , major);
request.setAttribute("email" , email);
request.setAttribute("phonenum" , phonenum); */
request.setAttribute("day",day);
request.setAttribute("place",place);
request.setAttribute("num",num);
request.setAttribute("object",object);
request.setAttribute("requestdate",requestdate);
request.setAttribute("starttime",starttime); 


//int userid = Integer.valueOf(id);
/* int re_id = 0;
++re_id; */
//추가부분

int permissionstate = 1;
int endtime = Integer.parseInt(starttime) + Integer.parseInt(stay);



         if( (starttime.equals("16")&&stay.equals("3")) || (starttime.equals("17")&&stay.equals("3")) || (starttime.equals("17")&&stay.equals("2"))){
            error=1;
            
         }

if(error==1){%>
<script>alert('잘못된 시간 선택!'); window.history.back(); </script>
   <%
}




//마이페이지갱신 
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
<%-- 
<h2><%=name %>님의 예약정보 확인</h2>
<p>날짜 : <%=day %></p>
<p>장소 : <%=place %></p>
<p>시간 : </p>
<p>인원 : <%=num %></p>
<p>용도 : <%=object %></p>
<%=id %>,<%=requestdate %>
 --%>
 
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
            <li><a href="#"> ● 학번 :  <%=id %>   </a></li>
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
      
      
      


 <form method="post" action="reser_result.jsp">
  <div id="success" align="center" class=form>
 <h5 align="center"><%=name %>님의 예약정보 확인</h2>

<input type="hidden" name = "name" value="<%=name%>">
<p>날짜 : <%=day %></p>
<input type="hidden" name = "day" value="<%=day%>">
<p>장소 : <%=place %> / <%=classroom %>호</p>
<input type="hidden" name = "place" value="<%=place%>">
<input type="hidden" name = "classroom" value="<%=classroom%>">
<p>시간 : <%=starttime%>:00 ~ <%=endtime %>:00 (사용시간 : <%=stay %>시간)</p>
<p>인원 : <%=num %> 명 </p>
<input type="hidden" name = "num" value="<%=num%>">
<p>용도 : <%=object %></p>
<input type="hidden" name = "object" value="<%=object%>">
<input type="hidden" name = "requestdate" value="<%=requestdate%>">
<input type="hidden" name = "starttime" value="<%=starttime%>">
<input type="hidden" name = "stay" value="<%=stay%>">
<input type="submit" class=btn value="예약하기" >
</div>
</form>
<!--    
<!-- <button onclick="window.location='reser_result.jsp'">저장하기</button> -->

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