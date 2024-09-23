package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
import board.dto.BoardPaging;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	// 데이터
		int pg =1; 
		if(request.getParameter("pg")!=null) pg = Integer.parseInt(request.getParameter("pg"));

		// 1페이지당 5개
		int endNum = pg*5;
		int startNum = endNum-4;
		
		
	// DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list=boardDAO.boardList(startNum, endNum);
		
	// 페이징 처리 
		// 1. 총글수
		int totalA = boardDAO.getTotalA();

		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		
		boardPaging.makePagingHTML();
		
		
	// 들고갈 데이터
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("pg", pg);
		
		return "/board/boardList.jsp";
	}

}
