<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Array3" id="bean"></jsp:useBean>
<jsp:setProperty property="*" name="bean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	입력된 정수의 갯수는 <%= bean.getNum() %> 생성된 정수들은 <br>
	<%= bean.process(bean.getNum()) %>
</body>
</html>