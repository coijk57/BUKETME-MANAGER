package kr.co.ezenac.signup;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class SignUpVO {

	private int registerNum;
	private int managerCheck;
	private String email;
	private String password;
	private String phoneNum;
	private String name;
	private String gender;
	private Date birthday;
	private String instrument;
	private int memCode;
	private Timestamp joinDate;

	public SignUpVO() {
		
	}

	public int getRegisterNum() {
		return registerNum;
	}

	public void setRegisterNum(int registerNum) {
		this.registerNum = registerNum;
	}

	public int getManagerCheck() {
		return managerCheck;
	}

	public void setManagerCheck(int managerCheck) {
		this.managerCheck = managerCheck;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getInstrument() {
		return instrument;
	}

	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}

	public int getMemCode() {
		return memCode;
	}

	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "SignUpVO [registerNum=" + registerNum + ", managerCheck=" + managerCheck + ", email=" + email
				+ ", password=" + password + ", phoneNum=" + phoneNum + ", name=" + name + ", gender=" + gender
				+ ", birthday=" + birthday + ", instrument=" + instrument + ", memCode=" + memCode + ", joinDate="
				+ joinDate + "]";
	}

	
	
	
}
