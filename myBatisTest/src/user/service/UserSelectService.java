package user.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void excute() {
		System.out.println();
		
		//DB
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.getAllList();
		
		//응답
		for(UserDTO userDTO : list) {
			System.out.print(userDTO.getName() + "\t");
			System.out.print(userDTO.getId() + "\t");
			System.out.print(userDTO.getPwd() + "\t");
			System.out.println();
		}

	}

}
