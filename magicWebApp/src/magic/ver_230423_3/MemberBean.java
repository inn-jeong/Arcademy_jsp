package magic.ver_230423_3;

public class MemberBean {
	private String mem_uid;
	private String mem_pwd;
	private String mem_name;
	private String mem_email;
	private String mem_address;
	
	public void setProperty(MemberDBBean dbB){
		this.mem_uid = dbB.getMem_uid();
		this.mem_pwd = dbB.getMem_pwd();
		this.mem_name = dbB.getMem_name();
		this.mem_email = dbB.getMem_email();
		this.mem_address = dbB.getMem_address();
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
