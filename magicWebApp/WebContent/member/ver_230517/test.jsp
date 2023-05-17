<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function sub(){
		document.form2.submit();
		document.form1.submit();
	}
</script>
<body>
	<form name="form1" method="post" action="test2.jsp">
		<input type="text" name="a">
	</form>
	<form name="form2" method="post" action="test2.jsp">
		<input type="text" name="b">
		<input type="button" value="글목록" onclick="sub();">
	</form>
</body>
</html>