package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 데이터
		String id = request.getParameter("id");
		System.out.println(id);
		
		// 디비
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean exist = memberDAO.isExistID(id);
		
		request.setAttribute("exist", exist); //request는 서블릿꺼 이게 forward되서 jsp까지 갈 예정
		
		return "/member/checkId.jsp";			
		
	}

	
}
