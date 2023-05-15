<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id 변수값 설정
	<c:set var="id" value="aaa"></c:set> <br>
	<c:out value="${id}"></c:out> <br>
	
	id 변수값 삭제(aaa 값 삭제)
<%-- 	<c:remove var="id"></c:remove> --%>
<!-- 	위와 동일 -->
	<c:remove var="id"/>
	<c:out value="${id}"></c:out> <br>
</body>
</html>