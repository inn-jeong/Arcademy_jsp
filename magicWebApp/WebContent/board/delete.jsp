<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="board.js"></script>
</head>
<body>
	<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
	<%
		String b_id = request.getParameter("b_id");
	%>
	<form name="reg_frm" method="post" action="delete_ok.jsp">
		<div align="center">
			<h1>글 삭 제 하 기</h1>
			<h3>>>암호를 입력하세요.<< </h3> 
			<p>
				암호 &nbsp;&nbsp;<input type="password" name="check_pwd" size="12" maxlength="12">
				<input type="text" name="b_id" value="<%=b_id%>" hidden="true">
			</p>
			<p>
				<input type="button" value="글삭제" onclick="delete_ok()">
				&nbsp;&nbsp;
				<input type="reset" value="다시작성">
				&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="javascript:window.location='list.jsp'">
			</p>
		</div>
	</form>
</body>
</html>