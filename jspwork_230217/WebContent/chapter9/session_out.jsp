<%@page import="java.util.Enumeration"%>
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
		Enumeration enum_app = session.getAttributeNames();
		int i=0;
		String str_name;
		String str_value;
		while(enum_app.hasMoreElements()){
			i++;
// 			Object를 String으로 변환
// 			nextElement 메소드: 열거형 값을 가져옴
			str_name = enum_app.nextElement().toString();
// 			Object를 String으로 변환
// 			getAttribute 메소드: 세션 이름으로 값을 가져옴
			str_value = session.getAttribute(str_name).toString();
			
			out.print("<br>얻어온 세션 이름["+i+"]: "+str_name+"<br>");
			out.print("<br>얻어온 세션 값["+i+"]: "+str_value+"<hr>");
		}
		i=0;
		while(enum_app.hasMoreElements()){
			i++;
			str_name = enum_app.nextElement().toString();
			session.removeAttribute("s_name");
		}
		
// 		response.sendRedirect("session.jsp");
	%>
	<a href="session.jsp">로그인 화면</a>
</body>
</html>