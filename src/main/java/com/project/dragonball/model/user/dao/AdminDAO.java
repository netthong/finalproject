package com.project.dragonball.model.user.dao;

import java.util.List;

import com.project.dragonball.model.user.dto.UserListDTO;

public interface AdminDAO {

	public List<UserListDTO> userList(String search_option, String keyword);

	public void userStop(String userid, char stop);

}
