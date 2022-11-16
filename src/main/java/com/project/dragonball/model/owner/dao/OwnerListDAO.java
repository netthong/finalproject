package com.project.dragonball.model.owner.dao;

import java.util.List;

import com.project.dragonball.model.owner.dto.OwnerListDTO;

public interface OwnerListDAO {
	public List<OwnerListDTO> listBuilding(); //목록보기
	public OwnerListDTO detailBuilding(int building_code);//상세보기
	public void updateBuilding(OwnerListDTO dto);//수정
	public void deleteBuilding(int building_code);//삭제
	public void insertBuilding(OwnerListDTO dto);//입력
	public String fileInfo1(int building_code);//첨부파일정보
	
	public OwnerListDTO roomDetailList(int building_code); //업소 상세보기 리스트

	public List<OwnerListDTO> roomInfo(String buildingName); //업소 하나의 방의 정보를 확인
	public List<OwnerListDTO> admissionBuilding();
	public void permission(int building_code);

}
