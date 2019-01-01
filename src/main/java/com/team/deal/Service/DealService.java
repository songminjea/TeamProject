package com.team.deal.Service;

import java.util.List;

import com.team.deal.DTO.DealDTO;

public interface DealService {

	// 게시물 목록 조회
	public List<DealDTO> dealList() throws Exception;

	// 게시물 작성
	public void writerDeal(DealDTO ddto) throws Exception;

	// 게시물 상세 내용 조회
	public DealDTO dealRead(int DEAL_NUM)throws Exception;
	
	// 게시물 수정하기
	public void updateDeal(DealDTO ddto) throws Exception;
	
	//게시물 삭제
	public void deleteDeal(int DEAL_NUM)throws Exception;
}


