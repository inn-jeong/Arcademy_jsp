<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
	Statement stmt = null;
	ResultSet rs= null;
%>
<%
	String sql = "";
	try{
		//InitialContext : dbcp 사용하기 위한 객체 생성
		Context ctx = new InitialContext();
		//java:comp/env : server.xml 에서 Resource 태그에 name을 찾아감
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		sql = "SELECT NAME,TO_CHAR(PRICE,'999,999,999'),DESCRIPTION " 
				+"FROM ITEM ORDER BY NAME";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
%>
	<h2>입력 완료된 정보</h2>
	<table border="1">
		<tr>
			<td width="90">상품명</td>	
			<td width="120">가격</td>	
			<td width="300">상품설명</td>	
		</tr>
<%
		while(rs.next()){
%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
		</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
	</table>
</body>
</html>