package com.team.gallery.Service;

import java.util.List;

import com.team.gallery.VO.galleryVO;
import com.team.member.VO.MemberVO;


public interface GBService {
	public void insert(galleryVO gvo) throws Exception;

	
	// 내가 쓴 글만 불러오기
	public List<galleryVO> GetMyGalleryList(String my_id);

	// 대상 id가 쓴글 불러오기.
	public List<galleryVO> GetSpecGalleryList(String id);
}
