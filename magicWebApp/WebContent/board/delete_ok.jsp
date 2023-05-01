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
	
	<%
		BoardDBBean manager = BoardDBBean.getInstance();
		String check_pwd = request.getParameter("check_pwd");
		int b_id = Integer.parseInt(request.getParameter("b_id"));
// 		System.out.println("@@@==> b_id:"+b_id);
		int re = manager.deleteBoard(b_id,check_pwd);
		
		if(re == 1){
			%>
				<script>
 					alert("삭제 성공.");
 					location.href="list.jsp";
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
					alert("삭제 실패.");
					history.back();
				</script>
			<%
// 			response.sendRedirect("list.jsp");
		}
	%>
</body>
</html>