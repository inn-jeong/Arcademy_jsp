<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
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
  <%
    String clientId = "xzYlQ9wIWYxDBvN7qZ2Z";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8090/magicWebApp/member/callback.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
   <script type="text/javascript">
  	function showLoginPopup(){
  		window.open("<%=apiURL%>","Naver Login", "width=450, height=600");
  	}
  </script>
  <div align="center">
	<form method="post" action="loginOK.jsp">
		<table border="1">
			<tr height="30">
				<td width="100" align="center">사용자 ID</td>
				<td width="100"> <input type="text" name="mem_uid" size="20"> </td>
			</tr>
			<tr height="30">
				<td width="100" align="center">비밀번호</td>
				<td><input type="password" name="mem_pwd" size="20"></td>
			</tr>
			<tr valign="middle">
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
				</td>
			</tr>
		</table>
	</form>
<!-- 	<button style="border:0; background-color:#fff;" onclick="showLoginPopup();"> <img width="130" height="40" src="http://static.nid.naver.com/oauth/small_g_in.PNG"> </button> -->
	<button style="border:0; background-color:#fff;" onclick="showLoginPopup();"> <img width="180" height="50" src="btnG_완성형.png"> </button>
	</div>
</body>
</html>