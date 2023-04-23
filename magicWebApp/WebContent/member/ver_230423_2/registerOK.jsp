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
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean class="magic.member.MemberDBBean" id="DBbean"></jsp:useBean>
	<jsp:useBean class="magic.member.MemberBean" id="member"></jsp:useBean>
	<jsp:setProperty property="*" name="member"/>
	<%!
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag_fail = false;
	%>
	<%	
		try{
			String select = "select * from memberT where mem_uid=?";
			conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, member.getMem_uid());
			
			rs = pstmt.executeQuery();
			if(rs.next()) DBbean.setProperty(rs);
			if(DBbean.getMem_uid() != null){
				flag_fail = true;
				%>
				<script>
					alert("이미 사용중인 ID입니다.");
				</script>
				<a href="register.jsp">[회원가입]</a>
				<%
				return;//중복 아이디가 있을 경우 try를 탈출하여 등록 방지
			}
			if(member.getMem_address() == null){
				String insert = "INSERT INTO MEMBERT(MEM_UID,MEM_PWD,MEM_NAME,MEM_EMAIL) VALUES(?,?,?,?)";
				pstmt = conn.prepareStatement(insert);
				pstmt.setString(1, member.getMem_uid());
				pstmt.setString(2, member.getMem_pwd());
				pstmt.setString(3, member.getMem_name());
				pstmt.setString(4, member.getMem_email());
			}else{
				String insert = "INSERT INTO MEMBERT VALUES(?,?,?,?,?)";
				pstmt = conn.prepareStatement(insert);
				pstmt.setString(1, member.getMem_uid());
				pstmt.setString(2, member.getMem_pwd());
				pstmt.setString(3, member.getMem_name());
				pstmt.setString(4, member.getMem_email());
				pstmt.setString(5, member.getMem_address());
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
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}
	%>
</body>
</html>