package question;

public class Money {
	private int money;
	
//	public String process(int money) {
//		String str="";
//		int[] div = {50000,10000,1000,100,10,1};
//		for(int i=0; i<div.length; i++) {
//			if(money/div[i] > 0) {
//				str += (div[i]+"원 짜리: "+money/div[i] +"개<br>");
//				money %= div[i];
//			}
//			if(money == 0) break;
//		}
//		return str;
//	}
	public String process(int money) {
		StringBuffer strBuf = new StringBuffer();
		int[] div = {50000,10000,1000,100,10,1};
		for(int i=0; i<div.length; i++) {
			int res = money/div[i];
			if(res >0) {
				strBuf.append(div[i]+"원 짜리: "+res +"개<br>");
				money %= div[i];
			}
		}
		return strBuf.toString();
		
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
}
