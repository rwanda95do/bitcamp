package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService {

	@Override
	public void excute() {
		System.out.println();
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("이름 : ");
		String name = scanner.next();
		System.out.print("아이티 : ");
		String id = scanner.next();
		System.out.print("비밀번호 : ");
		String pwd = scanner.next();
		
		
		UserDTO userDTO = new UserDTO();
		userDTO.setName(name);
		userDTO.setId(id);
		userDTO.setPwd(pwd);
		
		
	// DB
		UserDAO userDAO = UserDAO.getInstance();
		int su = userDAO.write(userDTO);
		System.out.println(su + "개의 행이 삽입되었습니다.");
		
	}

}
