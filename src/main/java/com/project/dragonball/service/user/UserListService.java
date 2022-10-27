package com.project.dragonball.service.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.dragonball.model.user.dto.UserListDTO;

public interface UserListService {
	public boolean loginCheck(UserListDTO dto, HttpSession session);
	public UserListDTO viewUser(String userid);
	public List<UserListDTO> list();
	public void writeUser(UserListDTO dto);
	public boolean checkPw(String userid, String passwd);
	public void updateUser(UserListDTO dto);
	public void deleteUser(String userid);
	public void logout(HttpSession session);
}
