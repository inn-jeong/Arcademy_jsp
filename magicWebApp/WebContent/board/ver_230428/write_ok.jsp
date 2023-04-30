<%@page import="magic.board.ver_230428.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean class="magic.board.ver_230428.BoardBean" id="board"></jsp:useBean>
	<jsp:setProperty property="*" name="board"/>
	
	<%
		BoardDBBean manager = BoardDBBean.getInstance();
		int re = manager.insertBoard(board);
		if(re == 1){
	%>
				<script>
 					alert("삽입 성공.");
				</script>
	<%
			//response.sendRedirect("list.jsp");
		}else{
	%>
				<script>
 					alert("삽입 실패.");
				</script>
	<%
 			//response.sendRedirect("list.jsp"); 
		}
	%>
</body>
</html>