package com.project.dragonball.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.user.dao.AdminDAO;
import com.project.dragonball.model.user.dto.UserListDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDao;

	@Override
	public List<UserListDTO> userList(String search_option, String keyword) {
		return adminDao.userList(search_option,keyword);
	}

	@Override
	public void userStop(String userid, char stop) {
		adminDao.userStop(userid, stop);
	}
}
