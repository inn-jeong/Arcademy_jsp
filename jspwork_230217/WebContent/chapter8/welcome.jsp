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
		Cookie[] cookies = request.getCookies();
		String user_id="";
		int index = 0;
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("userId")){
// 				user_id = cookies[i].getValue();
// 				index = i;
				%>
				<h4><%= cookies[i].getValue() %>님 반갑습니다.</h4>
				<%
				break;
			}
		}
	%>
<%-- 	<p><%= user_id+"님 반갑습니다." %></p> --%>
	<a href="cookie_out.jsp">
		로그아웃
		<%
			cookies[index].setMaxAge(0);
			cookies[index].setPath("/");
			response.addCookie(cookies[index]);
		%>
	</a>
</body>
</html>