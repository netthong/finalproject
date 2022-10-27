package com.project.dragonball.model.user.dto;

public class UserListDTO {
	private String userid; //아이디
	private String password; //비밀번호
	private String name; //이름 
	private String email; //이메일
	private String tel; //전화번호 
	private int point; //포인트 
	private char category; //사업자, 유저, 관리자 구분 
	private char out; //탈퇴
	private char stop; //정지
	
	//getters and setters
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public char getCategory() {
		return category;
	}
	public void setCategory(char category) {
		this.category = category;
	}
	public char getOut() {
		return out;
	}
	public void setOut(char out) {
		this.out = out;
	}
	public char getStop() {
		return stop;
	}
	public void setStop(char stop) {
		this.stop = stop;
	}
	
	//toString
	@Override
	public String toString() {
		return "UserListDTO [userid=" + userid + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", tel=" + tel + ", point=" + point + ", category=" + category + ", out=" + out + ", stop=" + stop
				+ "]";
	}
	
	//constructors
	public UserListDTO(String userid, String password, String name, String email, String tel, int point, char category,
			char out, char stop) {
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.point = point;
		this.category = category;
		this.out = out;
		this.stop = stop;
	}
	public UserListDTO() {

	}
	
	
}
