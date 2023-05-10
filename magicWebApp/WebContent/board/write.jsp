<%@page import="magic.board.BoardDBBean"%>
<%@page import="magic.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="board.js"></script>
</head>
<body>
	<form name="reg_frm" method="post" action="write_ok.jsp">
	<%
		//넘어오는 페이지 번호를 변수에 저장
		String pageNum = request.getParameter("pageNum");
	
		String str = "";
		String b_title="";
		int b_id = 0;
		if(request.getParameter("b_id") != null){
			b_id = Integer.parseInt(request.getParameter("b_id"));
			BoardDBBean db = BoardDBBean.getInstance();
			BoardBean bean = db.getBoard(b_id, false);
			b_title = bean.getB_title();
			for(int i=0;i<=bean.getB_level();i++)str+="[답변]:";
	%>
		<input name="b_id" type="hidden" value="<%=b_id%>">
		<input name="b_ref" type="hidden" value="<%=bean.getB_ref()%>">
		<input name="b_level" type="hidden" value="<%=bean.getB_level()%>">
		<input name="b_step" type="hidden" value="<%=bean.getB_step()%>">
	<%
		}
	%>
		<table align="center">
			<tr height="50">
				<td colspan="4" align="center">
					<h1>글 올리기</h1>
				</td>
			</tr>
			<tr height="30">
				<td width="80">작성자</td>
				<td width="100">
<!-- 				데이터베이스의 작성자 최대 길이가 20이므로  오류를 방지하기 위해 maxlenth를 20으로 설정 -->
					<input name="b_name" type="text" size="10" maxlength="20">
				</td>
				<td width="80" align="center">이메일</td>
				<td width="100">
					<input name="b_email" type="text" size="20" maxlength="50">
				</td>
			</tr>
			<tr height="30">
				<td width="80">글제목</td>
				<td colspan="3">
	<%
				if(b_id == 0){
					%>
					<input name="b_title" type="text" size="55" maxlength="50">
					<%
				}else{
					%>
<%-- 					<input name="b_title" type="text" size="55" maxlength="50" value="<%=str%>"> --%>
					<input name="b_title" type="text" size="55" maxlength="50" value="[답변]:<%=b_title%>">
					<%
				}
	%>
				</td>
			</tr>
			<tr height="80">
				<td colspan="4">
					<textarea name="b_content" rows="10" cols="70"></textarea>
				</td>
			</tr>
			<tr height="30">
				<td width="80">암호</td>
				<td colspan="3">
					<input name="b_pwd" type="password" size="12" maxlength="12">
				</td>
			</tr>
			<tr height="30">
				<td width="80" colspan="4" align="center">
					<input type="button" value="글쓰기" onclick="check_ok();">
					&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성">
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="글목록" onclick="javascript:window.location='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>