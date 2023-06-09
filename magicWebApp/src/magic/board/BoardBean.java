package magic.board;

import java.sql.Timestamp;

public class BoardBean {
	private int b_id;
	private String b_name;
	private String b_email;
	private String b_title;
	private String b_content;
	private Timestamp b_date;
	private String b_date2;
	private int b_hit;
	private String b_pwd;
	private String b_ip;
	private int b_ref=0;
	private int b_step=0;
	private int b_level=0;
	
	private String b_fname;
	private int b_fsize;
	private String b_rfname;
	
	public String getB_rfname() {
		return b_rfname;
	}

	public void setB_rfname(String b_rfname) {
		this.b_rfname = b_rfname;
	}
	public static int pageSize = 10;	//한 페이지당 10개 출력
	public static int pageCount = 1;	//페이지 개수 지정 변수
	public static int pageNum = 1;		//페이지 번호

	//리턴: [이전] + 페이지 번호 + [다음] 
	//limit : 페이지 화면 출력 개수(ex > pdf는 4개)
	public static String pageNumber(int limit) {
		String str = "";
		int temp = (pageNum-1) % limit;
		int startPage = pageNum - temp;
		
		//[이전]  출력 여부
		if((startPage - limit) > 0) {
			str = "<a href='list.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		//페이지 번호 구현 및 현재 페이지에는 링크 달지 않음
		for(int i=startPage; i<(startPage+limit);i++) {
			if(i==pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='list.jsp?pageNum="+i+"'>"+"["+i+"]</a>&nbsp;&nbsp;";
			}
			if(i>=pageCount) break;
		}
		
		//[다음] 출력
		if((startPage + limit) <= pageCount) {
			str += "<a href='list.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}
	
	
	public String getB_fname() {
		return b_fname;
	}

	public void setB_fname(String b_fname) {
		this.b_fname = b_fname;
	}

	public int getB_fsize() {
		return b_fsize;
	}

	public void setB_fsize(int b_fsize) {
		this.b_fsize = b_fsize;
	}

	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int pageSize) {
		BoardBean.pageSize = pageSize;
	}

	public static int getPageCount() {
		return pageCount;
	}

	public static void setPageCount(int pageCount) {
		BoardBean.pageCount = pageCount;
	}

	public static int getPageNum() {
		return pageNum;
	}

	public static void setPageNum(int pageNum) {
		BoardBean.pageNum = pageNum;
	}
	
	
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getB_level() {
		return b_level;
	}
	public void setB_level(int b_level) {
		this.b_level = b_level;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getB_date2() {
		return b_date2;
	}
	public void setB_date2(String b_date2) {
		this.b_date2 = b_date2;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
}
