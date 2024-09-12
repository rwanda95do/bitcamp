package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private static UserDAO userDAO = new UserDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	
	public static UserDAO getInstance() {
		return userDAO;
	}

	public UserDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // 문자(2byte)단위
			//InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml"); // 바이트 단위
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			//sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int write(UserDTO userDTO) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();	// sql세션 생성 ->ibatis를 통해 접근
		su = sqlSession.insert("userSQL.write", userDTO); 				// sqlSession.insert("ID값", 데이터);
		sqlSession.commit();
		sqlSession.close();					// try~catch부분
		
		// sqlSession.selectOne(null)
		// sqlSession.selectList(null)		// 하나 이상
		return su;
	}

	public List<UserDTO> getAllList() {	
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getAllList");
		sqlSession.close();
		return list;
	}


	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		return userDTO;
	}

	public int update(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public List<UserDTO> search(Map<String, String> map) {
		List<UserDTO> list = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		list = sqlSession.selectList("userSQL.search", map);
		sqlSession.close();
		
		return list;
	}

	public List<UserDTO> searchT(Map<String, String> map) {
		List<UserDTO> list = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		list = sqlSession.selectList("userSQL.searchT", map);
		sqlSession.close();
		
		return list;

	}


	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
