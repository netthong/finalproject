package com.project.dragonball.model.banner.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dragonball.model.banner.dto.BannerDTO;

@Repository
public class BannerDAOImpl implements BannerDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void bannerUpload(BannerDTO dto) {
		sqlSession.insert("banner.bannerUpload", dto);
	}

	@Override
	public List<BannerDTO> bannerList() {
		return sqlSession.selectList("banner.bannerList");
	}

	@Override
	public BannerDTO bannerDetail(int banner_num) {
		return sqlSession.selectOne("banner.bannerDetail", banner_num);
	}

	@Override
	public void deleteBanner(int banner_num) {
		sqlSession.delete("banner.deleteBanner", banner_num);
	}

}
