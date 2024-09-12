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
		
		System.out.println(exist);
		
		request.setAttribute("exist",exist);
		request.setAttribute("id", id);
		
		return "/member/checkId.jsp";			
		
	}

	
}
