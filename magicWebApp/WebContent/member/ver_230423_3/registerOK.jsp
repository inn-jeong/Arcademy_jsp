<%@page import="javax.naming.NamingException"%>
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
	%>
	<%	
		try{
			DBbean.init();
			rs = DBbean.selectID(member.getMem_uid());
			if(rs.next()){
				DBbean.setProperty(rs);
				member.setProperty(DBbean);
				%>
				<script>
					alert("이미 사용중인 ID입니다.");
				</script>
				<a href="register.jsp">[회원가입]</a>
				<%
				return;//중복 아이디가 있을 경우 try를 탈출하여 등록 방지
			}
			int re;
			if(member.getMem_address() == null){
				re = DBbean.insert(member);
			}else{
				re = DBbean.insert_all(member);
			}
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
		} catch(NamingException ne){
			ne.printStackTrace();
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}
	%>
</body>
</html>