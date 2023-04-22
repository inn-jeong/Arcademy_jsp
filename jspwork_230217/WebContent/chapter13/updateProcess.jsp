<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		Connection conn = null;
		PreparedStatement pstmt = null;
		DataSource ds = null;
	%>
	<%
		//dbcp 연동하는 try
		try{
// 			Context ctx = new InitialContext();
// 			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
// 			conn = ds.getConnection();
			//dbcp 연동하는 실행문
			conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
			
		}catch(NamingException ne){
			ne.printStackTrace();
		}catch(SQLException se){
			se.printStackTrace();
		}
	
	
// *.updateMember.jsp 에서 넘어오는 값들
// name="id"
// name="name"
// name="mclass"
// name="tel"
		
		//매핑
		String id="", name="", vclass="", tel="";
		id = request.getParameter("id");
		name = request.getParameter("name");
		vclass = request.getParameter("mclass");
		tel = request.getParameter("tel");
		
		StringBuffer updateQuery = new StringBuffer();
		//member2 테이블의 name 컬럼명의 값을 aaa로 수정 
		updateQuery.append("UPDATE MEMBER2 SET NAME=?,CLASS=?,TEL=? WHERE ID=?");
		//쿼리 수정할 try
		try{
			pstmt = conn.prepareStatement(updateQuery.toString());
			//? 4개를 순서대로 값을 셋팅
			pstmt.setString(1, name);//VARCHAR2 타입은 setString 메소드 이용
			pstmt.setInt(2, Integer.parseInt(vclass));//NUMBER 타입은 setInt 메소드 이용
			pstmt.setString(3, tel);//VARCHAR2 타입은 setString 메소드 이용
			pstmt.setString(4, id);//VARCHAR2 타입은 setString 메소드 이용
			int re = pstmt.executeUpdate();//정상적으로 수정시 1이 반환됨
			
			if(re == 1){
				%>
	 				<%= id %>의 정보가 수정되었습니다. <br>
	 				[<a href="viewMember.jsp">목록보기</a>]
				<%
			}else{
				%>
					변경 실패
				<%
			}
		}catch(SQLException se){
			se.printStackTrace();
			%>
				서버 불량 잠시 후 시도
			<%
		}
	%>
</body>
</html>