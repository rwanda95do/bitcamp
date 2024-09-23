package imageboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dto.BoardPaging;
import imageboard.dao.ImageboardDAO;
import imageboard.dto.ImageboardDTO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	// 데이터
		int pg = 1;
		if(request.getParameter("pg")!=null) pg = Integer.parseInt(request.getParameter("pg"));
	
		int pageSize = 3;		// 페이지당 3개씩 
		int endNum = pg * pageSize; 
		int startNum = endNum-pageSize+1;
	// 디비 
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		List<ImageboardDTO> list = imageboardDAO.imageboardList(startNum, endNum);
		
		// 페이징
		// 1. 총글수 
		int totalA = imageboardDAO.getTotalA();
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(pageSize);
		boardPaging.setTotalA(totalA);
		
		boardPaging.makePagingHTML();
		
	// 뿌리기
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("pg", pg);
		
		
		return "/imageboard/imageboardList.jsp";
	}

}
