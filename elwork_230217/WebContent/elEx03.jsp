<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[액션 태그와 표현 언어]</h3>
	<jsp:useBean class="glory.User" id="user"></jsp:useBean>
	<jsp:getProperty property="firstname" name="user"/>
	<jsp:getProperty property="lastname" name="user"/>
	<hr>
	${user.firstname}
	${user.lastname}
	<hr>
	<jsp:setProperty property="firstname" name="user" value="Gildong"/>
	<jsp:setProperty property="lastname" name="user" value="Hong"/>
	<jsp:getProperty property="firstname" name="user"/>
	<jsp:getProperty property="lastname" name="user"/>
	<hr>
	${user.firstname}
	${user.lastname}
	
</body>
</html>