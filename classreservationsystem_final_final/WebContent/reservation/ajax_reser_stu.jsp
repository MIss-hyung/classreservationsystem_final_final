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
<title>Insert title here</title>
<%String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");

%>

<% session.setAttribute("id",id);
session.setAttribute("name" , name);


request.setAttribute("id",id);
request.setAttribute("name" , name);

response.setContentType("text/html");
request.setCharacterEncoding("utf-8");  
response.setCharacterEncoding("utf-8");

String re_day = request.getParameter("re_day");
String re_place = request.getParameter("re_place");

if(re_place.equals("1")){
   re_place="수정관";
    }
    else if(re_place.equals("2")){
       re_place="성신관";
    }else if(re_place.equals("3")){
       re_place="난향관";
    }
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

.button {
   margin-top: 30px;
   margin-left: 20px;
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
margin-top:20px;
margin-left: 20px;
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
   
.gray {
    background-color: gray;
}
.in-fo{
margin-left : 800px;
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
$(document).ready(function(){
    $("input[name = 're_str']").change(function(){
       var cnt = $("#re_stay").val();   
       
       //if(cnt == "1"&& $(this).val)
       if($(this).is(":checked")){
          $(this).parent().addClass("gray");
          if(cnt =="2"){
           $(this).parent().next().next().addClass("gray");
           }
          else if(cnt =="3"){
             $(this).parent().next().next().addClass("gray");
             $(this).parent().next().next().next().next().addClass("gray");
          }
       $(":checkbox:not(:checked)").attr("disabled", "disabled");
       
          
       
       }else{
          $(":checkbox").removeAttr("disabled");
       $(":checkbox").parent().removeClass("gray");
       }
       });
    $("#re_stay").change(function(){
       $(":checkbox").parent().removeClass("gray");
        $(":checkbox").removeAttr("checked");
        $(":checkbox").removeAttr("disabled");
    });

}); 
//이전으로 다시돌아가기   
function check_back() {

   window.history.back();

   }
   
function summit(){
	if($("input[name = 're_str']:checkbox:not(:checked)")){
        alert('장소와 시간을 선택해주세요.');
	}else if(document.confirmreserve.re_num.value == ""){
		alert('시간을 선택해주세요.');
	}else{
    
       confirmreserve.action = "confirmreserve.jsp"
       document.confirmreserve.submit();
    }     }    
 
 
function clickon(v) {
   if (v.value == "4") {
      document.getElementById("object_4").style.display = 'block'
   }else if (v.value == "1" || v.value == "2" || v.value == "3"){
      document.getElementById("object_4").style.display = 'none'
   }
      
}

</script>

</head>
<body>


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

       
         <center><div id=body_form>
         
            <p>날짜 : <%=re_day %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 장소  : <%=re_place %> 
      <button type="button" class="button" onclick="check_back()">다시조회하기</button></p>


      <form method="post" name="confirmreserve" action="confirmreserve.jsp">
      <input type="hidden" name = "re_day" value="<%=re_day%>">
      <input type="hidden" name = "re_place" value="<%=re_place%>">
            
            
            
            사용시간 : <select id="re_stay" name="re_stay" >
         <option id="1" value="1">1시간</option>
         <option id="2" value="2">2시간</option>
         <option id="3" value="3">3시간 </option>
         </select>
         <div class= "in-fo">
      <div style="float:left;">예약가능 : </div>
      <div style="float:left;  border:1px solid; width:75px; height: 23px; " ></div>
      <div style="float:left;">예약불가능  :</div>
      <div style="float:left; background-color: black; width:75px; height: 23px; " ></div>
      </div>
      
            <%
            //classroom추가
            List<String> cell = new ArrayList<String>();
            if(re_place.equals("수정관")){
            cell.add("101");
            cell.add("102");
            cell.add("103");
            cell.add("104");
            cell.add("105");
            cell.add("106");
            }
            else if(re_place.equals("성신관")){
               cell.add("111");
                cell.add("112");
                cell.add("113");
                cell.add("114");
                cell.add("115");
                cell.add("116");
            }else if(re_place.equals("난향관")){
               cell.add("121");
                cell.add("122");
                cell.add("123");
                cell.add("124");
                cell.add("125");
                cell.add("126");
            }
            %>
            <%
//db일치값가져오기
      ServletContext sc = getServletContext();
      
      List<String> value = new ArrayList<String>();
    ArrayList<Reserve> list = DBUtil.lookupdate(sc, re_day, re_place);
    try {
         String date=null;
         String place=null;
         String classroom=null;
         String db_stay=null;
         String db_starttime=null;
         
         
            




       for (int j = 0; j < list.size(); j++) {
            
            Reserve reserve =list.get(j);
            
            date = reserve.getDay();
            place = reserve.getPalce();
            classroom = reserve.getClassroom();
            db_starttime = reserve.getStarttime();
            db_stay = reserve.getStay();
            
            
            System.out.println("confirm " +  classroom);
            System.out.println("confirm " + db_starttime);
            System.out.println("confirm " + db_stay);
            //value.add(classroom + "+" + starttime);
            for(int k=0 ;k<Integer.valueOf(db_stay);k++)   {
               value.add(classroom + "+" + Integer.toString((Integer.valueOf(db_starttime)+k)));
            }
      

       }

     %>

      <table>
         
      <%for ( int i = 0; i < cell.size(); i++ ) {%>
                  
      <tr>
            <td width=100><%=cell.get(i)%>호</td>
               <%

               for(int k=0; k<9; k++){
                  String a = cell.get(i) + "+" + Integer.toString(k+9);
                  String b = cell.get(i) + "_" + Integer.toString(k+9);

               %>
               <td id="<%=b %>">
               <input class="roomstay" type="checkbox" name="re_str" id="<%=a %>" value="<%=a%>"><center><%=k+9 %>:00~<%=k+10 %>:00</center>
               </td>
                <% 
                
                String resultMsg = "";
                resultMsg += "<script type='text/javascript'>";
                
                

                for (int j = 0; j < value.size(); j++){
                if(a.equals(value.get(j))){%>
                <input type="hidden" name="dbroomstay" vaule="<%=a %>">
                <% 
                   resultMsg += "document.getElementById('"+a+"').style.display='none';";
                   resultMsg += "$('#"+b+"').css('background-color', 'black');";

                   }
                }resultMsg += "</script>";
               out.print(resultMsg);
                

               } %>
             </tr>
             
    <%} %>
    
      </table>

         인원: <input name="re_num" type="number" min="1" required>
         용도: <select name="re_object" onchange="clickon(this)" class="custom-select">
           <option value="1" selected>강연</option>
           <option value="2">스터디그룹</option>
           <option value="3">동아리모임</option>
           <option value="4">기타(직접입력)</option>
         </select>
    <div id="object_4" style="display: none">
        용도입력 : <input type="text" name="re_object_4"  value=" "/>
    </div>
         
   <input type="button" class="button2" onclick="submit()" value="예약하기" ></center></div>
   <%}catch (Exception e) {
            out.println("접속 실패");
            e.printStackTrace();
            }%>
      </form>                       
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
  <%
      
   
}
   }catch(SQLException se){
      se.printStackTrace();
   }

%>
</html>