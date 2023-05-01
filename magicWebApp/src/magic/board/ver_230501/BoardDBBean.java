package magic.board.ver_230501;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDBBean {
	public static BoardDBBean instance = new BoardDBBean();
	
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
		int re = -1; //insert 결과값(-1:실패,1성공)
		try {
			conn = getConnection();
			sql = "INSERT INTO BOARDT "
					+ "VALUES((SELECT NVL(MAX(B_ID),0)+1 FROM BOARDT),?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
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
		String sql = "SELECT b_id,b_name,b_email,b_title,b_content,b_date "
					+ "FROM BOARDT ORDER BY b_id";
//		String sql = "SELECT b_id,b_name,b_email,b_title,b_content,TO_CHAR(b_date,'YYYY-MM-DD HH24:MI') "
//				+ "FROM BOARDT ORDER BY b_id";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_date(rs.getTimestamp("b_date"));
//				board.setB_date2(rs.getString(6));
//				board.setB_hit(rs.getInt(7));
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
		int hit=0;
		String sql = "SELECT b_name,b_title,b_content,b_date "
					+ "FROM BOARDT WHERE b_id ="+num;
		String updateSql = "UPDATE BOARDT SET"
				+ "B_HIT=? WHERE B_ID=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//hit = rs.getInt(5)+1;
				board.setB_name(rs.getString(1));
				board.setB_title(rs.getString(2));
				board.setB_content(rs.getString(3));
				board.setB_date(rs.getTimestamp(4));
				//board.setB_hit(hit);
			}else {
				System.out.println("불러오기 실패");
			}
			//pstmt = conn.prepareStatement(updateSql);
			//pstmt.setInt(1, hit);
			//pstmt.setInt(2,num);
			//int re = pstmt.executeUpdate();
			//if(re != 1) System.out.println("수정 실패");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}

}
