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
	<jsp:setProperty property="*" name="board"/><!--b_id도 알아서 들어감  -->
	
	<%
// 		int b_id = Integer.parseInt(request.getParameter("b_id"));
		BoardDBBean manager = BoardDBBean.getInstance();
		
		int re = manager.editBoard(board);
		if(re == 1){
			%>
				<script>
 					alert("수정 성공.");
 					location.href="list.jsp";
 					//history.back();
				</script>
			<%
// 			response.sendRedirect("list.jsp");
		}else if(re==-2){
			%>
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.back();
			</script>
			<%
		}else{
			%>
				<script>
					alert("수정 실패.");
					history.back();
				</script>
			<%
// 			response.sendRedirect("list.jsp");
		}
	%>
</body>
</html>