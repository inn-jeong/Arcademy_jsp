package question;

public class Arithmetic_A {
	private int num1;
	private int num2;
	private String op;
	
	public String process(int num1, String op, int num2) {
		String result = "";
		int res = 0;

		switch(op) {
		case "+":
			res = num1+num2;
			break;
		case "-":
			res = num1-num2;			
			break;
		case "*":
			res = num1*num2;			
			break;
		case "/":
			if(num2 != 0) {
				return result= num1+op+num2+"의 계산 결과는"+((double)num1/num2);
			}else {
				return result = "0으로 나눌 수 없습니다.";
			}
		default:
			return result = "사칙연산이 아닙니다.";
		}
		result = num1+op+num2+"의 계산 결과는 "+res;
		return result;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}
}
