package com.project.dragonball.service.user;

import java.util.List;

import com.project.dragonball.model.user.dto.UserListDTO;

public interface AdminService {

	public List<UserListDTO> userList(String search_option, String keyword);

	public void userStop(String userid, char stop);

}
