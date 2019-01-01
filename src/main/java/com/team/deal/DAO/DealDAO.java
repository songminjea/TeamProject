package com.team.deal.DAO;

import java.util.List;

import com.team.deal.DTO.DealDTO;

public interface DealDAO {
	//게시물 목록보기
	public List<DealDTO> dealList() throws Exception;

	//게시물 작성
	public void writerDeal(DealDTO ddto)throws Exception;
	// 게시물 상세 내용 조회
	public DealDTO dealRead(int DEAL_NUM)throws Exception;
	
	// 게시물 수정하기
		public void dealUpdate(DealDTO ddto) throws Exception;
		
		//삭제
		public void dealDelete(int DEAL_NUM) throws Exception;
}
