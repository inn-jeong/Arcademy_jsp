<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="area.Circle2" id="useBean"></jsp:useBean>
<!-- 모든 값 프로퍼티와 매핑하여 저장 -->
<jsp:setProperty property="*" name="useBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보입니다.</h4>
	반지름이 <%= useBean.getRadius() %>인 원의 면적은 <%= useBean.process(useBean.getRadius()) %>
</body>
</html>