package com.project.dragonball.model.roomreview.dto;

import java.util.Date;

public class RoomReviewDTO {
	private int REPLYNO; //리뷰번호
	private String userid; //아이디
	private Date REG_DATE_REVIEW; //등록일 
	private int COMMENTNO; //답글번호 
	private int POINT; //평점
	private String CONTENT; //리뷰내용
	private String ROOM_NAME; //방이름
	private int BUILDING_CODE; //건물번호
	private char SHOW; //삭제여부 
	
	private int RANK; //업로드 순위
	
	//getter, setter, toString
	public int getREPLYNO() {
		return REPLYNO;
	}
	public void setREPLYNO(int rEPLYNO) {
		REPLYNO = rEPLYNO;
	}
	public String getID() {
		return userid;
	}
	public void setID(String iD) {
		userid = iD;
	}
	public Date getREG_DATE_REVIEW() {
		return REG_DATE_REVIEW;
	}
	public void setREG_DATE_REVIEW(Date rEG_DATE_REVIEW) {
		REG_DATE_REVIEW = rEG_DATE_REVIEW;
	}
	public int getCOMMENTNO() {
		return COMMENTNO;
	}
	public void setCOMMENTNO(int cOMMENTNO) {
		COMMENTNO = cOMMENTNO;
	}
	public int getPOINT() {
		return POINT;
	}
	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getROOM_NAME() {
		return ROOM_NAME;
	}
	public void setROOM_NAME(String rOOM_NAME) {
		ROOM_NAME = rOOM_NAME;
	}
	public int getBUILDING_CODE() {
		return BUILDING_CODE;
	}
	public void setBUILDING_CODE(int bUILDING_CODE) {
		BUILDING_CODE = bUILDING_CODE;
	}
	public char getSHOW() {
		return SHOW;
	}
	public void setSHOW(char sHOW) {
		SHOW = sHOW;
	}
	@Override
	public String toString() {
		return "RoomReviewDTO [REPLYNO=" + REPLYNO + ", ID=" + userid + ", REG_DATE_REVIEW=" + REG_DATE_REVIEW
				+ ", COMMENTNO=" + COMMENTNO + ", POINT=" + POINT + ", CONTENT=" + CONTENT + ", ROOM_NAME=" + ROOM_NAME
				+ ", BUILDING_CODE=" + BUILDING_CODE + ", SHOW=" + SHOW + "]";
	}
	public int getRANK() {
		return RANK;
	}
	public void setRANK(int rANK) {
		RANK = rANK;
	}
}