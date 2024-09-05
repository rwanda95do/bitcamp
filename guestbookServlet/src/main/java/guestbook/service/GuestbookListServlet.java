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
		System.out.println(page);
		
		// 한페이지에 3개의글을 뿌리겠다.
		int endNum = page * 3;
		int startNum = endNum - 2;
		
	// DB
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); // 싱글톤
		List<GuestbookDTO> list = guestbookDAO.guestbookList(startNum, endNum);
		
		// 페이지 :  총 글수 
		int totalA = guestbookDAO.getTotal();
		int totalP = (totalA + 2) / 3;		//(totoalA / 3) + (totalA % 3);
		
	// 응답 : 뿌리기
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<style>");
		out.println("#currentPaging{ color:red; text-decoration:underline}");
		out.println("#paging{ color:black; text-decoration:none}");
		out.println("</style>");
		out.println("<body>");
		
		
		
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
		} // 리스트 출력

		out.println("<input type='button' value='뒤로' onclick=history.go(-1)>");
		
		
		// 페이지
		System.out.println(totalA + ", " + totalP);
		out.println("<br>");
		for(int i=1; i<=totalP; i++) {
			if(i == page) {
				out.println("[<a id='currentPaging' href='/guestbookServlet/List?page="+i+"'>" + i + "</a>]");				
			} else {
				out.println("[<a id='paging' href='/guestbookServlet/List?page="+i+"'>" + i + "</a>]");
			}
			
		}
		
		out.println("</body>");
		out.println("</html>");
	}

}
