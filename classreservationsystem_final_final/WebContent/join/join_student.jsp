<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 회원가입</title>
<script>
   idcheck = false;
   
   function getreturn()
   {
      idcheck = true;
   }
</script>
<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);

@import
	url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300)
	;

body {
	margin: 0;
	padding: 0;
	background: #fff;
	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body {
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image:
		url(http://pds.joins.com/news/component/moneytoday/201408/11/2014080714387482125_1.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad {
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0
		, 0, 0)), color-stop(100%, rgba(0, 0, 0, 0.65)));
	/* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header {
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}


.header div {
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 25px;
	font-weight: 200;
}

.header div span {
	color: #5379fa !important;
}

.login {
	position: absolute;
	top: calc(25% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 250px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button] {
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}
.login input[type=submit] {
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover {
	opacity: 0.8;
}

.login input[type=button]:active {
	opacity: 0.6;
}

.login input[type=text]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=password]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=button]:focus {
	outline: none;
}

::-webkit-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}

::-moz-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}
.modal-footer 
{
		
		text-align: center;
		margin-top: 10px;
		font-size: 13px;
		justify-content: center;
	color: #fff;
		
	}
	
.user-type{
		text-align: center;
    		
    }	
    
    
</style>
<style type="text/css">
a:link {text-decoration: none; color: white;}
a:visited {text-decoration: none; color: white;}
a:active {text-decoration: none; color: white;}
a:hover {text-decoration: underline; color: white;}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
	<div class="body"></div>
	<div class="grad"></div>
	<div class="header">
		<div>
			강의실을 부탁해 <span></span>
		</div>
	</div>
	<br>
	<div class="login">
	<form method="post" action="confirmJoinStudent.jsp" name="joinformStudent">
		<input type="text" placeholder="id" name="userid"><input type="button" value="Idcheck" name="idcheck" onClick="javascript:checkedId()"> 
		<input type="password" placeholder="password" name="userpassword"><br>
		<input type="password" placeholder="passwordConfirm" name="userpasswordconfirm"><br>
		<input type="text" placeholder="name" name="username"><br>
		<input type="text" placeholder="major" name="major"><br>
		<input type="text" placeholder="email" name="email"><br>
		<input type="text" placeholder="phonenumber" name="phonenumber"><br><br><br>
	    <input type="button" value="Sign Up" onclick="javascript:check();">
	</form>		
			<div class="modal-footer" >
			<div class="hint-text"> Already have an account? <a href="..\login.html">Login here</a></div>
			</div>
		</div>
	
	
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	
	<script>
	 
	function check(){
		 
		 var uidCheck= /^[0-9]+$/;
		 var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
		 var nameCheck = /^[가-힣]+$/;
		 var majorCheck = /^[가-힣a-zA-Z]+$/;
		 var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		 var phoneCheck = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		 
	      if (document.joinformStudent.userid.value == "") {
	         alert('아이디를 입력해주세요.');
	      }else if(uidCheck.test(document.joinformStudent.userid.value)==false){
		      //아이디에 숫자만 입력가능하도록 검사 (학번)
		      
		      alert("아이디형식은 숫자만 가능합니다.");
		      document.joinformStudent.userid.focus();
		      exit;
		  }else if(document.joinformStudent.idcheck.value == "" ){
	    	  	alert('아이디 중복체크를 확인해주세요.');
	      }else if(document.joinformStudent.userpassword.value == "" ){
	    	  	alert('비밀번호를 입력해주세요.');
	      }else if(pwCheck.test(document.joinformStudent.userpassword.value)==false){
	    		// 비밀번호에 숫자 특수문자 영어로 유효성 검사  비밀번호의 수는 6~12
		      
		      alert("비밀번호는 영어,숫자,특수문자 조합으로 해주세요.(글자수는 6~12)");
		      document.joinformStudent.userpassword.focus();
		      exit;
	      }else if(document.joinformStudent.userpasswordconfirm.value == "" ){
	    	  	alert('비밀번호 확인을 해주세요.');
	      }else if(document.joinformStudent.userpassword.value!=document.joinformStudent.userpasswordconfirm.value){
	    	  //비밀번호와 비밀번호확인의 값이 다를 경우
	    	  
	    	  alert("비밀번호가 일치하지 않습니다.");
	    	  document.joinformStudent.userpassword.focus();
	    	  exit;
	      }else if(document.joinformStudent.username.value == "" ){
	    	  	alert('이름을 입력해주세요.');	
	      }else if(nameCheck.test(document.joinformStudent.username.value)==false){
	    		//이름에 한글만 가능하도록 설정
		      
		      alert("이름형식은 한글만 가능합니다.");
		      document.joinformStudent.username.focus();
		      exit;
		  }else if(document.joinformStudent.major.value == "" ){
	    	  	alert('전공 입력해주세요.');
	      }else if(majorCheck.test(document.joinformStudent.major.value)==false){
		      //이름에 한글만 가능하도록 설정
		      
		      alert("전공은 한글,영어만 가능합니다.");
		      document.joinformStudent.major.focus();
	      }else if(document.joinformStudent.email.value == "" ){
	    	  	alert('이메일을 입력해주세요.');
	      }else if(emailCheck.test(document.joinformStudent.email.value)==false){
		      //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		      
		      alert("이메일형식이 올바르지 않습니다.");
		      document.joinformStudent.email.focus();
		      exit;
		  }else if(document.joinformStudent.phonenumber.value == "" ){
	    	  	alert('폰번호를 입력해주세요.');
	      }else if(phoneCheck.test(document.joinformStudent.phonenumber.value)==false){
	     	//휴대폰 번호 유효성 검사
		      
		      alert("전화번호 형식에 맞지 않습니다");
		      document.joinformStudent.phonenumber.focus();
		      exit;
		  }else {
	              // 이메일 중복체크
	              if (idcheck == true)
	              {
	                 //writeForm.submit();
	                 document.joinformStudent.submit()
	              }
	              else
	                 alert("아이디 중복 체크를 해주세요.");
	              
	      }
	   }
			 
			  function checkedId()
		      {
				 //var sid = document.getElementById('id').value;
		         var sid = document.joinformStudent.userid.value;
		         //var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		         if (sid == "")
		         {            
		            alert("입력된 아이디가 없습니다.");
		         }
		         else 
		         {
		            window.open("IdCheck.jsp?id=" + sid, "아이디 중복 체크", "width =300,height = 200");
		         }
		      }
	</script>
</body>
</html>