<%@page import="magic.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="script.js" charset="utf-8"></script>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
	<form name="reg_frm" method="post" action="memberUpdateOK.jsp">
		<table border="1" align="center">
			<tr height="50">
				<td colspan="2" align="center">
					<h1>회원 정보 수정</h1>
					'*' 표시 항목은 필수 입력 항목입니다.
				</td>
			</tr>
			<tr height="30">
				<td width="80">User ID</td>
				<td>
					<input name="mem_uid" type="text" value="<%= (String)session.getAttribute("mem_uid") %>" size="30" readonly="readonly">
				</td>
			</tr>
			<tr height="30">
				<td width="80">암    호</td>
				<td>
					<input name="mem_pwd" type="text" size="20">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">암호 확인</td>
				<td>
					<input name="pwd_check" type="text" size="20">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">이   름</td>
				<td>
					<input name="mem_name" type="text" value="<%= (String)session.getAttribute("mem_name") %>" size="30" readonly="readonly">
				</td>
			</tr>
			<tr height="30">
				<td width="80">E-mail</td>
				<td>
					<input name="mem_email" type="text" value="<%= (String)session.getAttribute("mem_email") %>" size="30">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">주    소</td>
				<td>
					<input name="mem_address" type="text" value="<%= (String)session.getAttribute("mem_address") %>" size="40">
				</td>
			</tr>
			<tr height="30">
				<td width="80" colspan="2" align="center">
					<input type="button" value="수정" onclick="update_check_OK()">
					<input type="reset" value="다시입력">
					<input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>