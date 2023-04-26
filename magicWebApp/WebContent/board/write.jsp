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
					<input name="b_title" type="text" size="55" maxlength="50">
				</td>
			</tr>
			<tr height="80">
				<td colspan="4">
					<textarea name="b_content" rows="10" cols="53"></textarea>
				</td>
			</tr>

			<tr height="30">
				<td width="80" colspan="4" align="center">
					<input type="button" value="글쓰기" onclick="check_ok();">
					&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>