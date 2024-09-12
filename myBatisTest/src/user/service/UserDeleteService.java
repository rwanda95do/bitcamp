package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void excute() {
		System.out.println();
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("삭제할 아이디 입력 : ");
		String id = scanner.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO= userDAO.getUser(id);	// select
		
		if(userDTO == null) {
			System.out.println("삭제할 아이디가 없습니다.");
		} else {
			userDAO.delete(id);
			System.out.println("삭제하였습니다.");
		}
		
	}

}
