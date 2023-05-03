package magic.board;

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
		String sql = "";
		int re = -1; //insert 결과값(-1:실패,1성공)
		try {
			conn = getConnection();
			sql = "INSERT INTO BOARDT "
					+ "VALUES((SELECT NVL(MAX(B_ID),0)+1 FROM BOARDT),?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
			pstmt.setInt(6, 0);
			pstmt.setString(7, board.getB_pwd());
			pstmt.setString(8, board.getB_ip());
			
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
		String sql = "SELECT b_id,b_name,b_email,b_title,b_content,b_date,b_hit,b_pwd,b_ip "
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
				board.setB_hit(rs.getInt(7));
				board.setB_pwd(rs.getString(8));
				board.setB_ip(rs.getString(9));
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
	
	//내가 한거
//	public BoardBean getBoard(int num) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		BoardBean board = new BoardBean();
//		int hit=0;
//		String sql = "SELECT b_name,b_title,b_content,b_date,b_hit "
//					+ "FROM BOARDT WHERE b_id ="+num;
//		String updateSql = "UPDATE BOARDT SET "
//				+ "B_HIT=? WHERE B_ID=?";
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				hit = rs.getInt(5)+1;
//				board.setB_name(rs.getString(1));
//				board.setB_title(rs.getString(2));
//				board.setB_content(rs.getString(3));
//				board.setB_date(rs.getTimestamp(4));
//				board.setB_hit(hit);
//			}else {
//				System.out.println("불러오기 실패");
//			}
//			pstmt = conn.prepareStatement(updateSql);
//			pstmt.setInt(1, hit);
//			pstmt.setInt(2,num);
//			int re = pstmt.executeUpdate();
//			if(re != 1) System.out.println("수정 실패");
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return board;
//	}
	//강사님
	public BoardBean getBoard(int num,boolean viewup) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean board = new BoardBean();
		String sql = "SELECT b_name,b_email,b_title,b_content,b_date,b_hit,b_pwd,b_ip "
				+ "FROM BOARDT WHERE b_id ="+num;
		String updateSql = "UPDATE BOARDT SET "
				+ "B_HIT=B_HIT+1 WHERE B_ID=?";
		
		try {
			conn = getConnection();
			if(viewup) {
				pstmt = conn.prepareStatement(updateSql);
				pstmt.setInt(1,num);
				int re = pstmt.executeUpdate();
				if(re != 1) System.out.println("수정 실패");
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setB_name(rs.getString(1));
				board.setB_email(rs.getString(2));
				board.setB_title(rs.getString(3));
				board.setB_content(rs.getString(4));
				board.setB_date(rs.getTimestamp(5));
				board.setB_hit(rs.getInt(6));
				board.setB_pwd(rs.getString(7));
				board.setB_ip(rs.getString(8));
				
			}else {
				System.out.println("불러오기 실패");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	public int deleteBoard(int num, String check_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String delete_sql = "";
		String select_sql="";
		String b_pwd="";
		int re=-1; //결과(1:성공, -1:실패, -2:비밀번호 틀림)
		try {
			conn = getConnection();
			select_sql = "SELECT B_PWD FROM BOARDT WHERE B_ID=?";
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //num번호 게시글의 비밀번호 조회
			
			if(rs.next()) {
				b_pwd = rs.getString(1);
				System.out.println("조회성공");//콘솔로 확인하기 위한 코드
				if(b_pwd.equals(check_pwd)) { //입력한 비밀번호가 맞을 시
					delete_sql = "DELETE FROM BOARDT WHERE B_ID = ?";
					pstmt = conn.prepareStatement(delete_sql);
					pstmt.setInt(1, num);
					re = pstmt.executeUpdate(); //데이터 삭제
				}else { //틀렸을 시
					re = -2;
				}
			}else {
				System.out.println("조회실패");//콘솔로 확인하기 위한 코드
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public int editBoard(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String select_sql = "";
		String edit_sql = "";
		String b_pwd="";
		int b_id = board.getB_id();
		int re = -1; //insert 결과값(-1:실패,1성공)
		try {
			conn = getConnection();
			select_sql = "SELECT B_PWD FROM BOARDT WHERE B_ID=?";
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery(); //num번호 게시글의 비밀번호 조회
			
			if(rs.next()) {
				b_pwd = rs.getString(1);
				System.out.println("edit-비밀번호 조회성공");//콘솔로 확인하기 위한 코드
				if(b_pwd.equals(board.getB_pwd())) { //입력한 비밀번호가 맞을 시
					edit_sql = "UPDATE BOARDT SET "
							+ "B_NAME = ?,B_EMAIL=?,B_TITLE=?,B_CONTENT=? "
							+ "WHERE B_ID=?";
					pstmt = conn.prepareStatement(edit_sql);
					pstmt.setString(1, board.getB_name());
					pstmt.setString(2, board.getB_email());
					pstmt.setString(3, board.getB_title());
					pstmt.setString(4, board.getB_content());
					pstmt.setInt(5, b_id);
					
					re = pstmt.executeUpdate();
				}else { //틀렸을 시
					re = -2;
				}
			}else {
				System.out.println("조회실패");//콘솔로 확인하기 위한 코드
			}
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("sql 오류 발생");
			e.printStackTrace();
		}
		
		return re;
	}

}
