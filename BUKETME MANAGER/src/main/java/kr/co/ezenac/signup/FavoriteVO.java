package kr.co.ezenac.signup;

public class FavoriteVO {
	private int likeCategoryNo;
	private String likeCategoryName;
	
	public int getLikeCategoryNo() {
		return likeCategoryNo;
	}
	public void setLikeCategoryNo(int likeCategoryNo) {
		this.likeCategoryNo = likeCategoryNo;
	}
	public String getLikeCategoryName() {
		return likeCategoryName;
	}
	public void setLikeCategoryName(String likeCategoryName) {
		this.likeCategoryName = likeCategoryName;
	}
	@Override
	public String toString() {
		return "FavoriteVO [likeCategoryNo=" + likeCategoryNo + ", likeCategoryName=" + likeCategoryName + "]";
	}
	
	
}
