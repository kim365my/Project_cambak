package biz.campingcar;

public class CampingcarVO {
   private int campingcar_no;
   private String  campingcar_name;
   private String campingcar_infos;
   private String campingcar_tel;
   private String campingcar_address;
   private String campingcar_website;
   private String campingcar_img;
   private String[] campingcar_option;
   private int campingcar_rider;
   private int campingcar_sleeper;
   private String campingcar_release_time;
   private String campingcar_return_time;
   private String campingcar_license;
   private int campingcar_wd_fare;
   private int campingcar_ph_fare;
   private String campingcar_detail;
   private String user_id;
   private int campingcar_cnt;
   private String campingcar_regdate;

   // 생성자
   public CampingcarVO() {}
   public CampingcarVO(int campingcar_no, String campingcar_name, String campingcar_infos, String campingcar_tel,
		String campingcar_address, String campingcar_website, String campingcar_img, String[] campingcar_option,
		int campingcar_rider, int campingcar_sleeper, String campingcar_release_time, String campingcar_return_time,
		String campingcar_license, int campingcar_wd_fare, int campingcar_ph_fare, String campingcar_detail,
		String user_id, int campingcar_cnt, String campingcar_regdate) {
	this.campingcar_no = campingcar_no;
	this.campingcar_name = campingcar_name;
	this.campingcar_infos = campingcar_infos;
	this.campingcar_tel = campingcar_tel;
	this.campingcar_address = campingcar_address;
	this.campingcar_website = campingcar_website;
	this.campingcar_img = campingcar_img;
	this.campingcar_option = campingcar_option;
	this.campingcar_rider = campingcar_rider;
	this.campingcar_sleeper = campingcar_sleeper;
	this.campingcar_release_time = campingcar_release_time;
	this.campingcar_return_time = campingcar_return_time;
	this.campingcar_license = campingcar_license;
	this.campingcar_wd_fare = campingcar_wd_fare;
	this.campingcar_ph_fare = campingcar_ph_fare;
	this.campingcar_detail = campingcar_detail;
	this.user_id = user_id;
	this.campingcar_cnt = campingcar_cnt;
	this.campingcar_regdate = campingcar_regdate;
}


// get, set
   public int getCampingcar_no() {
      return campingcar_no;
   }
   public void setCampingcar_no(int campingcar_no) {
      this.campingcar_no = campingcar_no;
   }
   public String getCampingcar_name() {
      return campingcar_name;
   }
   public void setCampingcar_name(String campingcar_name) {
      this.campingcar_name = campingcar_name;
   }
   public String getCampingcar_infos() {
      return campingcar_infos;
   }
   public void setCampingcar_infos(String campingcar_infos) {
      this.campingcar_infos = campingcar_infos;
   }
   public String getCampingcar_tel() {
      return campingcar_tel;
   }
   public void setCampingcar_tel(String campingcar_tel) {
      this.campingcar_tel = campingcar_tel;
   }
   public String getCampingcar_address() {
      return campingcar_address;
   }
   public void setCampingcar_address(String campingcar_address) {
      this.campingcar_address = campingcar_address;
   }
   public String getCampingcar_website() {
      return campingcar_website;
   }
   public void setCampingcar_website(String campingcar_website) {
      this.campingcar_website = campingcar_website;
   }
   public String getCampingcar_img() {
      return campingcar_img;
   }
   public void setCampingcar_img(String campingcar_img) {
      this.campingcar_img = campingcar_img;
   }
   public String[] getCampingcar_option() {
      return campingcar_option;
   }
   public void setCampingcar_option(String[] campingcar_option) {
      this.campingcar_option = campingcar_option;
   }
   public int getCampingcar_rider() {
      return campingcar_rider;
   }
   public void setCampingcar_rider(int campingcar_rider) {
      this.campingcar_rider = campingcar_rider;
   }
   public int getCampingcar_sleeper() {
      return campingcar_sleeper;
   }
   public void setCampingcar_sleeper(int campingcar_sleeper) {
      this.campingcar_sleeper = campingcar_sleeper;
   }
   public String getCampingcar_release_time() {
      return campingcar_release_time;
   }
   public void setCampingcar_release_time(String campingcar_release_time) {
      this.campingcar_release_time = campingcar_release_time;
   }
   public String getCampingcar_return_time() {
      return campingcar_return_time;
   }
   public void setCampingcar_return_time(String campingcar_return_time) {
      this.campingcar_return_time = campingcar_return_time;
   }
   public String getCampingcar_license() {
      return campingcar_license;
   }
   public void setCampingcar_license(String campingcar_license) {
      this.campingcar_license = campingcar_license;
   }
   public int getCampingcar_wd_fare() {
      return campingcar_wd_fare;
   }
   public void setCampingcar_wd_fare(int campingcar_wd_fare) {
      this.campingcar_wd_fare = campingcar_wd_fare;
   }
   public int getCampingcar_ph_fare() {
      return campingcar_ph_fare;
   }
   public void setCampingcar_ph_fare(int campingcar_ph_fare) {
      this.campingcar_ph_fare = campingcar_ph_fare;
   }
   public String getCampingcar_detail() {
      return campingcar_detail;
   }
   public void setCampingcar_detail(String campingcar_detail) {
      this.campingcar_detail = campingcar_detail;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public int getCampingcar_cnt() {
   return campingcar_cnt;
   }
   public void setCampingcar_cnt(int campingcar_cnt) {
      this.campingcar_cnt = campingcar_cnt;
   }
   public String getCampingcar_regdate() {
      return campingcar_regdate;
   }
   public void setCampingcar_regdate(String campingcar_regdate) {
      this.campingcar_regdate = campingcar_regdate;
   }
   
}