package question;

public class Capital {
	private String str;
	public String process(String str) {
		char c = 'A'; 
		char c2 = str.charAt(0);
//		String result = "";
		if(c2 < 'A' || c2>'Z') {
			return "입력 범위를 벗어났습니다.";
		}
		
//		for(char i = c2; i>=c; i--) {
//			for(char j = c; j<=i; j++) {
//				result += j;
//			}
//			result += "<br>";
//		}
//		StringBuffer 를 사용한 풀이
		StringBuffer strBuf = new StringBuffer();
		for(char i = c2; i>=c; i--) {
			for(char j = c; j<=i; j++) {
				strBuf.append(j);
			}
			strBuf.append("<br>");
		}
		return strBuf.toString();
//		return result;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	
}
