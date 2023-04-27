<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
		Context ctx = null;
		DataSource ds = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT EMPNO 사원번호"
	        	+",ENAME 사원명"
	        	+",JOB 직급"
	        	+",MGR 상관번호"
	        	+",TO_CHAR(HIREDATE,'YYYY-MM-DD HH24:MI:SS') 입사일자"
	        	+",SAL 급여"
	        	+",COMM 커미션"
	        	+",DEPTNO 부서번호"
			+" FROM EMP";
	%>
	<table border="1">
		<tr>
			<td width="80">사원번호</td>
			<td width="80">사원명</td>
			<td width="120">직급</td>
			<td width="80">상관번호</td>
			<td width="200">입사일자</td>
			<td width="60">급여</td>
			<td width="60">커미션</td>
			<td width="80">부서번호</td>
		</tr>
	<%
		try{
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				%><tr><%
					for(int i=1;i<=8;i++){
						%>
						<td><%= rs.getString(i) %></td>
						<%
					}
				%></tr><%
			}
		}catch(SQLException se){
			se.printStackTrace();
		}catch(NamingException ne){
			ne.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
	%>
	</table>
	
</body>
</html>