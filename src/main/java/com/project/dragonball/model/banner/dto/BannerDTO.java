package com.project.dragonball.model.banner.dto;

import org.springframework.web.multipart.MultipartFile;

public class BannerDTO {
	private int banner_num; //번호
	private String event_mainphoto;//사진 주소
	private MultipartFile file1;
	//getter setter
	public int getBanner_num() {
		return banner_num;
	}

	public void setBanner_num(int banner_num) {
		this.banner_num = banner_num;
	}

	public String getEvent_mainphoto() {
		return event_mainphoto;
	}

	public void setEvent_mainphoto(String event_mainphoto) {
		this.event_mainphoto = event_mainphoto;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	//constructor
	public BannerDTO() {
	}

	public BannerDTO(int banner_num, String event_mainphoto, MultipartFile file1) {
		super();
		this.banner_num = banner_num;
		this.event_mainphoto = event_mainphoto;
		this.file1 = file1;
	}
	
}
