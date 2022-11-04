package com.project.dragonball.model.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.user.dto.UserListDTO;

@Repository
public class UserListDAOImpl implements UserListDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(UserListDTO dto) {
		String name = sqlSession.selectOne("user.login_check", dto);
		//조건식 삼항 연산자로 리턴가능
		return (name==null) ? false : true;
	}

	@Override
	public UserListDTO viewUser(String userid) {
		return sqlSession.selectOne("user.viewUser", userid);
	}

	@Override
	public List<UserListDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeUser(UserListDTO dto) {
		sqlSession.insert("user.writeUser", dto);
	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		return false;
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
		return sqlSession.selectOne("user.idCheck", userid);
	}

	@Override
	public String findId(String name, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne("user.findId", map);
	}

	@Override
	public String findPw(String userid, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("email", email);
		return sqlSession.selectOne("user.findPw", map);
	}

	@Override
	public void updatePass(String userid, String pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("password", pw);
		sqlSession.update("user.updatePass", map);
	}

	

	

}
