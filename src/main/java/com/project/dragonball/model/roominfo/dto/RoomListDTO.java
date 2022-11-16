package com.project.dragonball.model.roominfo.dto;

public class RoomListDTO {
	private int BUILDING_CODE; //건물번호
	private int ROOM_NO; //방번호
	private String ROOM_NAME; //방이름 
	private int ROOM_AMOUNT; //갯수 
	private int ROOM_PRICE; //가격
	private String ROOM_SIZE; //인실
	
	private String PICTURE_URL; //ROOM_PHOTO의 사진 하나
	
	//getter, setter, toString
	public int getBUILDING_CODE() {
		return BUILDING_CODE;
	}
	public void setBUILDING_CODE(int bUILDING_CODE) {
		BUILDING_CODE = bUILDING_CODE;
	}
	public String getROOM_NAME() {
		return ROOM_NAME;
	}
	public void setROOM_NAME(String rOOM_NAME) {
		ROOM_NAME = rOOM_NAME;
	}
	public int getROOM_AMOUNT() {
		return ROOM_AMOUNT;
	}
	public void setROOM_AMOUNT(int rOOM_AMOUNT) {
		ROOM_AMOUNT = rOOM_AMOUNT;
	}
	public int getROOM_PRICE() {
		return ROOM_PRICE;
	}
	public void setROOM_PRICE(int rOOM_PRICE) {
		ROOM_PRICE = rOOM_PRICE;
	}
	public String getROOM_SIZE() {
		return ROOM_SIZE;
	}
	public void setROOM_SIZE(String rOOM_SIZE) {
		ROOM_SIZE = rOOM_SIZE;
	}
	
	
	public String getPICTURE_URL() {
		return PICTURE_URL;
	}
	public void setPICTURE_URL(String pICTURE_URL) {
		PICTURE_URL = pICTURE_URL;
	}
	public int getROOM_NO() {
		return ROOM_NO;
	}
	public void setROOM_NO(int rOOM_NO) {
		ROOM_NO = rOOM_NO;
	}
	public RoomListDTO() {

	}
	
	
	
	
}


	
	

