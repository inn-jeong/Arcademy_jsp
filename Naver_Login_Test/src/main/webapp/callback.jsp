<%@page import="login.ApiExamMemberProfile"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "xzYlQ9wIWYxDBvN7qZ2Z";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "R7mkHm93ii";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8090/Naver_Login_Test/callback.jsp", "UTF-8");
    String apiURL;
    String access_token, name="", email="", birthyear="";
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
      ApiExamMemberProfile user = new ApiExamMemberProfile();
      JSONParser parser = new JSONParser();
      JSONObject jsonObject = (JSONObject)parser.parse(res.toString());
      access_token = jsonObject.get("access_token").toString();
      JSONObject json_response =  (JSONObject)parser.parse(user.getUser(access_token));
      JSONObject json_user = (JSONObject)json_response.get("response");
      name = json_user.get("name").toString();
      email = json_user.get("email").toString();
      birthyear = json_user.get("birthyear").toString();
      out.println("<br>name:" +name+"<br>email: "+email+"<br>생일: "+birthyear);
      //String reUrl = URLEncoder.encode("main.jsp?name="+name+"&email="+email+"&birthyear="+birthyear, "UTF-8");
      //response.sendRedirect("main.jsp");
      
    } catch (Exception e) {
      System.out.println(e);
      e.printStackTrace();
    }
  %>
  <script type="text/javascript">
	  location.href= "main.jsp?name=<%= name %>&email=<%=email%>&birthyear=<%=birthyear%>"
  </script>
  </body>
</html>