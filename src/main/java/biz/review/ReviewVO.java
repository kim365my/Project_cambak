package biz.review;

public class ReviewVO {
   private int review_no; 
   private int review_score; 
   private String review_content; 
   private String user_id;
   private int campingcar_no;
   
   public ReviewVO() {}
   public ReviewVO(int review_no, int review_score, String review_content, String user_id, int campingcar_no) {
	this.review_no = review_no;
	this.review_score = review_score;
	this.review_content = review_content;
	this.user_id = user_id;
	this.campingcar_no = campingcar_no;
}

// get, set
   public int getReview_no() {
      return review_no;
   }
   public void setReview_no(int review_no) {
      this.review_no = review_no;
   }
   public int getReview_score() {
      return review_score;
   }
   public void setReview_score(int review_score) {
      this.review_score = review_score;
   }
   public String getReview_content() {
      return review_content;
   }
   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
	public int getCampingcar_no() {
		return campingcar_no;
	}
	public void setCampingcar_no(int campingcar_no) {
		this.campingcar_no = campingcar_no;
	}
	   
   
}