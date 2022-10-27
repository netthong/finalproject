package com.project.dragonball.model.user.dao;

import java.util.List;


import com.project.dragonball.model.user.dto.UserListDTO;

public interface UserListDAO {
	public boolean loginCheck(UserListDTO dto);
	public UserListDTO viewUser(String userid);
	public List<UserListDTO> list();
	public void writeUser(UserListDTO dto);
	public boolean checkPw(String userid, String passwd);
	public void updateUser(UserListDTO dto);
	public void deleteUser(String userid);
}
