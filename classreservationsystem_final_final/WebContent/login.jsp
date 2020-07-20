<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DBUtil"%>
<%@ page import="model.Member"%>


<%

String countdate = new java.text.SimpleDateFormat("yyyy/MM").format(new java.util.Date());
	
	request.setCharacterEncoding("utf-8");

	// 입력한 id, passwd 받아오기	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String usertype = request.getParameter("usertype");


	System.out.println(id);
	System.out.println(passwd);
	System.out.println(usertype);

	ServletContext sc = getServletContext();
	
	if (usertype.equals("student")) {
		Member member = DBUtil.findUser(sc, id);
		System.out.println(member.getLoginPermission()+"here");
		if(member.getLoginPermission() == 9) {
			out.println("<script>alert('없는 아이디 입니다.'); history.go(-1);</script>");
		}
		else  {
			String isnew;
			if (session.isNew()) {
				isnew = "This is a new session. ";

			} else {
				isnew = "Welcome back!";
			}
			System.out.println("isnew");

			session.setAttribute("id", id);
			session.setAttribute("passwd", member.getPasswd());
			session.setAttribute("name", member.getName());
			session.setAttribute("major", member.getMajor());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("phonenum", member.getPhonenum());
			session.setAttribute("count", member.getCount()); 
	        session.setAttribute("countdate", member.getCountdate());

			String name = member.getName();
			
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");

			System.out.println("name" + member.getName()); // 아이디에 맞는 이름 가져왔음 마이페이지에 쏠 내용 
			System.out.println("major" + member.getMajor());
			System.out.println("email" + member.getEmail());
			System.out.println("phonenum" + member.getPhonenum());
			System.out.println("count" + member.getCount());
			System.out.println("끝");
			//session.setAttribute("ishost", member.getHost());
	 		
		
	 		if(member.getPasswd().equals(passwd)) {// valid user and password
				//System.out.println("로그인 가능한 아이디 및 패스워드");
				request.setAttribute("name", member.getName());
				request.setAttribute("major", member.getMajor());
				request.setAttribute("email", member.getEmail());
				request.setAttribute("phonenum", member.getPhonenum());
				request.setAttribute("count", member.getCount());

		         session.setAttribute("countdate", member.getCountdate());
				//if (usertype.equalsIgnoreCase("student")){ //학생이면   
				//RequestDispatcher view = request.getRequestDispatcher("reservation/reser_stu_main.jsp");
				//view.forward(request, response);
				response.sendRedirect("reservation/welcome.jsp");
			}
			//} /* else { //관리자면

			//response.sendRedirect("reservation/reser_ad_main.jsp");
			//} */
			else {
				// wrong password
				if (passwd.trim().length() == 0 || passwd == null) {
					out.println("<script>alert('비밀번호를 입력해주세요.'); history.go(-1);</script>");
				} else {
					out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
				}
			}

		}
		
	}

	else {
		Member member = DBUtil.findAdmin(sc, id);
		if(member.getLoginPermission() == 8) {
			out.println("<script>alert('없는 아이디 입니다.'); history.go(-1);</script>");
		}else {
		String isnew;
		if (session.isNew()) {
			isnew = "a This is a new session. ";

		} else {
			isnew = "a Welcome back!";
		}
		System.out.println("a isnew");

		session.setAttribute("id", id);
		session.setAttribute("phonenum", member.getPhonenum());

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");

		//session.setAttribute("name", member.getName());
		//session.setAttribute("ishost", member.getHost());

		if (member.getPasswd().equals(passwd)) {// valid user and password

			request.setAttribute("id", member.getId());
			request.setAttribute("phonenum", member.getPhonenum());

			response.sendRedirect("reservation/reser_ad_main.jsp");
		}

		else {
			// wrong password
			if (passwd.trim().length() == 0 || passwd == null)
				out.println("<script>alert('비밀번호를 입력해주세요.'); history.go(-1);</script>");
			else
				out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>