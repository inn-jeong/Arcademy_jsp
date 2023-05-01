<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.ver_230501.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.board.ver_230501.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		BoardDBBean db = BoardDBBean.getInstance();
		ArrayList<BoardBean> list = db.listBoard();
		int b_id;
		String b_name,b_title,b_email,b_content;
		Timestamp b_date;
		String b_date2;
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm");
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
				<td width="200" align="center">작성일</td>
			</tr>
		<%
				for(int i=0; i<list.size(); i++){
					b_id = list.get(i).getB_id();
					b_name = list.get(i).getB_name();
					b_title = list.get(i).getB_title();
					b_email = list.get(i).getB_email();
 					b_date = list.get(i).getB_date();
 					String str = sdf.format(b_date);
					//b_date2 = list.get(i).getB_date2();
 					//System.out.println(list.get(i).getB_date().toString());
		%>
			<tr height="30" 
			 bgcolor="#f7f7f7"
			 onmouseover="this.style.background='#ddd'"
			 onmouseout="this.style.background='white'">
				<td align="center"><%= list.get(i).getB_id() %></td>
				<td><a id="tag<%= i %>" href="show.jsp?b_id=<%= b_id %>"><%= b_title %></a></td>
				<td align="center"> <a href="mailto:<%= b_email %>"> <%= b_name %></a></td>
<%-- 				<td><%= str %></td> --%>
				<td><%= str %></td>
			</tr>
			
		<%
				}
		%>
		
		</table>	
	</div>
</body>
</html>