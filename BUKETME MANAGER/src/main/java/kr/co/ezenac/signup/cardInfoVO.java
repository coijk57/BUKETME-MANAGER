package kr.co.ezenac.signup;

import java.util.Date;

public class cardInfoVO {
	
	private String cardnum;
	private String expiredate;
	private String cardowner;
	private String cardownerbirthday;
	private int registerNum;
	
	
	public cardInfoVO() {
	}


	public String getCardnum() {
		return cardnum;
	}


	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}


	public String getExpiredate() {
		return expiredate;
	}


	public void setExpiredate(String expiredate) {
		this.expiredate = expiredate;
	}


	public String getCardowner() {
		return cardowner;
	}


	public void setCardowner(String cardowner) {
		this.cardowner = cardowner;
	}


	public String getCardownerbirthday() {
		return cardownerbirthday;
	}


	public void setCardownerbirthday(String cardownerbirthday) {
		this.cardownerbirthday = cardownerbirthday;
	}


	public int getRegisternum() {
		return registerNum;
	}


	public void setRegisternum(int registerNum) {
		this.registerNum = registerNum;
	}


	@Override
	public String toString() {
		return "cardInfoVO [cardnum=" + cardnum + ", expiredate=" + expiredate + ", cardowner=" + cardowner
				+ ", cardownerbirthday=" + cardownerbirthday + ", registerNum=" + registerNum + "]";
	}

}
