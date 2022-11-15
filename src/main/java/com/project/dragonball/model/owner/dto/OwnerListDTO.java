package com.project.dragonball.model.owner.dto;

import org.springframework.web.multipart.MultipartFile;

public class OwnerListDTO {
	private int building_code;
	private String building_name;
	private String building_type;
	private String address1;
	private String address2;
	private String zipcode;
	private String bulding_longitude;
	private String bulding_latitude;
	private char permission;
	private String owner_comment;
	private String accomodation;
	private String userid;
	private String photo;
	private String picture_url;
	private MultipartFile file1;
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	//getter, setter, toString(), 생성자
	public int getBuilding_code() {
		return building_code;
	}
	public void setBuilding_code(int building_code) {
		this.building_code = building_code;
	}
	public String getBuilding_name() {
		return building_name;
	}
	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}
	public String getBuilding_type() {
		return building_type;
	}
	public void setBuilding_type(String building_type) {
		this.building_type = building_type;
	}

	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getBulding_longitude() {
		return bulding_longitude;
	}
	public void setBulding_longitude(String bulding_longitude) {
		this.bulding_longitude = bulding_longitude;
	}
	public String getBulding_latitude() {
		return bulding_latitude;
	}
	public void setBulding_latitude(String bulding_latitude) {
		this.bulding_latitude = bulding_latitude;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public char getPermission() {
		return permission;
	}
	public void setPermission(char permission) {
		this.permission = permission;
	}
	public String getOwner_comment() {
		return owner_comment;
	}
	public void setOwner_comment(String owner_comment) {
		this.owner_comment = owner_comment;
	}
	public String getAccomodation() {
		return accomodation;
	}
	public void setAccomodation(String accomodation) {
		this.accomodation = accomodation;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	public OwnerListDTO(int building_code, String building_name, String building_type, String address1, String address2,
			String zipcode, String bulding_longitude, String bulding_latitude, char permission, String owner_comment,
			String accomodation, String userid, String photo, String picture_url, MultipartFile file1) {
		super();
		this.building_code = building_code;
		this.building_name = building_name;
		this.building_type = building_type;
		this.address1 = address1;
		this.address2 = address2;
		this.zipcode = zipcode;
		this.bulding_longitude = bulding_longitude;
		this.bulding_latitude = bulding_latitude;
		this.permission = permission;
		this.owner_comment = owner_comment;
		this.accomodation = accomodation;
		this.userid = userid;
		this.photo = photo;
		this.picture_url = picture_url;
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "OwnerListDTO [building_code=" + building_code + ", building_name=" + building_name + ", building_type="
				+ building_type + ", address1=" + address1 + ", address2=" + address2 + ", zipcode=" + zipcode
				+ ", bulding_longitude=" + bulding_longitude + ", bulding_latitude=" + bulding_latitude
				+ ", permission=" + permission + ", owner_comment=" + owner_comment + ", accomodation=" + accomodation
				+ ", userid=" + userid + ", photo=" + photo + ", picture_url=" + picture_url + ", file1=" + file1 + "]";
	}
	public OwnerListDTO() {

	}
	
	
	
	
	

	
	
	

}
