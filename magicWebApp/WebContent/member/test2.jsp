<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str = request.getParameter("b_id");
		String str2;
		if(str == null) str2 = "null이다.";
		else str2="null이 아니다.";
	%>
	<%= str2 %>
</body>
</html>