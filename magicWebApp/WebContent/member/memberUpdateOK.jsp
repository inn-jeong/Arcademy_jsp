<%@page import="magic.member.MemberDBBean"%>
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
	<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	<%
		MemberDBBean manager = MemberDBBean.getInstance();
		String uid = (String)session.getAttribute("mem_uid");
		mb.setMem_uid(uid);
		int re=-1;
		re = manager.updateMember(mb);
		if(re==1){
			session.setAttribute("mem_pwd", mb.getMem_pwd());
			session.setAttribute("mem_email", mb.getMem_email());
			session.setAttribute("mem_address", mb.getMem_address());
			%>
				<script>
					alert("수정 완료");
					location.href="main.jsp";
				</script>
			<%	
		}else{
			%>
				<script>
					alert("수정 실패");
					location.href="memberUpdate.jsp";
				</script>
			<%
		}

	%>
	
	
</body>
</html>