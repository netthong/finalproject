package com.project.dragonball.model.receipt.dto;

import java.util.Date;

public class ReceiptDTO {
	private int receipt_no;
	private String userid;
	private int building_code;
	private String building_name;
	private int room_no;
	private String room_name;
	private String date_start;
	private String date_end;
	private int price;
	private char reply;
	private String picture_url;
	//getter setter
	public int getReceipt_no() {
		return receipt_no;
	}
	public void setReceipt_no(int receipt_no) {
		this.receipt_no = receipt_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
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
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public char getReply() {
		return reply;
	}
	public void setReply(char reply) {
		this.reply = reply;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	
	public ReceiptDTO(int receipt_no, String userid, int building_code, String building_name, int room_no,
			String room_name, String date_start, String date_end, int price, char reply, String picture_url) {
		super();
		this.receipt_no = receipt_no;
		this.userid = userid;
		this.building_code = building_code;
		this.building_name = building_name;
		this.room_no = room_no;
		this.room_name = room_name;
		this.date_start = date_start;
		this.date_end = date_end;
		this.price = price;
		this.reply = reply;
		this.picture_url = picture_url;
	}
	public ReceiptDTO() {

	}
	
	
	
	
	
	
	
	
}
