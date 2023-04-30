<%@page import="magic.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		BoardDBBean db = BoardDBBean.getInstance();
		ArrayList<BoardBean> list = db.listBoard();
	%>
	<div align="center" >
		<h1 align="center">게시판에 등록된 글 목록 보기</h1>
		<table>
			<tr height="30" >
				<td width="80"></td>
				<td width="500"></td>
				<td width="200" align="left"><a href="write.jsp">글쓰기</a></td>
			</tr>
		</table>
		<table border="1" cellspacing="0">
			<tr height="30" >
				<td width="80" align="center">번호</td>
				<td width="500" align="center">글제목</td>
				<td width="200" align="center">작성자</td>
			</tr>
			<%
				for(int i=0; i<list.size(); i++){
					int b_id = list.get(i).getB_id();
					String b_name = list.get(i).getB_name();
					String b_title = list.get(i).getB_title();
					String b_email = list.get(i).getB_email();
			%>
					<tr height="30" 
					 bgcolor="#f7f7f7"
					 onmouseover="this.style.background='#ddd'"
					 onmouseout="this.style.background='white'">
						<td align="center"><%= list.get(i).getB_id() %></td>
						<td><a href="show.jsp?b_id=<%= b_id %>"><%= b_title %></a></td>
						<td align="center"> <a href="mailto:<%= b_email %>"> <%= b_name %></a></td>
					</tr>
			<%
				}
			%>
		</table>	
	</div>
</body>
</html>