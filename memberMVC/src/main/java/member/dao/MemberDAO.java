package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.dto.MemberDTO;


public class MemberDAO {
	
	private static MemberDAO memberDAO = new MemberDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}

	 
	public MemberDAO() {
		try {
			Reader reader =  Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
			//InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml"); // 바이트 단위
			//sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
// -----------------------
	public boolean isExistID(String id) {		// **DTO로받아서 아이디 체크 해버리고 싶으넫;; 
		boolean exist = false;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistID", id);
		if(memberDTO!=null) {exist = true;}
		
		sqlSession.close();
		
		return exist;
	}
	
	public void memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("memberSQL.memberWrite", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	} 
	
	public MemberDTO memberLogin(String id, String pwd){
		Map<String, String > map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
	

		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);
		sqlSession.close();
		
		return memberDTO;
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO = null;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberDTO = sqlSession.selectOne("memberSQL.getMember", id);
		sqlSession.close();

		return memberDTO;
	}
	
	
	public void update(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("memberSQL.update", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
}
