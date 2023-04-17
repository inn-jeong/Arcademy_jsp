<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Arithmetic" id="bean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보입니다.</h4>
	<%= bean.getNum1() %>와 
	<%= bean.getNum2()%>의 계산 결과는  
	<%= bean.process(bean.getNum1(), bean.getOp(), bean.getNum2())%>
</body>
</html>