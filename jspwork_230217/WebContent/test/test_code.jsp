<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection conn = null;
	DataSource ds = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs= null;
%>
<%
	String table = request.getParameter("table");
	String sql = "";
	try{
		//InitialContext : dbcp 사용하기 위한 객체 생성
		Context ctx = new InitialContext();
		//java:comp/env : server.xml 에서 Resource 태그에 name을 찾아감
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		sql = "SELECT COLUMN_NAME,DATA_TYPE,DATA_LENGTH,NULLABLE " 
				+"FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'EMP'";
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		//pstmt.setString(1, "EMP");
		rs = pstmt.executeQuery();
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		//rs = stmt.executeQuery(sql);
		/*
		while(rs.next ()){
			out.print(rs.getString(1)+"<br>");
		} 
		*/
		rs.next();
		rs.absolute(2);
		out.print(rs.getString(1)+"<br>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>