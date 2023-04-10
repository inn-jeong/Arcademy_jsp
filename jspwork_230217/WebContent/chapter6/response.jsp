<%@page import="java.util.Calendar"%>
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
		response.setIntHeader("Refresh", 5); //5초마다 새로고침
		Calendar cal = Calendar.getInstance();
// 		12시일 때, 0시 로 표시되는 것을 12시로 바꿈
		int hour = cal.get(Calendar.HOUR)==0?12:cal.get(Calendar.HOUR);//시간
// 		int hour = cal.get(Calendar.HOUR_OF_DAY);//시간
		int min = cal.get(Calendar.MINUTE);//분
		int sec = cal.get(Calendar.SECOND);//초
// 		AM_PM 값이 0이면 AM, 아니면 PM 저장
		String am_pm = cal.get(Calendar.AM_PM)==0?"AM":"PM";
	%>
	<p>
		현재 시간은 <%= hour+":"+min+":"+sec+" "+am_pm %>
	</p>
	<p>
<!-- 		링크를 걸어 링크를 누르면 response_data.jsp 로 이동 -->
		<a href="response_data.jsp">Google 홈페이지로 이동하기</a>
	</p>

</body>
</html>