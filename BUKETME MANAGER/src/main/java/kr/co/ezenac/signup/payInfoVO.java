package kr.co.ezenac.signup;

import java.util.Date;

public class payInfoVO {
	
	private int paycode;
	private int registernum;
	private int cardnum;
	private Date paymentdate;
	private String birthdate;
	
	public payInfoVO() {
	}

	public int getPaycode() {
		return paycode;
	}

	public void setPaycode(int paycode) {
		this.paycode = paycode;
	}

	public int getRegisternum() {
		return registernum;
	}

	public void setRegisternum(int registernum) {
		this.registernum = registernum;
	}

	public int getCardnum() {
		return cardnum;
	}

	public void setCardnum(int cardnum) {
		this.cardnum = cardnum;
	}

	public Date getPaymentdate() {
		return paymentdate;
	}

	public void setPaymentdate(Date paymentdate) {
		this.paymentdate = paymentdate;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	
}
