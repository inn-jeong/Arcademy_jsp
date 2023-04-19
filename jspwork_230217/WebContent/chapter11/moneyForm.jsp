<%@page import="javax.jws.soap.SOAPBinding.Use"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Money" id="bean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	입력된 금액이 <%= bean.getMoney() %>는 <br>
	<%= bean.process(bean.getMoney()) %>
</body>
</html>