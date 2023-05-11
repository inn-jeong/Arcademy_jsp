<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
	Context ctx = null;
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	String description = request.getParameter("description");
	String sql="";
	
	try{
		ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		
		sql = "INSERT INTO ITEM VALUES(?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		int re = pstmt.executeUpdate();
		if(re == 1){
			System.out.println("삽입 성공");
		}else{
			System.out.println("삽입 성공");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
	<h2><a href="itemWrite.jsp" style="color:#000">결과보기</a></h2>
</body>
</html>