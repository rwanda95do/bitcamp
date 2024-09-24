package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dao.BoardDAO;
import imageboard.dto.ImageboardDTO;

public class ImageboardDAO {
	
	private static ImageboardDAO imageboardDAO = new ImageboardDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public static ImageboardDAO getInstance() {
		return imageboardDAO;
	}
	
	public ImageboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
// --------------------------------------------------------------------------
	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("imageboardSQL.imageboardWrite", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ImageboardDTO> list = sqlSession.selectList("imageboardSQL.imageboardList",map);
		sqlSession.close();
		
		return list;
	}

	public int getTotalA() {
		int totalA=0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		totalA = sqlSession.selectOne("imageboardSQL.getTotalA");
		sqlSession.close();
		
		return totalA;
	}
}
