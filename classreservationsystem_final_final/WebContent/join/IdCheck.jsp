<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.sql.Connection, java.sql.PreparedStatement"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>


<%!Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public void setConnection() {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/classreservationdb", "root", "1234");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}%>


<%
	String id = request.getParameter("id");

	try {
		this.setConnection();
		String sql = "select * from user where id='" + id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>아이디 중복 확인</title>
<!--  이 자바 스크립트는 IdChecked.jsp가 닫힐 떄 수행할 내용 -->
<script>
	var idcheck;
	function IdCheckedClose(userid) {
		opener.document.joinformStudent.id.value = userid;
		window.opener.getreturn();
		window.close();
		opener.document.joinformStudent.userpassword.focus();
	}
</script>
</head>
<body>
	<!--  submit 실행 시 IdChecked.jsp로 되돌아 간다. -->
	<form method="post" action="IdChecked.jsp">

		<%
			try {
				if (rs.next() || (id == null)) {
		%>
		<center>아이디 :
		<%=id%>사용중인 아이디 입니다.  <br> 다른 아이디를 사용하세요 <br>
		<%
			} else {
		%>
		
		<center><p>아이디 : 
		<%=id%>
			사용 가능 <br /></p> <input type="button" value="현재 아이디 선택 "
				onclick="IdCheckedClose('<%=id%>')"></input>
		</center>
		<%
			}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		%>

	</form>
</body>
</html>