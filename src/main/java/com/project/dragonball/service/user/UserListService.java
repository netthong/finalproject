package com.project.dragonball.service.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.dragonball.model.receipt.dto.ReceiptDTO;
import com.project.dragonball.model.user.dto.UserListDTO;

public interface UserListService {
	public boolean loginCheck(UserListDTO dto, HttpSession session);
	public UserListDTO viewUser(String userid);
	public List<UserListDTO> list();
	public void writeUser(UserListDTO dto);
	public boolean checkPw(String userid, String password);
	public void updateUser(UserListDTO dto);
	public void deleteUser(String userid);
	public void logout(HttpSession session);
	public int idCheck(String userid);
	public String findId(String name, String email);
	public String findPw(String userid, String email);
	public void updatePass(String userid, String pw);
	public void updateName(String userid, String name);
	public void updateTel(String userid, String tel);
	public void updateEmail(String userid, String email);
	public List<ReceiptDTO> reservationList(String userid);
}
