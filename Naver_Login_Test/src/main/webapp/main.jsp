<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
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
	//JSONParser parser = new JSONParser();
	//String res = request.getParameter("json_user");
	//JSONObject json_user = (JSONObject)parser.parse(res);
	//String name = json_user.get("name").toString();
	//String email = json_user.get("email").toString();
	//String birthyear = json_user.get("birthyear").toString();
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String birthyear = request.getParameter("birthyear");
%>
	<div align="center">
		<h3>사용자 정보</h3>
		<table border="1">
			<tr height="30">
				<td width="100">이름</td>
				<td width="200"><%= name %></td>
			</tr>
			<tr height="30">
				<td>email</td>
				<td><%= email %></td>
			</tr>
			<tr height="30">
				<td>생년월일</td>
				<td><%= birthyear %></td>
			</tr>
		</table>
	</div>
		
</body>
</html>