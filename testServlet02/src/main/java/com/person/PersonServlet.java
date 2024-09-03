package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Tomcat은 서블릿이 있는지 모르니까. 1)web.xml가서 알려주기
		
		
		// 2. 데이터가 들어오면 받고
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// 3. 응답 : 화면에 띄워주기
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println(name + "님의 나이는 " + age + "입니다.<br>");
		if(age>=19) {
			out.println("<font color='red'>성인</font>입니다<br>");
		}else {
			out.println("청소년입니다<br>");
		}
		
		out.println("<input type='button' value='뒤로가기' onclick=history.go(-1) />");
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
