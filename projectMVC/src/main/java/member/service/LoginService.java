package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 데이터 
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		// 디비
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.memberLogin(id, pwd);
		
		if(memberDTO == null) {
			return "/member/loginFail.jsp";
		} else {
			// 세션 (서버)
			HttpSession session = request.getSession();		// 세션 생성 : java는 session이 없다. 때문에 선언 팔요.
			session.setAttribute("memId", id);	// 세션생성
			session.setAttribute("memName", memberDTO.getName());	// 세션생성
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			// session.setAttribute("memDTO", memberDTO);
			return "/member/loginOk.jsp";			
		}
		
	
	}

}
