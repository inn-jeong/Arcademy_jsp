package magic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDBBean {
//	private Connection conn = null;
	private static MemberDBBean instance = new MemberDBBean();
	
	//
	public static MemberDBBean getInstance() {
		return instance;
	}
	//2) 쿼리작업에 사용할 커넥션 객체를 리턴하는 메소드(dbcp기법)
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//3) 전달인자로 받은 member를 memberT로 테이블에 삽입하는 메소드
	public int insertMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//매개변수로 받은 member 객체를 ?인  쿼리 파라미터에 매핑
		String sql = "INSERT INTO MEMBERT VALUES(?,?,?,?,?)";
		int re = -1;//초기값 -1, insert 하고나면 정상적으로 실행되면 1
		try {
			//dbcp 기법의 연결 객체
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_uid());
			pstmt.setString(2, member.getMem_pwd());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_email());
			pstmt.setString(5, member.getMem_address());
			//INSERT는 executeUpdate 메소드 호출
			pstmt.executeUpdate();
			re=1;
			pstmt.close();
			conn.close();
			System.out.println("추가 성공");
		} catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}
		return re;
	}
	public int confirmID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//매개변수로 받은 id를 ? 인 쿼리 파라미터에 매핑
		String sql = "select MEM_UID FROM MEMBERT WHERE MEM_UID=?";
		int re = -1;//초기값 -1, 아이디가 중복되면 1
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//아이디가 일치하는 로우 존재
				re = 1;
			}else {//해당 아이디가 존재하지 않음
				re = -1;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int userCheck(String id,String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT mem_pwd FROM MEMBERT WHERE mem_uid=?";
		int re = -1;//초기값 -1, 비밀번호가 일치하면 1, 비밀번호가 불일치하면 0
		String db_mem_pw="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//아이디가 일치하는 로우 존재
				db_mem_pw = rs.getString("mem_pwd");
				if(db_mem_pw.equals(pwd)) {
					re = 1;
				}else {
					re = 0;
				}
			}else {//해당 아이디가 존재하지 않음
				re = -1;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	//6)아이디가 일치하는 멤버의 정보를 얻어오는 메소드
	public MemberBean getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="SELECT * FROM MEMBERT WHERE mem_uid=?";
		//member : 쿼리결과에 해당하는 회원정보를 담는 객체
		MemberBean member=null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				member.setMem_uid(rs.getString("mem_uid"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_address(rs.getString("mem_address"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	public int updateMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		//매개변수로 받은 member 객체를 ?인  쿼리 파라미터에 매핑
		String sql = "UPDATE MEMBERT SET MEM_PWD=?,MEM_EMAIL=?,MEM_ADDRESS=? WHERE MEM_UID=?";
		int re = -1;//초기값 -1, update 하고나서 정상적으로 실행되면 1
		try {
			//dbcp 기법의 연결 객체
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_pwd());
			pstmt.setString(2, member.getMem_email());
			pstmt.setString(3, member.getMem_address());
			pstmt.setString(4, member.getMem_uid());
			//update는 executeUpdate 메소드 호출
			re = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
//			오류가 나도 출력되므로 주석처리
//			System.out.println("수정 성공");
		} catch (Exception e) {
			System.out.println("수정 실패");
			e.printStackTrace();
		}
		return re;
	}
	
}
