package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.dto.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private static BoardDAO boardDAO = new BoardDAO();
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		Context ctx;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // tomcat일때만
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
// ----------------------------------------------
	public void write(String id, String name, String email, String subject, String content){
		
		String sql = """
				insert into board(seq, id, name, email, subject, content, ref) 
				values (seq_board.nextval,?, ?, ?, ?, ?,seq_board.nextval)
				""";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, subject);
			pstmt.setString(5, content);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // write
	
	
	public List<BoardDTO> boardList(int startNum, int endNum){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = """
				select * from
				(select rownum rn, tt.* from
				(select * from board order by ref desc, step asc)tt
				)where rn >=? and rn<=?
				""";
		
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDTO boardDTO = new BoardDTO();
				
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getDate("logtime"));
				
				list.add(boardDTO);		
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;		// 뭔가 잘못되면 list를 null로 초기화
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
	} // boardList
	
	
	public int getTotalA() {
		int totalA=0;
		
		String sql = "select count(*) from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalA = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return totalA;
	}
	
	
	
	
}
