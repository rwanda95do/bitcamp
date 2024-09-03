package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;


@WebServlet("/write")
public class GuestbookWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	// 데이터 받기
		// post방식일 경우 넘어오는 한글 데이터는 처리해줘야 한다. 
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");;
		String homepage = request.getParameter("homepage");;
		String subject = request.getParameter("subject");;
		String content = request.getParameter("content");;
		
		System.out.println(homepage);
		
		GuestbookDTO guestbookDTO = new GuestbookDTO();
		guestbookDTO.setName(name);
		guestbookDTO.setEmail(email);
		guestbookDTO.setHomepage(homepage);
		guestbookDTO.setSubject(subject);
		guestbookDTO.setContent(content);
		
		
	// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); // 싱글톤
		guestbookDAO.guestbookWrite(guestbookDTO);
		
	// 응답: html에 뿌리기
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h3>작성하신 글을 저장하였습니다.</h3>");
		out.println("<input type='button' value='뒤로' onclick=history.go(-1)>");
		out.println("<input type='button' value='글목록' onclick=location.href='/guestbookServlet/List?page=1'>");
		out.println("</body>");
		out.println("</html>");
	}

}
