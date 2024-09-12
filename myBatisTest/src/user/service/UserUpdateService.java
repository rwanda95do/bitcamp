package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

	@Override
	public void excute() {
		System.out.println();
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수정할 아이디 입력 : ");
		String id = scanner.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO= userDAO.getUser(id);	// select
		
		if(userDTO == null) {
			System.out.println("수정할 아이디가 없습니다.");
			return;
		} 
	
		System.out.print(userDTO.getName() + "\t");
		System.out.print(userDTO.getId() + "\t");
		System.out.print(userDTO.getPwd());
		
		System.out.print("수정할 이름 입력 : ");
		String name = scanner.next();
		System.out.print("수정할 비밀번호 입력 : ");
		String pwd = scanner.next();
		
		userDTO.setId(id);
		userDTO.setName(name);
		userDTO.setPwd(pwd);
		
		int su = userDAO.update(userDTO);
		System.out.println(su + "개의 행을 수정하였습니다.");
	
	}

}
