<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_id = "hong";
	String s_pw = "1234";
	String s_name = "홍길동";
// 	한글 처리 인코딩 방식
	s_name = URLEncoder.encode(s_name, "utf-8");
// 	String s_name = "gildong";
// 	아이디, 비밀번호가 일치하면 main.jsp 로 자동 이동	
	if(s_id.equals(request.getParameter("id"))&&
		s_pw.equals(request.getParameter("pw"))){
		response.sendRedirect("main.jsp?name="+s_name);
	}else{
		response.sendRedirect("login.html");
	}
%>