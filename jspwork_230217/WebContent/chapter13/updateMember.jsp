<%@page import="javax.naming.*"%>
<%@page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*" %>
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
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DataSource ds = null;
		
		//밑의 3줄은 server.xml에 들어가 있어 삭제
// 		String url = "jdbc:oracle:thin:@localhost:1521:xe";
// 		String user = "scott";
// 		String password = "tiger";
// 		String sql = "SELECT * FROM MEMBER2";
	%>
	<%
		try{
			Context ctx = new InitialContext();
			//java:comp/env : server.xml 에서 Resource 태그에 name을 찾아감
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
			System.out.println("DBCP 연동 성공");
			
			//조회하기 위해서 StringBuffer 객체를 생성해서 쿼리 실행
// 			회원정보를 가지고 오는 방법 2가지(1번 방법 선택)
// 			1. id 를 가지고 회원정보를 가지고 옴(select 쿼리 작업이 추가로 필요함)
// 			2. viewMember.jsp에서 직접 값들을 가지고 옴(다른 화면에서 수정시 값들이 반영이 안됨)
			StringBuffer selectQuery = new StringBuffer();
			//실무에서는 모든 컬럼을 가져오다보면 속도 문제로 *를 잘 쓰지 않음.
			//필요한 컬럼의 데이터만 가져올 수 있도록 한다.
			//? -> prepareStatement 방식, 밑에서 ?의 개수만큼 값을 넣어주면 됨.
			//id값은 request.getParameter 로 가져옴
			selectQuery.append("SELECT NAME, CLASS, TEL FROM MEMBER2 WHERE ID=?");
			String id = request.getParameter("id");
// 			dbcp 연결 정보 객체(conn)를 가지고, prepareStatement 메소드 호출해서 
// 			PrepareStatement 객체 생성해서 쿼리 사용
			pstmt = conn.prepareStatement(selectQuery.toString());
			//?의 개수가 하나이므로 첫번째 물음표라는 의미의 매개변수값이 1
			//setString() 메소드: 쿼리 파라미터 값을 저장
			pstmt.setString(1, id);
			//executeQuery 메소드로 쿼리 실행해서 결과값을 ResultSet 객체로 받음
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//쿼리 결과값 출력("SELECT NAME, CLASS, TEL FROM MEMBER2 WHERE ID=?")
				%>
<!-- 				결과값을 가지고 update 하기 위한 jsp로 이동(form action 태그 추가) -->
					<form method="post" action="updateProcess.jsp">
						아이디: <input type="text" name="id" value="<%= id %>"> <br> 
						이름: <input type="text" name="name" value="<%= rs.getString("name") %>"> <br>
						회원등급: <input type="text" name="mclass" value="<%= rs.getString("class") %>"> <br>
						전화번호: <input type="text" name="tel" value="<%= rs.getString("tel") %>"> <br>
						<input type="submit" value="수정">
						<a href="viewMember.jsp">목록보기</a>
					</form>
				<%
				
				
			}else{
				%>
					<font color="red">아이디 없3~~</font>
					<a href="viewMember.jsp">목록보기</a>
				<%
			}
			
			
		}catch(NamingException ne){
			ne.printStackTrace();
		}catch(SQLException se){
			se.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch(SQLException se){
				se.printStackTrace();
			}
		}
	%>
</body>
</html>