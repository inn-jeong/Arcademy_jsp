package question;

public class Asterisk {
	private int num;
	public String process(int num) {
		String str="";
		while(num!=0) {
			for(int i=0; i<num; i++) {
				str +="*";
			}
			str += "<br>";
			num--;
		}
		return str;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
