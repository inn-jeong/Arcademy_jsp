package question;

public class Alphabet {
	private char alphabet;
	public String process(char alphabet) {
		String str = "";
		//입력 범위를 벗어났을 경우 동작 추가
		if(alphabet<'a' || alphabet>'z') {
			return "입력 범위를 벗어났습니다.";
		}
		//a~ 입력 알파벳까지 문자열에 추가
		for(char i='a'; i<=alphabet; i++) {
			str += i;
		}
		return str;
	}
	public char getAlphabet() {
		return alphabet;
	}
	public void setAlphabet(char alphabet) {
		this.alphabet = alphabet;
	}
	
}
