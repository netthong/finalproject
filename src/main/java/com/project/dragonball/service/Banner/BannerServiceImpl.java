package com.project.dragonball.service.Banner;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dragonball.model.banner.dao.BannerDAO;
import com.project.dragonball.model.banner.dto.BannerDTO;

@Service
public class BannerServiceImpl implements BannerService {

	@Inject
	BannerDAO bannerdao;
	
	@Override
	public void bannerUpload(BannerDTO dto) {
		bannerdao.bannerUpload(dto);
	}

	@Override
	public List<BannerDTO> bannerList() {
		return bannerdao.bannerList();
	}

	@Override
	public BannerDTO bannerDetail(int banner_num) {
		return bannerdao.bannerDetail(banner_num);
	}

	@Override
	public void deleteBanner(int banner_num) {
		bannerdao.deleteBanner(banner_num);
	}

}
