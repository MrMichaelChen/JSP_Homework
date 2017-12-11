package mybean.data;

public class login_bean {
	String userid;
	String username;
	String passwd;
	String userrole;
	String userage;
	String usersex;
	
	public void setuserid(String userid) {
		userid=userid;
	}
	public void setusername(String username) {
		username=username;
	}
	public void setpasswd(String passwd) {
		passwd=passwd;
	}
	public void setuserrole(String userrole) {
		userrole=userrole;
	}
	public void setuserage(String userage) {
		userage=userage;
	}
	public void setusersex(String usersex) {
		usersex=usersex;
	}
	public String getuserid(){
		return passwd;
	}
	public String getusername() {
		return username;
	}
	public String getpasswd() {
		return passwd;
	}
	public String getuserrole() {
		return userrole;
	}
	public String getuserage() {
		return userage;
	}
	public String getusersex() {
		return usersex;
	}
	
}
