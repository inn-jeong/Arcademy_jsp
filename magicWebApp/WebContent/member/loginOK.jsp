
<%@page import="magic.member.MemberDBBean"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>

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
	<%
		String id="", pw="";
		id = request.getParameter("mem_uid");
		pw = request.getParameter("mem_pwd");
		MemberDBBean manager = MemberDBBean.getInstance();
		//초기값 -1, 비밀번호가 일치하면 1, 비밀번호가 불일치하면 0
		int check = manager.userCheck(id, pw);
		mb = manager.getMember(id);
		if(mb == null){//회원 없음
			%>
			<script>
				alert("존재하지 않는 회원");
				history.back();
			</script>
			<%
		}else{//회원 있음
			String name = mb.getMem_name();
			if(check==1){//비밀번호가 일치하면 1
				session.setAttribute("mem_uid", id);
				session.setAttribute("mem_pwd", mb.getMem_pwd());
				session.setAttribute("Member", "yes");//main화면으로 넘어올때 로그인 되어 있는지
				session.setAttribute("mem_name", name);
				session.setAttribute("mem_email", mb.getMem_email());
				session.setAttribute("mem_address", mb.getMem_address());
				response.sendRedirect("main.jsp");
			}else if(check == 0){
				%>
				<script>
					alert("비밀번호가 맞지 않습니다.");
					history.back();
				</script>
				<%
			}else{
				%>
				<script>
					alert("아이디가 맞지 않습니다.");
					history.back();
				</script>
				<%
			}
		}
		
	%>
</body>
</html>