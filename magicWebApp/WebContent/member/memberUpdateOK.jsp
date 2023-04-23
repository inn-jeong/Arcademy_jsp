<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean class="magic.member.MemberBean" id="member" scope="session"></jsp:useBean>
	<jsp:useBean class="magic.member.MemberDBBean" id="DBbean"></jsp:useBean>
	<jsp:setProperty property="*" name="member"/>
	<%
		try{
			DBbean.init();//연동 시작
			int re;
			if(member.getMem_address() == null){
				re = DBbean.update(member);
			}else{
				re = DBbean.update_all(member);
			}
			if(re == 1){
				%>
	 				수정 성공 <br>
	 				[<a href="main.jsp">메인화면으로</a>]
				<%
			}else{
				%>
					수정 실패
					[<a href="memberUpdate.jsp">돌아가기</a>]
				<%
			}
		}catch(NamingException ne){
			ne.printStackTrace();
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}catch(SQLException se){
			se.printStackTrace();
			%>
				서버불량, 잠시 후 다시 시도
			<%
		}
	%>
	
	
</body>
</html>