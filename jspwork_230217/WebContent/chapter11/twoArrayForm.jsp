<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.TwoArray" id="bean"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= bean.getNum()%> * <%= bean.getNum()%>는 <br>
	<%= bean.process(bean.getNum()) %>
</body>
</html>