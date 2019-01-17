package com.team.gallery.Service;

import java.util.List;
import java.util.Map;

import com.team.gallery.VO.fileVO;
import com.team.gallery.VO.galleryVO;


public interface GBService {
	public void insert(galleryVO gvo) throws Exception;

	// 최대 글 넘버 가져오기
	public int maxNum(galleryVO gvo);
	
	// 내가 쓴 글만 불러오기
	public List<galleryVO> GetMyGalleryList(Map<String, String> galleryInfo);

	// 대상 id가 쓴글 불러오기.
	public List<galleryVO> GetSpecGalleryList(Map<String, String> galleryInfo);
	
	// 파일 입력
	public void FileInsert(fileVO fvo)throws Exception;
	
	// 이미지 리스트 불러오기
	public List<galleryVO> GetImgList(int gbNum) throws Exception;

	public void Update(galleryVO gvo);

	public void FileUpdate(fileVO fvo);

	public void Delete(int gB_Num);
}
