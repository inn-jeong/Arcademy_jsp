<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>등급</td>
			<td>전화번호</td>
		</tr>
		<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
// 				createStatement(): 메소드 호출해서 쿼리 이용하는 Statement 객체 생성
				stmt = conn.createStatement();
// 				executeQuery 메소드로 select 쿼리 실행
// 				쿼리 결과는 ResultSet으로 담는다.
				rs = stmt.executeQuery(sql);

// 				next() : 쿼리 결과가 있으면 참
				while(rs.next()){
					%>
					<tr>
<!-- 					getString: 문자타입의 컬럼 값 받을 때 사용 -->
						 <td> <%= rs.getString("id") %> </td>
						 <td> <%= rs.getString("name") %> </td>
<!-- 						 타입에 맞지 않게 가져와도 오류가 나지는 않지만 -->
<!-- 						  보이지 않게 캐스팅 과정을 거치기 때문에 성능 저하가 있을 수 있음 -->
						 <td>
							 <%
							 	int n_class = rs.getInt("class");
							 	if(n_class == 1){
							 		out.print("일반회원");
							 	}else{
							 		out.print("교수님");
							 	}
							 %>
						</td>
						 <td> <%= rs.getString("tel") %> </td>
					</tr>
					<%
				}
			}catch(SQLException se){
// 				printStackTrace(): 기본 오류 메시지
				se.printStackTrace();
// 			생략 가능
			} finally{
// 				자원 반납할 때 오류 발생시 처리
				try{
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch(SQLException se){
					se.printStackTrace();
				}
			}
		%>
		
	</table>
<%!
	Connection conn = null;
// 	쿼리문 이용을 위한 인터페이스
	Statement stmt = null;
// 	쿼리 결과를 받기 위한 인터페이스
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost:3306/jspdb";
	String user = "root";
	String password = "1234";
	String sql = "SELECT * FROM MEMBER2";
%>
</body>
</html>