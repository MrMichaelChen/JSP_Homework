package mybean.data;

public class Area {
	double a,b,c,area;
	String mess;
	public void setMess(String mess) {
		this.mess=mess;
	}
	public String getMess() {
		return mess;
	}
	public void setA(double a) {
		this.a = a;
	}
	public void setB(double b) {
		this.b = b;
	}
	public void setC(double c) {
		this.c = c;
	}
	public double getA() {
		return a;
	}
	public double getB() {
		return b;
	}
	public double getC() {
		return c;
	}
	public void setArea(double s) {
		area = s;
	}
	public double getArea() {
		return area;
	}
}
