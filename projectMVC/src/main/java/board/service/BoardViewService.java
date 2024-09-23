package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
	// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		
	// 디비
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		// 조회수 증가
		boardDAO.hitUpdate(seq);
		
	// 받아랏
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		
		return "/board/boardView.jsp";
	}

}
