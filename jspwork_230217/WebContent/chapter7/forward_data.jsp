<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int gugudan = Integer.parseInt(request.getParameter("gugudan"));
		for(int i=1; i<10; i++){
			out.println(gugudan+" * "+i+" = "+gugudan*i+"<br>");
		}
	%>
</body>
</html>