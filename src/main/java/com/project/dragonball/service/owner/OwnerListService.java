package com.project.dragonball.service.owner;

import java.util.List;

import com.project.dragonball.model.owner.dto.OwnerListDTO;

public interface OwnerListService {
	public List<OwnerListDTO> listBuilding(); //목록보기
	public OwnerListDTO detailBuilding(int building_code);
	public void updateBuilding(OwnerListDTO dto);//수정
	public void deleteBuilding(int building_code);//삭제
	public void insertBuilding(OwnerListDTO dto);//입력
	public String fileInfo1(int building_code);//첨부파일정보
	/* public void insertRoom(OwnerListDTO dto); */
	public List<OwnerListDTO> admissionBuilding();//건물승인
	public void permission(int building_code);

}
