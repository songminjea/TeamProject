package com.team.gallery.DAO;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.gallery.VO.galleryVO;

@Repository
public class GalleryDAOImpl implements GalleryDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insert(galleryVO gvo) {
		// TODO Auto-generated method stub
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		gvo.setGb_Date(ts);
	
		sqlSession.insert("GalleryInsert", gvo);
	}
	
}
