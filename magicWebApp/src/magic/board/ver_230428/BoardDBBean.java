package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDBBean {
	public static BoardDBBean  instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	public int insertBoard(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
//		ResultSet rs = null;
		String sql = "";
//		int num;
//		int maxNum = maxId()+1;
		int re = -1;
		try {
			conn = getConnection();
			sql = "INSERT INTO BOARDT "
					+ "VALUES((SELECT NVL(MAX(B_ID),0)+1 FROM BOARDT),?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			//INSERT는 executeUpdate 메소드 호출
			re = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("sql 오류 발생");
			e.printStackTrace();
		}
		return re;
	}
	
	public ArrayList<BoardBean> listBoard(){
		ArrayList<BoardBean> list= new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT b_id,b_name,b_email,b_title,b_content "
					+ "FROM BOARDT ORDER BY b_id";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_id(rs.getInt("b_id"));
				board.setB_name(rs.getString("b_name"));
				board.setB_email(rs.getString("b_email"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
				
				list.add(board);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public BoardBean getBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean board = new BoardBean();
		String sql = "SELECT b_name,b_title,b_content "
					+ "FROM BOARDT WHERE b_id ="+num;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setB_name(rs.getString("b_name"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
			}else {
				System.out.println("불러오기 실패");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
}
