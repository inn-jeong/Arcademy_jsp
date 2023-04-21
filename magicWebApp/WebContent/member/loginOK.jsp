<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.member.MemberBean" id="member"></jsp:useBean>
<jsp:useBean class="magic.member.MemberDBBean" id="DB"></jsp:useBean>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		String sql = "SELECT mem_uid, mem_pwd FROM MEMBERT";
	%>
	<%
		String id="", pw="";
		id = request.getParameter("mem_uid");
		pw = request.getParameter("mem_pwd");
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(id.equals(rs.getString("mem_uid"))){
				if(pw.equals(rs.getString("mem_pwd"))){
					response.sendRedirect("main.jsp");
				}
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