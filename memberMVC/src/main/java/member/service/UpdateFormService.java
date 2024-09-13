package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

public class UpdateFormService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 데이터
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		System.out.println("session id : " + id);
		
		// 디비
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.getMember(id);
		
		// 세션
		request.setAttribute("memberDTO", memberDTO);
		
		return "/member/updateForm.jsp";
	}

}
