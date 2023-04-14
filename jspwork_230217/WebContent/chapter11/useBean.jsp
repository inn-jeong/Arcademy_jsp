<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="area.Circle" id="useBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>원의 면적 출력하기</h4>
	<h4>
		반지름이 10인 원의 면적은
		<%= useBean.process(10)%>
	</h4>
</body>
</html>