package question;

public class Array3 {
	private int num;
	public String process(int num) {
		StringBuffer strBuf = new StringBuffer();
		for(int i=0; i<num; i++) {
			int ran = (int)(Math.random()*100)+1;
			strBuf.append(ran+" ");
			if(i%9 == 0 && i != 0) {
				strBuf.append("<br>");
			}
		}
		return strBuf.toString();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
