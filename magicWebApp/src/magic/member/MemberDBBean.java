package magic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MemberDBBean {
	private String mem_uid;
	private String mem_pwd;
	private String mem_name;
	private String mem_email;
	private String mem_address;
	private Connection conn = null;
	
	public Connection init() throws SQLException, NamingException {
		this.conn = ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
		return conn;
	}
	public ResultSet selectID(String mem_uid) throws SQLException {
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement("select * from memberT where mem_uid=?");
		pstmt.setString(1, mem_uid);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}
	public void setProperty(ResultSet dbP) throws SQLException {
		this.mem_uid = dbP.getString("mem_uid");
		this.mem_pwd = dbP.getString("mem_pwd");
		this.mem_name = dbP.getString("mem_name");
		this.mem_email = dbP.getString("mem_email");
		this.mem_address = dbP.getString("mem_address");
	}
	public int insert_all(MemberBean member) throws SQLException {
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement("INSERT INTO MEMBERT(MEM_UID,MEM_PWD,MEM_NAME,MEM_EMAIL) VALUES(?,?,?,?)");
		pstmt.setString(1, member.getMem_uid());
		pstmt.setString(2, member.getMem_pwd());
		pstmt.setString(3, member.getMem_name());
		pstmt.setString(4, member.getMem_email());
		pstmt.setString(5, member.getMem_address());
		return pstmt.executeUpdate();
	}
	public int insert(MemberBean member) throws SQLException {
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement("INSERT INTO MEMBERT VALUES(?,?,?,?,?)");
		pstmt.setString(1, member.getMem_uid());
		pstmt.setString(2, member.getMem_pwd());
		pstmt.setString(3, member.getMem_name());
		pstmt.setString(4, member.getMem_email());
		return pstmt.executeUpdate();
	}
	public int update_all(MemberBean member) throws SQLException {
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement("UPDATE MEMBERT SET MEM_PWD=?,MEM_NAME=?,MEM_EMAIL=?,MEM_ADDRESS=? WHERE MEM_UID=?");
		pstmt.setString(1, member.getMem_pwd());
		pstmt.setString(2, member.getMem_name());
		pstmt.setString(3, member.getMem_email());
		pstmt.setString(4, member.getMem_address());
		pstmt.setString(5, member.getMem_uid());
		return pstmt.executeUpdate();
	}
	public int update(MemberBean member) throws SQLException {
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement("UPDATE MEMBERT SET MEM_PWD=?,MEM_NAME=?,MEM_EMAIL=? WHERE MEM_UID=?");
		pstmt.setString(1, member.getMem_pwd());
		pstmt.setString(2, member.getMem_name());
		pstmt.setString(3, member.getMem_email());
		pstmt.setString(4, member.getMem_uid());
		return pstmt.executeUpdate();
	}
	
	
	
	
	public String getMem_uid() {
		return mem_uid;
	}
	public void setMem_uid(String mem_uid) {
		this.mem_uid = mem_uid;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	
	
}
