package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorld3
 */
@WebServlet("/HelloWorld3")
public class HelloWorld3 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
//		response.setContentType("text/html;charset=euc-kr");//문자셋 추가
//		response.setContentType("text/html;charset=EUC-KR");//문자셋 추가(대문자)
//		response.setContentType("text/html;charset=UTF-8");//문자셋 추가(utf-8)
//		response.setContentType("text/html;charset=utf-8");//문자셋 추가
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello~</title>");
		out.println("<body>");
		out.println("<h1>안녕하세요~!!</h1>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
		out.close();
	}

}
