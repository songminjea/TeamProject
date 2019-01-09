package com.team.gallery.DAO;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.gallery.VO.fileVO;
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
	
	@Override
	public int maxNum(galleryVO gvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("maxNum",gvo);
	}

	@Override
	public List<galleryVO> GetMyGalleryList(Map<String, String> galleryInfo) {
		
		return sqlSession.selectList("GetMyGalleryList", galleryInfo);
	}

	@Override
	public List<galleryVO> GetSpecGalleryList(Map<String, String> galleryInfo) {
		return sqlSession.selectList("GetSpecGalleryList", galleryInfo);
	}

	@Override
	public void FileInsert(fileVO fvo) {
		// TODO Auto-generated method stub
		String[] Image = fvo.getGb_Image();
		int Num = fvo.getGb_Num();
		
		//System.out.println(Image);
		
		Map<String, Object> paramMap = new HashMap<>();
		for(String s : Image) {
			paramMap.put("Image", s);
			paramMap.put("Num",Num);
			sqlSession.insert("fileInsert",paramMap);
		}
		
	}

	@Override
	public List<galleryVO> GetImgList(int GB_Num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectImgList", GB_Num);
	}
	
	
	
	
	
	
	
}
