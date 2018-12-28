package com.team.message.Service;

import java.util.List;

import com.team.message.VO.MessageVO;

public interface MessageService {
	
	//쪽지 전체 목록
	public List<MessageVO>listAll()throws Exception;
	
	//쪽지 작성
	public void create(MessageVO mvo)throws Exception;
	
	//쪽지 상세 내용 
	public MessageVO read(MessageVO mvo)throws Exception;
	
	//쪽지 삭제
	public void delete(int MESSAGE_NO)throws Exception;
}
