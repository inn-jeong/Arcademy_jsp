<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		out.print(i+"번째 쿠키 =>"+cookies[i].getName()+"삭제<br>");
// 		기간을 0으로 해서 쿠키 삭제
		cookies[i].setMaxAge(0);
		cookies[i].setPath("/");//기간과 경로는 같이 간다고 보면 됨
// 		삭제 정보를 추가
		response.addCookie(cookies[i]);
	}
%>