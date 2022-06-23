package kr.co.ezenac.manager;

import java.sql.Date;
import java.sql.Timestamp;

public class VideoVO {

	private int videoNum;
	private String title;
	private String contents;
	private String category;
	private String likeCategory;
	private String imageFileName;
	private String videoFileName;
	private String ageLimit;
	private String openDate;//공개일
	private Timestamp postDate;//업로드 날짜
	private int videoHits;
	private String actors;
	private String director;
	
	public VideoVO() {
		
	}

	public int getVideoNum() {
		return videoNum;
	}

	public void setVideoNum(int videoNum) {
		this.videoNum = videoNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLikeCategory() {
		return likeCategory;
	}

	public void setLikeCategory(String likeCategory) {
		this.likeCategory = likeCategory;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getVideoFileName() {
		return videoFileName;
	}

	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}

	public String getAgeLimit() {
		return ageLimit;
	}

	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}

	public int getVideoHits() {
		return videoHits;
	}

	public void setVideoHits(int videoHits) {
		this.videoHits = videoHits;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	@Override
	public String toString() {
		return "VideoVO [videoNum=" + videoNum + ", title=" + title + ", contents=" + contents + ", category="
				+ category + ", likeCategory=" + likeCategory + ", imageFileName=" + imageFileName + ", videoFileName="
				+ videoFileName + ", ageLimit=" + ageLimit + ", openDate=" + openDate + ", postDate=" + postDate
				+ ", videoHits=" + videoHits + ", actors=" + actors + ", director=" + director + "]";
	}
	
	
}
