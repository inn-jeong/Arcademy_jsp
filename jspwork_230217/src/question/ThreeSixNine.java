package question;

public class ThreeSixNine {
	private int num;
	public String process(int num) {
		String str = "";
		//입력 범위를 벗어났을 경우 동작 추가
		if(num < 10 || num > 99) return "입력 범위를 벗어났습니다.";
		//3의 배수만큼 "짝"
		while(num != 0) {
			if(num%10%3 == 0 && num%10 != 0) {
				str += "짝";
			}
			num /= 10;
		}
		//"짝" 이 없다면 없음 문자열 추가
		if(str.equals("")) str = " 없음";
		return "박수"+str;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
