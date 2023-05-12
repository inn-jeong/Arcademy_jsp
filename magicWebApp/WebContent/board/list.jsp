<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
		//넘어오는 페이지 번호를 변수에 저장
		String pageNum = request.getParameter("pageNum");
		//넘어오는 페이지 번호가 없으면 1페이지로 설정
		if(pageNum == null){
			pageNum = "1";
		}
		
		BoardDBBean db = BoardDBBean.getInstance();
// 		ArrayList<BoardBean> list = db.listBoard();
		ArrayList<BoardBean> list = db.listBoard(pageNum);
		int b_id=0, b_hit=0, b_level=0, b_fsize=0;
		String b_name,b_title,b_email,b_content;
		Timestamp b_date;
		String b_date2;
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm");
		//db.generateList(64);
	%>
	<script>
		window.onpageshow = function(event){
			if(event.persisted || (window.performance && window.performance.navigation.type==2)){
				location.reload();
			}
		}
	</script>
	<div align="center" >
		<h1 align="center">게시판에 등록된 글 목록 보기</h1>
		<table>
			<tr height="30" >
				<td width="80"></td>
				<td width="500"></td>
				<td width="200" align="left"><a href="write.jsp?pageNum=<%=pageNum%>">글 쓰 기</a></td>
			</tr>
		</table>
		<table border="1" cellspacing="0">
			<tr height="30" >
				<td width="80" align="center">번호</td>
				<td width="120" align="center">첨부파일</td>
				<td width="500" align="center">글제목</td>
				<td width="200" align="center">작성자</td>
				<td width="200" align="center">작성일</td>
				<td width="100" align="center">조회수</td>
			</tr>
	<%
				for(int i=0; i<list.size(); i++){
					b_id = list.get(i).getB_id();
					b_name = list.get(i).getB_name();
					b_title = list.get(i).getB_title();
					b_email = list.get(i).getB_email();
					b_date = list.get(i).getB_date();
					String str = sdf.format(b_date);
// 					b_date2 = list.get(i).getB_date2();
					b_hit = list.get(i).getB_hit();
					b_level = list.get(i).getB_level();
					b_fsize = list.get(i).getB_fsize();
 					//System.out.println(list.get(i).getB_date().toString());
	%>
			<tr height="30" 
			 bgcolor="#f7f7f7"
			 onmouseover="this.style.background='#ddd'"
			 onmouseout="this.style.background='#f7f7f7'">
				<td align="center"><%= b_id %></td>
				<td>
	<%
				if(b_fsize > 0){
	%>
					<img src="./images/zip.gif">
	<%
					
				}
	%>
				</td>
				<td>
	<%
				if(b_level > 0){
	%>
					<% for(int j=0; j<b_level; j++){ %> &nbsp; <% } %>
					<img src="./images/AnswerLine.gif" width="16" height="16">
					<a href="show.jsp?b_id=<%= b_id %>&pageNum=<%=pageNum%>"><%= b_title %></a>
	<%
				}else{
	%>
					<a href="show.jsp?b_id=<%= b_id %>&pageNum=<%=pageNum%>"><%= b_title %></a>
	<%
				}
	%>			</td>
				<td align="center"> <a href="mailto:<%= b_email %>"> <%= b_name %></a></td>
				<td><%= str %></td>
				<td><%= b_hit %></td>
				
			</tr>
			
	<%
				}
	%>
		
		</table>
		<%= BoardBean.pageNumber(4)%>	
	</div>
</body>
</html>