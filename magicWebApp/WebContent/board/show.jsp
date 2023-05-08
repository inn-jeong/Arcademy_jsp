<%@page import="java.text.SimpleDateFormat"%>
<%@page import="magic.board.BoardDBBean"%>
<%@page import="magic.board.BoardBean"%>
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
		BoardDBBean db = BoardDBBean.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm");
		int num = Integer.parseInt(request.getParameter("b_id"));
		BoardBean board = db.getBoard(num,true);
	%>
	<div align="center" >
		<h1 align="center">글 내 용 보 기</h1>
		<table border="1" cellspacing="0">
			<tr height="30" >
				<td width="100" align="center">글번호</td>
				<td width="200" align="center" ><%= num %></td>
				<td width="100" align="center">조회수</td>
				<td width="200" align="center" ><%= board.getB_hit() %></td>
			</tr>
			<tr height="30" >
				<td align="center" width="100">작성자</td>
				<td align="center" width="200"><%= board.getB_name() %></td>
				<td align="center" width="100">작성일</td>
				<td align="center" width="200"><%= sdf.format(board.getB_date()) %></td>
			</tr>
			<tr height="30" >
				<td align="center">글제목</td>
				<td colspan="3"><%= board.getB_title() %></td>
			</tr>
			<tr height="30" >
				<td align="center">글내용</td>
				<td colspan="3"><%= board.getB_content() %></td>
			</tr>
			<tr height="30" >
				<td colspan="4" align="right">
				 <input type="button" value="글수정" onclick="javascript:window.location='edit.jsp?b_id=<%= num%>'">
				 &nbsp;&nbsp;&nbsp;&nbsp; 
				 <input type="button" value="글삭제" onclick="javascript:window.location='delete.jsp?b_id=<%= num%>'">
				 &nbsp;&nbsp;&nbsp;&nbsp;  
				 <input type="button" value="답변글" onclick="javascript:window.location='write.jsp?b_id=<%= num%>'">
				 &nbsp;&nbsp;&nbsp;&nbsp; 
				 <input type="button" value="글목록" onclick="javascript:window.location='list.jsp'"> 
				 </td>			
			</tr>
		</table>
	</div>
</body>
</html>