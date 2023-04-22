<%@page import="javax.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>

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
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	%>
	<%
		String id="",pw="",name="",email="",address="";
		id = request.getParameter("mem_uid");
		pw = request.getParameter("mem_pwd");
		name = request.getParameter("mem_name");
		email = request.getParameter("mem_email");
		address = request.getParameter("mem_address");
		try{
			String select = "select * from memberT where mem_uid=?";
			conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				%>
				<script>
					alert("이미 사용중인 ID입니다.");
				</script>
				<%
				response.sendRedirect("register.jsp");
			}
			out.print("1번 통과<br>");
			
			
		} catch(SQLException se){
			se.printStackTrace();
			out.print(""+se.getMessage());
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}
		try{
			if(address.equals("")){
				String insert = "INSERT INTO MEMBERT(MEM_UID,MEM_PWD,MEM_NAME,MEM_EMAIL) VALUES(?,?,?,?)";
				pstmt = conn.prepareStatement(insert);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
			}else{
				String insert = "INSERT INTO MEMBERT VALUES(?,?,?,?,?)";
				pstmt = conn.prepareStatement(insert);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, address);
			}
			int re = pstmt.executeUpdate();
			if(re == 1){
				%>
	 				등록 성공
				<%
			}else{
				%>
					등록 실패
				<%
			}
		} catch(SQLException se){
			se.printStackTrace();
			out.print(""+se.getMessage()+"<br>");
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}
	%>
</body>
</html>