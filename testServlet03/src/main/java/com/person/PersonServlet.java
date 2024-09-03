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

		// 데이터 들어오면 받기
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String color =  request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject =  request.getParameterValues("subject");
		
		
		// 응답 : 화면에 띄워주기
		response.setContentType("text/html; charset=UTF-8;");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("""
				<style type="text/css">
					li{
					color:"""+ color + """
					}
				</style>
				</head>
				""");
		
		out.println("<body>");
		
		out.println("<ul>");
		out.println("<li>이름 : "+name+"</li>");
		String gender_s="";
		if(gender.equals("0")) {
			 gender_s = "남자";
		} else {
			 gender_s = "여자";
		}
		out.println("<li>성별 : "+gender_s+"</li>");
		out.println("<li>칼라 : "+color+"</li>");
		out.println("<li>칼라 : ");
		for(int i=0; i<hobby.length; i++) {
            out.println(hobby[i] + ", ");
        }
		out.println("</li>");
		out.println("<li>과목 :");
		for(int i=0; i<subject.length; i++) {
            out.println(subject[i] + ", ");
        }
		/*
		 * for(String data:subject){
		 * 	 out.println(data + "&nbsp");
		 * }
		 * */
		out.println("</li>");
		out.println("</ul>");
		
		out.println("</body>");
		out.println("</html>");
		
		
		
	}

}
