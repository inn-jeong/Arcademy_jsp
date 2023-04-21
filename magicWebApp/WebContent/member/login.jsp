<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="script.js" charset="utf-8"></script>
</head>
<style>
	a{
		text-decoration: none;
		color: black;
	}

</style>
<body>
	<div class="container">
	<form method="post" name="ref_form" action="loginOK.jsp">
		<table border="1">
			<tr class="b">
				<td align="center">사용자 ID</td>
				<td> <input type="text" name="id" size="20"> </td>
			</tr>
			<tr class="b">
				<td align="center" >비밀번호</td>
				<td><input type="text" name="pw" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" id="c">
					<input type="submit" value="로그인">
					<a href="register.jsp"><button>회원가입</button></a>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>