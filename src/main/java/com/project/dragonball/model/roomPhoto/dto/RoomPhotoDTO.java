package com.project.dragonball.model.roomPhoto.dto;

public class RoomPhotoDTO {
	private int BUILDING_CODE;
	private String ROOM_NAME;
	private String PHOTO1;
	private String PHOTO2;
	private String PHOTO3;
	private String PHOTO4;
	private String PHOTO5;
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
	public String getPHOTO1() {
		return PHOTO1;
	}
	public void setPHOTO1(String pHOTO1) {
		PHOTO1 = pHOTO1;
	}
	public String getPHOTO2() {
		return PHOTO2;
	}
	public void setPHOTO2(String pHOTO2) {
		PHOTO2 = pHOTO2;
	}
	public String getPHOTO3() {
		return PHOTO3;
	}
	public void setPHOTO3(String pHOTO3) {
		PHOTO3 = pHOTO3;
	}
	public String getPHOTO4() {
		return PHOTO4;
	}
	public void setPHOTO4(String pHOTO4) {
		PHOTO4 = pHOTO4;
	}
	public String getPHOTO5() {
		return PHOTO5;
	}
	public void setPHOTO5(String pHOTO5) {
		PHOTO5 = pHOTO5;
	}
	@Override
	public String toString() {
		return "RoomPhotoDTO [BUILDING_CODE=" + BUILDING_CODE + ", ROOM_NAME=" + ROOM_NAME + ", PHOTO1=" + PHOTO1
				+ ", PHOTO2=" + PHOTO2 + ", PHOTO3=" + PHOTO3 + ", PHOTO4=" + PHOTO4 + ", PHOTO5=" + PHOTO5 + "]";
	}
	public RoomPhotoDTO() {
		
	}
	
}
