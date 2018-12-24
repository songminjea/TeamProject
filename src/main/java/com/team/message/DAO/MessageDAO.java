package com.team.message.DAO;

import java.util.List;

import com.team.message.VO.MessageVO;

public interface MessageDAO {
	//쪽지 작성
	public void create(MessageVO mvo) throws Exception;
	//쪽지 내용 상세 보기
	public MessageVO read(int MESSAGE_NO) throws Exception;
	//쪽지 삭제
	public void delete(int MESSAGE_NO) throws Exception;
	//쪽지 전체 목록
	public List<MessageVO> listAll(String re_id) throws Exception;
	//쪽지 레코드 개수
	public int countArticle(String re_id) throws Exception;
}
