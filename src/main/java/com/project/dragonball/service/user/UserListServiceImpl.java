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
	public boolean checkPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		return false;
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

}
