package imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dto.BoardPaging;
import imageboard.dao.ImageboardDAO;
import imageboard.dto.ImageBoardPaging;
import imageboard.dto.ImageboardDTO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	// 데이터
		int pg = 1;
		if(request.getParameter("pg")!=null) pg = Integer.parseInt(request.getParameter("pg"));
	
		int pageSize = 3;		// 한 페이지당 3개씩 
		int endNum = pg * pageSize; 
		int startNum = endNum-(pageSize-1);
	// 디비 
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ImageboardDTO> list = imageboardDAO.imageboardList(map);
		
		// 페이징
		// 1. 총글수 
		int totalA = imageboardDAO.getTotalA();
		
		ImageBoardPaging imageBoardPaging = new ImageBoardPaging();
		imageBoardPaging.setCurrentPage(pg);
		imageBoardPaging.setPageBlock(3);
		imageBoardPaging.setPageSize(pageSize);
		imageBoardPaging.setTotalA(totalA);
		
		imageBoardPaging.makePagingHTML();
	
	// 뿌리기
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("imageboardPaging", imageBoardPaging);
		
		
		return "/imageboard/imageboardList.jsp";
	}

}
