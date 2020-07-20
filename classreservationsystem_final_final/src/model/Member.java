package model;

public class Member {
	
	private String name;
	private int id;
	private String passwd;
	private String email;
	private String phonenum;
	private String major;
	private int loginpermission;
	private String count;
	private String countdate;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getLoginPermission() {
		return loginpermission;
	}

	public void setLoginPermission(int loginpermission) {
		this.loginpermission = loginpermission;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCountdate() {
		return countdate;
	}

	public void setCountdate(String countdate) {
		this.countdate = countdate;
	}


}