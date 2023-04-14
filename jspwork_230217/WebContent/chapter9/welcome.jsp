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
// 		Object obj_session = session.getAttribute("userID");
		String str_session = (String)session.getAttribute("userID");
// 		if(obj_session == null){
// 			response.sendRedirect("session_out.jsp");	
// 		}
// 		if(str_session == null){
// 			response.sendRedirect("getAttributeNames.jsp");	
// 		}
// 		else{
// 			String user_id= (String) obj_session;
			%>
			<h4><%= str_session %>님 반갑습니다.</h4>
			<%
			
// 		}
		session.setAttribute("Testing", "test");
		session.setAttribute("MyData", 10);
	%>
<%-- 	<p><%= user_id+"님 반갑습니다." %></p> --%>
	<a href="session_out.jsp">로그아웃</a>
</body>
</html>