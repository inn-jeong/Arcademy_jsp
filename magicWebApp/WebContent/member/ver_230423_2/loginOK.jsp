
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="script.js" charset="utf-8"></script>

</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean class="magic.member.MemberBean" id="member" scope="session"></jsp:useBean>
	<jsp:useBean class="magic.member.MemberDBBean" id="DBbean"></jsp:useBean>
	<%!
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	%>
	<%
		String id="", pw="";
		id = request.getParameter("mem_uid");
		pw = request.getParameter("mem_pwd");
		
		try{
			conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
			StringBuffer selectQuery = new StringBuffer();
			selectQuery.append("select * from memberT where mem_uid=?");
			pstmt = conn.prepareStatement(selectQuery.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();

			if(rs.next()){
				DBbean.setProperty(rs);
				if(pw.equals(DBbean.getMem_pwd())){
					member.setProperty(DBbean);
					response.sendRedirect("main.jsp");
					//response.sendRedirect("main.jsp");
				}else{
					%>
					<script>
						alert("비밀번호가 틀렸습니다.");
					</script>
					<a href="login.jsp">[로그인 화면]</a>
					<%
				}
			}else{
				%>
					<script>
						alert("아이디가 없습니다.");
					</script>
					<a href="login.jsp">[로그인 화면]</a>
				<%
			}
		} catch(SQLException se){
			se.printStackTrace();
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}
	%>
</body>
</html>