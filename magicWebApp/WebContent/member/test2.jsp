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
					alert("올바른 입력");
 					location.href="test3.jsp";
		</script>
	<%
			//response.sendRedirect("test3.jsp");
		}else{
	%>
		
		<script>
					alert("잘못 입력하였습니다.");
 					history.back();
		</script>
	<%
		}
	%>
</body>
</html>