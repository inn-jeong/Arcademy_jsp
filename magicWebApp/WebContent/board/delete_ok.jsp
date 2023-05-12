<%@page import="java.io.File"%>
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
		//넘어오는 페이지 번호를 변수에 저장	
		String pageNum = request.getParameter("pageNum");
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		String check_pwd = request.getParameter("check_pwd");
	
		BoardDBBean manager = BoardDBBean.getInstance();
		
		//파일 삭제를 위한 처리
		board = manager.getBoard(b_id, false);
		String fName = board.getB_fname();
		String up="D:\\dev\\work_java\\.metadata\\.plugins\\"
				+"org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\"
				+"magicWebApp\\upload\\"; //파일 경로(역슬래쉬\ 는 특수문자 취급이라 두번)
		
		int re = manager.deleteBoard(b_id,check_pwd);
		
		if(re == 1){
			%>
				<script>
 					alert("삭제 성공.");
 					location.href="list.jsp?pageNum="+<%=pageNum%>;
 					//history.back();
				</script>
			<%
			if(fName != null){
				File file = new File(up+fName);
				file.delete();
			}
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