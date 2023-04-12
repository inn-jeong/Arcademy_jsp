<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	액션태그 -->
<%-- 	<jsp:include page="h01.jsp"></jsp:include> --%>
<!-- 	디렉티브 태그 -->
	<%@ include file="h01.jsp"%>
	<%
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DATE)+1;
	%>
	<%= year+"-"+month+"-"+date %>
</body>
</html>