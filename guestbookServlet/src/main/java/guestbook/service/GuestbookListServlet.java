package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;


@WebServlet("/List")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 데이터 받기
		int page = Integer.parseInt(request.getParameter("page"));
		// 한페이지에 3개의글을 뿌리겠다.
		int endNum = page * 3;
		int startNum = endNum - 2;
		
	// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); // 싱글톤
		List<GuestbookDTO> list = guestbookDAO.guestbookList(startNum, endNum);
		
		// 총 글수 
		//int tatalA = guestbookDAO.getTotal();
		
	// 응답 : 뿌리기
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(list != null) {
			for (GuestbookDTO data : list) {
				out.println("""
			<table border="1" cellspacing="0" cellpadding ="5">
				<tr>
					<th width='100px;' >작성자</th>
					<td width='100px;'>""" + data.getName() + """
					</td>
					<th width='100px;'>작성일</th>
					<td width='100px;'>
						""" +data.getLogtime() + """
					</td>
				</tr>
				<tr>
					<th >이메일</th>
					<td colspan="3">
						""" + data.getEmail() + """
					</td>
				</tr>
				<tr>
					<th >홈페이지</th>
					<td colspan="3">
						""" + data.getHomepage() + """
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">
						""" + data.getSubject() + """
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><pre>
						""" + data.getContent() + """
					</pre></td>
				</tr>
			</table>
			<br>
				""");
				
			} // for	
		}

		out.println("<input type='button' value='뒤로' onclick=history.go(-1)>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
