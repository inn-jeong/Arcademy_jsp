<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
				+"FROM USER_TAB_COLUMNS WHERE TABLE_NAME = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, table);
		rs = pstmt.executeQuery();
%>
	<table border="1">
		<tr>
			<td width="90">컬럼명</td>	
			<td width="90">컬럼형식</td>	
			<td width="90">컬럼길이</td>	
			<td width="90">널값여부</td>	
		</tr>
<%
		while(rs.next()){
%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
		</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
	</table>
</body>
</html>