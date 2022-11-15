package com.project.dragonball.model.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.user.dto.UserListDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;


	@Override
	public List<UserListDTO> userList(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();	
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectList("user.userList", map);
	}

	@Override
	public void userStop(String userid, char stop) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("stop", stop);
		sqlSession.update("user.userStop", map);
	}
	
	
}
