package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void excute() {
		System.out.println();
		Scanner scanner = new Scanner(System.in);

		System.out.println("*********************************");
		System.out.println("1. 이름으로 검색");
		System.out.println("2. 아이디로 검색");
		System.out.println("*********************************");
		System.out.println();
		System.out.print("번호 선택 : ");
		int num = scanner.nextInt();

		String value = null;
		String columnName  = null;
		
		if(num==1) {	// 이름에 홍이 들어간이름 다 가져오기
			System.out.print("이름 입력 : ");
			value = scanner.next();
			columnName = "name";			
		}else if(num==2) {	// n이 들어간 id다 가져오기
			System.out.print("아이디 입력 : ");
			value = scanner.next();
			columnName = "id";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("columnName", columnName);
		map.put("value", value);
		
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list =userDAO.searchT(map);
		
		for(UserDTO userDTO : list) {
			System.out.print(userDTO.getId() + "\t");
			System.out.print(userDTO.getName() + "\t");
			System.out.print(userDTO.getPwd());
		}

		
		
	}

}
