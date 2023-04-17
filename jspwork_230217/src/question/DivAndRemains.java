package question;

public class DivAndRemains {
	private int num;
	public String process(int num) {
		int ten = num/10;
		int one = num%10;
		String str;
		if(ten == one) str = "같습니다";
		else str = "다릅니다";
		
		return str;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
