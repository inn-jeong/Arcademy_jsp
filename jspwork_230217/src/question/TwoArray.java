package question;

public class TwoArray {
	private int num;
	
	public String process(int num) {
		int[][] arr = new int[num][num];
		StringBuffer strBuf = new StringBuffer();
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = (int)(Math.random()*10)+1;
				strBuf.append(arr[i][j]+" ");
			}
			strBuf.append("<br>");
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
