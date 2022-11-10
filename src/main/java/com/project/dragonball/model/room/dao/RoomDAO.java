package com.project.dragonball.model.room.dao;

import java.util.List;

import com.project.dragonball.model.room.dto.RoomDTO;



public interface RoomDAO {
	public List<RoomDTO> listRoom(String building_name); //목록보기
	public RoomDTO detailRoom(int room_no); //상세보기
	public void updateRoom(RoomDTO dto); //수정
	public void deleteRoom(int room_no); //삭제
	public void insertRoom(RoomDTO dto); //입력
	public String fileInfo(int room_no); //첨부파일정보

}
