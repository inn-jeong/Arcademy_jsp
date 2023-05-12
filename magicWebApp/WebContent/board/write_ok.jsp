<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
	<jsp:setProperty property="*" name="board"/>
	
<%
	/*
	//파일업로드 처리
	SmartUpload upload = new SmartUpload();
	upload.initialize(pageContext);
	upload.upload();
	File file = upload.getFiles().getFile(0);
	
	if(!file.isMissing()){
		fName = file.getFileName();
		file.saveAs("/upload/"+file.getFileName());
		fileSize = file.getSize();
	}
	*/
	String fName = "";
	int fileSize = 0;
	int b_id=0, b_ref=0, b_step=0, b_level=0;
	String path = request.getRealPath("upload");
	int size = 1024 * 1024; //1MB
	int filesize = 0;
	String file=""; //넘버링된 파일
	String orifile=""; //실제이름
	//DefaultFileRenamePolicy : 넘버링 처리
	MultipartRequest multi = new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());
	//파일명 가져오기
	Enumeration files = multi.getFileNames();
	String str = files.nextElement().toString();
	//file: 넘버링 처리된 파일명
	file = multi.getFilesystemName(str); //systemName == 넘버링된 이름 이라고 생각하면 됨
	
	if(file != null){
		//orifile : 실제 파일명
		orifile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
%>
	
<%
	//자바 클래스 이용해서 IP 추가
	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
%>
<%
	//String str = upload.getRequest().getParameter("b_level");
	//System.out.println("@@@###===> "+str);
	
	/*
	//파일 업로드 처리
	if(upload.getRequest().getParameter("b_id") == null){
		b_id = 0;
	}else{
		b_id = Integer.parseInt(upload.getRequest().getParameter("b_id"));
	}
	if(upload.getRequest().getParameter("b_ref") == null){
		b_ref = 0;
	}else{
		b_ref = Integer.parseInt(upload.getRequest().getParameter("b_ref"));
	}
	if(upload.getRequest().getParameter("b_step") == null){
		b_step = 0;
	}else{
		b_step = Integer.parseInt(upload.getRequest().getParameter("b_step"));
	}
	if(upload.getRequest().getParameter("b_level") == null){
		b_level = 0;
	}else{
		b_level = Integer.parseInt(upload.getRequest().getParameter("b_level"));
	}
	*/
	/*
	board.setB_id(b_id);
	board.setB_name(upload.getRequest().getParameter("b_name"));
	board.setB_email(upload.getRequest().getParameter("b_email"));
	board.setB_title(upload.getRequest().getParameter("b_title"));
	board.setB_content(upload.getRequest().getParameter("b_content"));
	board.setB_pwd(upload.getRequest().getParameter("b_pwd"));
	board.setB_ref(b_ref);
	board.setB_step(b_step);
	board.setB_level(b_level);
	board.setB_date(new Timestamp(System.currentTimeMillis()));//날짜 추가
	board.setB_ip(ip);//IP추가
	board.setB_fname(fName);
	board.setB_fsize(fileSize);
	*/
	board.setB_id(b_id);
	board.setB_name(multi.getParameter("b_name"));
	board.setB_email(multi.getParameter("b_email"));
	board.setB_title(multi.getParameter("b_title"));
	board.setB_content(multi.getParameter("b_content"));
	board.setB_pwd(multi.getParameter("b_pwd"));
	board.setB_ref(b_ref);
	board.setB_step(b_step);
	board.setB_level(b_level);
	board.setB_date(new Timestamp(System.currentTimeMillis()));//날짜 추가
	board.setB_ip(ip);//IP추가
	
	if(file != null){
		board.setB_fname(file);
		board.setB_fsize(fileSize);
		board.setB_rfname(orifile);
	}
	
	
	BoardDBBean manager = BoardDBBean.getInstance();
	int re = 0;
	re = manager.insertBoard(board);

	if(re == 1){
		%>
			<script>
// 					alert("수정 성공.");
				</script>
		<%
		response.sendRedirect("list.jsp");
	}else{
		%>
			<script>
// 					alert("수정 실패.");
				</script>
		<%
		response.sendRedirect("list.jsp");
	}
%>
</body>
</html>