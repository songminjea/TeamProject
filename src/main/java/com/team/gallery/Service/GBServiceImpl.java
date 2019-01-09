package com.team.gallery.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.gallery.DAO.GalleryDAO;
import com.team.gallery.VO.fileVO;
import com.team.gallery.VO.galleryVO;



@Service("GBService")
public class GBServiceImpl implements GBService {

	@Autowired
	private GalleryDAO gdao;
	
	@Override
	public void insert(galleryVO gvo) throws Exception{
		
		gdao.insert(gvo);
	
	}
	
	@Override
	public int maxNum(galleryVO gvo) {
		// TODO Auto-generated method stub
		return gdao.maxNum(gvo);
	}

	@Override
	public List<galleryVO> GetMyGalleryList(Map<String, String> galleryInfo) {
		
		return gdao.GetMyGalleryList(galleryInfo);
	}

	@Override
	public List<galleryVO> GetSpecGalleryList(Map<String, String> galleryInfo) {
		return gdao.GetSpecGalleryList(galleryInfo);
	}

	@Override
	public void FileInsert(fileVO fvo) throws Exception {
		// TODO Auto-generated method stub
		gdao.FileInsert(fvo);
	}

	@Override
	public List<galleryVO> GetImgList(int gbNum) throws Exception {
		// TODO Auto-generated method stub
		return gdao.GetImgList(gbNum);
	}
	
	
	
	
	
}
