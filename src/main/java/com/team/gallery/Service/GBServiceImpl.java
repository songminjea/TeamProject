package com.team.gallery.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.gallery.DAO.GalleryDAO;
import com.team.gallery.VO.galleryVO;


@Service("GBService")
public class GBServiceImpl implements GBService {

	@Autowired
	private GalleryDAO gdao;
	
	@Override
	public void insert(galleryVO gvo) throws Exception{
		
		gdao.insert(gvo);
	
	}
}
