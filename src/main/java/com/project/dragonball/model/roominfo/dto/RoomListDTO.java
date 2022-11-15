package com.project.dragonball.model.roominfo.dto;

public class RoomListDTO {
	private int BUILDING_CODE; //건물번호
	private String ROOM_NAME; //방이름 
	private int ROOM_AMOUNT; //갯수 
	private int ROOM_PRICE; //가격
	private String ROOM_SIZE; //인실
	
	private String PHOTO1; //ROOM_PHOTO의 사진 하나
	
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
	@Override
	public String toString() {
		return "RoomListDTO [BUILDING_CODE=" + BUILDING_CODE + ", ROOM_NAME=" + ROOM_NAME + ", ROOM_AMOUNT="
				+ ROOM_AMOUNT + ", ROOM_PRICE=" + ROOM_PRICE + ", ROOM_SIZE=" + ROOM_SIZE + "]";
	}
	public String getPHOTO1() {
		return PHOTO1;
	}
	public void setPHOTO1(String pHOTO1) {
		PHOTO1 = pHOTO1;
	}
}
