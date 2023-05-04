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
		String str = request.getParameter("str");
	
			if(str.equals("next")){
	%>
		<script>
					alert("다음 페이로 넘어갑니다.");
// 					location.href="register.jsp";
// 					history.back();
		</script>
	<%
			response.sendRedirect("test3.jsp");
		}
	%>
</body>
</html>