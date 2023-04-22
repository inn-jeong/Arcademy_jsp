<%@page import="javax.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.member.MemberBean" id="member"></jsp:useBean>
<jsp:useBean class="magic.member.MemberDBBean" id="DBbean"></jsp:useBean>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="script.js" charset="utf-8"></script>

</head>
<body>
	<%!
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	%>
	<%
		String mem_uid="", mem_pwd="";
		mem_uid = request.getParameter("mem_uid");
		mem_pwd = request.getParameter("mem_pwd");
		
		try{
			conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
			StringBuffer selectQuery = new StringBuffer();
			selectQuery.append("select mem_uid, mem_pwd from memberT where mem_uid=?");
			pstmt = conn.prepareStatement(selectQuery.toString());
			pstmt.setString(1, mem_uid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(mem_pwd.equals(rs.getString("mem_pwd"))){
					%>
						<script>
							alert("로그인 성공!");
						</script>
					<%
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