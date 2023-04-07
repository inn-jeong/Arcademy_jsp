package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryString
 */
//action="QueryString" 를 호출하면 @WebServerlet 이름으로 찾아옴
@WebServlet("/QueryString")
public class QueryString extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
//		out 객체로 태그를 이용해서 웹브라우저에 출력
		PrintWriter out = response.getWriter();
		String id="",pw="",vclass="",phone1="",phone2="",phone3="";
//		아래 이름을 통해서 값들이 넘어옴
//		name="id", name="pw", name="class",name="phone1",name="phone2",name="phone3"
		id = request.getParameter("id");
//		pw = request.getParameter("pw");
		vclass = request.getParameter("class");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("당신이 입력한 정보(get방식) 입니다. <br> 아이디: <b>");
		out.println(id);
		out.println("</b>");
		out.println("</body>");
		out.println("</html>");
	}


}
