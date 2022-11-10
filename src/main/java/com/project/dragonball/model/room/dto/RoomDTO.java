package com.project.dragonball.model.room.dto;

import org.springframework.web.multipart.MultipartFile;

public class RoomDTO {
	private int room_no;
	private String building_name; 
	private String room_name;
	private int room_amount; 
	private int room_price; 
	private String room_size;
	private MultipartFile file1;
	private String picture_url;
	//getter, setter, toString(), 생성자
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getBuilding_name() {
		return building_name;
	}
	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getRoom_amount() {
		return room_amount;
	}
	public void setRoom_amount(int room_amount) {
		this.room_amount = room_amount;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getRoom_size() {
		return room_size;
	}
	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "RoomDTO [room_no=" + room_no + ", building_name=" + building_name + ", room_name=" + room_name
				+ ", room_amount=" + room_amount + ", room_price=" + room_price + ", room_size=" + room_size
				+ ", file1=" + file1 + "]";
	}
	public RoomDTO(int room_no, String building_name, String room_name, int room_amount, int room_price,
			String room_size, MultipartFile file1) {
		super();
		this.room_no = room_no;
		this.building_name = building_name;
		this.room_name = room_name;
		this.room_amount = room_amount;
		this.room_price = room_price;
		this.room_size = room_size;
		this.file1 = file1;
	}
	
	public RoomDTO() {
		}
	}


