<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>정보 입력 폼</h2>
<form method="post" action="itemWriteResult.jsp">
	<table>
		<tr>
			<td width="50">상품명</td>
			<td><input type="text" name="name" size="30" required></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price" size="30"></td>
		</tr>
		<tr>
			<td>설명</td>
			<td><textarea name="description" rows="10" cols="60" ></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송">
				&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>