<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="script.js" charset="utf-8"></script>
</head>
<body>
	<form method="post" action="loginOK.jsp">
		<table border="1" align="center">
			<tr height="30">
				<td width="100" align="center">사용자 ID</td>
				<td width="100"> <input type="text" name="mem_uid" size="20"> </td>
			</tr>
			<tr height="30">
				<td width="100" align="center">비밀번호</td>
				<td><input type="password" name="mem_pwd" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>