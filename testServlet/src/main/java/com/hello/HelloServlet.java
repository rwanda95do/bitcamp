package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) {
		System.out.println("init...");
	}


	public void destroy() {
		System.out.println("destroy......");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet...");
		
		response.setContentType("text/html; charset=UTF-8"); // 지금 부터 쓰는 건 "text/html" 이라고 알림.
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("Hello Servlet!!<br>");
		out.println("안녕하세요 서블릿!!!!");
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
