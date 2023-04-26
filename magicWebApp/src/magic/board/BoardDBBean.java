package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
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
}
