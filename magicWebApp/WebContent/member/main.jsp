<%@page import="magic.member.MemberBean"%>
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
	<%
		if(session.getAttribute("Member") == null){
			%>
				<script>
					alert("로그인 후 이용하세요.");
				</script>
			<jsp:forward page="login.jsp"></jsp:forward>
			<%
		}
	%>
	<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
	<%
		String id = "",name="";
		id = (String)session.getAttribute("mem_uid");
		name = (String)session.getAttribute("mem_name");
	%>
	<table border="1" align="center">

		<tr height="30">
			<td>
				안녕하세요. <%= name+"("+id+")"+"님" %>
			</td>
		</tr>
		<tr height="30">
			<td align="center">
				<input type="button" value="로그아웃" onclick="javascript:window.location='logOut.jsp'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="회원수정" onclick="javascript:window.location='memberUpdate.jsp'">
			</td>
		</tr>
	</table>
	
</body>
</html>