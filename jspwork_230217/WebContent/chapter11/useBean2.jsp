<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="area.Rectangle" id="bean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		bean.setNum1(20);
		bean.setNum2(30);
	%>
	가로 <%= bean.getNum1() %>, 세로 <%= bean.getNum2() %>인 
	사각형의 면적은 <%= bean.process(bean.getNum1(), bean.getNum2()) %>
</body>
</html>