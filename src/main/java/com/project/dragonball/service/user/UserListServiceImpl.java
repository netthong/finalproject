package com.project.dragonball.service.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.user.dao.UserListDAO;
import com.project.dragonball.model.user.dto.UserListDTO;

@Service
public class UserListServiceImpl implements UserListService {

	@Inject
	UserListDAO userListdao;
	
	@Override
	public boolean loginCheck(UserListDTO dto, HttpSession session) {
		boolean result = userListdao.loginCheck(dto);
		if(result) {
			UserListDTO dto2 = viewUser(dto.getUserid());
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto2.getName());
		}
		return result;
	}

	@Override
	public UserListDTO viewUser(String userid) {
		return userListdao.viewUser(userid);
	}

	@Override
	public List<UserListDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeUser(UserListDTO dto) {
		userListdao.writeUser(dto);
	}

	@Override
	public boolean checkPw(String userid, String password) {
		return userListdao.checkPw(userid, password);
	}

	

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void updateUser(UserListDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String userid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idCheck(String userid) {
		return userListdao.idCheck(userid);
	}

	@Override
	public String findId(String name, String email) {
		return userListdao.findId(name,email);
	}

	@Override
	public String findPw(String userid, String email) {
		return userListdao.findPw(userid,email);
	}

	@Override
	public void updatePass(String userid, String pw) {
		userListdao.updatePass(userid, pw);
	}

	@Override
	public void updateName(String userid, String name) {
		userListdao.updateName(userid, name);
	}

	@Override
	public void updateTel(String userid, String tel) {
		userListdao.updateTel(userid, tel);
	}

	@Override
	public void updateEmail(String userid, String email) {
		userListdao.updateEmail(userid,email);
	}

}
