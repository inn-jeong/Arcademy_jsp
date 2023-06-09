<%@page import="java.text.SimpleDateFormat"%>
<%@page import="magic.board.ver_230501.BoardDBBean"%>
<%@page import="magic.board.ver_230501.BoardBean"%>
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
		int num = Integer.parseInt(request.getParameter("b_id"));
		BoardDBBean db = BoardDBBean.getInstance();
		BoardBean board = db.getBoard(num);
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm");
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
		</table>
		<table>
			<tr height="30" >
				<td width="100"></td>
				<td width="200"></td>
				<td width="100"></td>
				<td width="200" align="center"><a href="list.jsp">목록보기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>