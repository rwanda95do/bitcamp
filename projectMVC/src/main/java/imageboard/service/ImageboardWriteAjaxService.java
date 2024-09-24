package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import imageboard.dao.ImageboardDAO;
import imageboard.dto.ImageboardDTO;

public class ImageboardWriteAjaxService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	// 사진 파일 받기
		// 실제 폴더
		String realFolder = request.getServletContext().getRealPath("/storage");	// 이미지가 저장되는 위치 - 나중에 naver클라우드위치가 될꺼임 
		System.out.println("realFolder :  " + realFolder);
		
		// 업로드 : MultipartRequest
			// 	MultipartRequest multi = new MultipartRequest(request, realFolder,[byte], 파일명 한글);
			// 한글파일명을 허용해버리면.. 내려받을때 깨질수 있으니 허용하지 않는걸 추천한다.
//		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8");
// 또는		
		// new DefaultFileRenamePolicy() : 같은 이름이 업로드되면 파일명을 변경해서 올린다
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
	
	// 데이터
		//request.getParameter 아님 -> multi 이게 다 요청을 받아오고 있는 중 
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		
		String image1 = multi.getOriginalFileName("image1");	// 이미지의 원래 파일이름을 얻어와라
		String filename = multi.getFilesystemName("image1");	// 이미지의 변경된 파일이름을 얻어와라
		
		
		System.out.println("imageId : " + imageId);
		System.out.println("imageName : " + imageName);
		System.out.println("imagePrice : " + imagePrice);
		System.out.println("imageQty : " + imageQty);
		System.out.println("imageContent : " + imageContent);
		System.out.println("image1 : " + image1);
		System.out.println("filename : " + filename);
		
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(imageId);
		imageboardDTO.setImageName(imageName);
		imageboardDTO.setImagePrice(imagePrice);
		imageboardDTO.setImageQty(imageQty);
		imageboardDTO.setImageContent(imageContent);
		imageboardDTO.setImage1(image1);	// 파일명만 DB에 저장된다. 실제 이미지는 실제폴더에 저장되어 있다. 
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardWrite(imageboardDTO);
		
		
		return "none";
	}

}
