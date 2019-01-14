package com.team.gallery.DAO;

import java.util.List;
import java.util.Map;

import com.team.gallery.VO.fileVO;
import com.team.gallery.VO.galleryVO;

public interface GalleryDAO {

	public void insert(galleryVO gvo);

	// gallery/list.jsp 에 출력할 정보 얻어오기
	public List<galleryVO> GetMyGalleryList(Map<String, String> galleryInfo);

	public List<galleryVO> GetSpecGalleryList(Map<String, String> galleryInfo);

	public int maxNum(galleryVO gvo);

	public void FileInsert(fileVO fvo);

	public List<galleryVO> GetImgList(int gbNum);

	public void Update(galleryVO gvo);

	public void ClearFile(int GB_Num);

	public void Delete(int gB_Num);
	
}
