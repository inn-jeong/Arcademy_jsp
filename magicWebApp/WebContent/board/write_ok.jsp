<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
	<jsp:setProperty property="*" name="board"/>
	
	<%
		board.setB_date(new Timestamp(System.currentTimeMillis()));
		BoardDBBean manager = BoardDBBean.getInstance();
		int re = manager.insertBoard(board);
		if(re == 1){
			%>
				<script>
// 					alert("수정 성공.");
				</script>
			<%
			response.sendRedirect("list.jsp");
		}else{
			%>
				<script>
// 					alert("수정 실패.");
				</script>
			<%
			response.sendRedirect("list.jsp");
		}
	%>
</body>
</html>