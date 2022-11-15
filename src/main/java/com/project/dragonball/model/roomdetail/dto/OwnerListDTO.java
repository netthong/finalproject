package com.project.dragonball.model.roomdetail.dto;

public class OwnerListDTO {
	private int BUILDING_CODE; //건물번호
	private String BUILDING_NAME; //건물명
	private String BUILDING_TYPE; //
	private String ADDRESS1; //업소 주소
	private String ADDRESS2; //상세 주소
	private String ZIPCODE; //ZIP코드
	private String BUILDING_LONGITUDE; //주소 경도
	private String BUILDING_LATITUDE; //주소 위도
	private char PERMISSION; //등록 여부
	private String OWNER_COMMENT; //사장님 한마디
	private String ACCOMODATION; //편의기능
	private String USERID; //사장님ID
	private String picture_url; //사진
	
	//getter, setter, toString
	public int getBUILDING_CODE() {
		return BUILDING_CODE;
	}
	public void setBUILDING_CODE(int bUILDING_CODE) {
		BUILDING_CODE = bUILDING_CODE;
	}
	public String getBUILDING_NAME() {
		return BUILDING_NAME;
	}
	public void setBUILDING_NAME(String bUILDING_NAME) {
		BUILDING_NAME = bUILDING_NAME;
	}
	public String getBUILDING_TYPE() {
		return BUILDING_TYPE;
	}
	public void setBUILDING_TYPE(String bUILDING_TYPE) {
		BUILDING_TYPE = bUILDING_TYPE;
	}
	public String getADDRESS1() {
		return ADDRESS1;
	}
	public void setADDRESS1(String aDDRESS1) {
		ADDRESS1 = aDDRESS1;
	}
	public String getADDRESS2() {
		return ADDRESS2;
	}
	public void setADDRESS2(String aDDRESS2) {
		ADDRESS2 = aDDRESS2;
	}
	public String getZIPCODE() {
		return ZIPCODE;
	}
	public void setZIPCODE(String zIPCODE) {
		ZIPCODE = zIPCODE;
	}
	public String getBUILDING_LONGITUDE() {
		return BUILDING_LONGITUDE;
	}
	public void setBUILDING_LONGITUDE(String bUILDING_LONGITUDE) {
		BUILDING_LONGITUDE = bUILDING_LONGITUDE;
	}
	public String getBUILDING_LATITUDE() {
		return BUILDING_LATITUDE;
	}
	public void setBUILDING_LATITUDE(String bUILDING_LATITUDE) {
		BUILDING_LATITUDE = bUILDING_LATITUDE;
	}
	public char getPERMISSION() {
		return PERMISSION;
	}
	public void setPERMISSION(char pERMISSION) {
		PERMISSION = pERMISSION;
	}
	public String getOWNER_COMMENT() {
		return OWNER_COMMENT;
	}
	public void setOWNER_COMMENT(String oWNER_COMMENT) {
		OWNER_COMMENT = oWNER_COMMENT;
	}
	public String getACCOMODATION() {
		return ACCOMODATION;
	}
	public void setACCOMODATION(String aCCOMODATION) {
		ACCOMODATION = aCCOMODATION;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	@Override
	public String toString() {
		return "OwnerListDTO [BUILDING_CODE=" + BUILDING_CODE + ", BUILDING_NAME=" + BUILDING_NAME + ", BUILDING_TYPE="
				+ BUILDING_TYPE + ", ADDRESS1=" + ADDRESS1 + ", ADDRESS2=" + ADDRESS2 + ", ZIPCODE=" + ZIPCODE
				+ ", BUILDING_LONGITUDE=" + BUILDING_LONGITUDE + ", BUILDING_LATITUDE=" + BUILDING_LATITUDE
				+ ", PERMISSION=" + PERMISSION + ", OWNER_COMMENT=" + OWNER_COMMENT + ", ACCOMODATION=" + ACCOMODATION
				+ ", USERID=" + USERID + ", picture_url=" + picture_url + "]";
	}
	
}