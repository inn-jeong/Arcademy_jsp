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
	<table border="1" align="center" width="300">
		<tr height="50">
			<td colspan="2" align="center">
				<h1>회원 정보</h1>
			</td>
		</tr>
		<tr height="30">
			<td width="80">User ID</td>
			<td>
				<%= member.getMem_uid() %>
			</td>
		</tr>
		<tr height="30">
			<td width="80">암    호</td>
			<td>
				<%= member.getMem_pwd() %>
			</td>
		</tr>
		<tr height="30">
			<td width="80">이   름</td>
			<td>
				<%= member.getMem_name() %>
			</td>
		</tr>
		<tr height="30">
			<td width="80">E-mail</td>
			<td>
				<%= member.getMem_email() %>
			</td>
		</tr>
		<tr height="30">
			<td width="80">주    소</td>
			<td>
				<%= member.getMem_address() %>
			</td>
		</tr>
		<tr height="30">
			<td width="80" colspan="2" align="center">
				<input type="button" value="로그아웃" onclick="javascript:window.location='logOut.jsp'">
				<input type="button" value="회원수정" onclick="javascript:window.location='memberUpdate.jsp'">
			</td>
		</tr>
	</table>
	
</body>
</html>