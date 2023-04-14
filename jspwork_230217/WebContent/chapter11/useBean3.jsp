<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 빈 객체 생성 -->
<jsp:useBean class="question.GuGuDan" id="useBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	useBean 프로퍼티 num1을 5로 세팅 -->
	<jsp:setProperty property="num1" name="useBean" value="5"/>
	<h4>
		구구단 출력
	</h4>
	<%
// 		useBean.setNum1(5);
		//1~9 까지 반복
		for(int i=1; i<10; i++){
			out.println(5+" * "+i+"="+useBean.process(i)+"<br>");
		}
	%>
</body>
</html>