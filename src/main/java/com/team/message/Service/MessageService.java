package com.team.message.Service;

import java.util.List;

import com.team.message.VO.MessageVO;

public interface MessageService {
	public void create(MessageVO mvo) throws Exception;
	public MessageVO read(int MESSAGE_NO) throws Exception;
	public void delete(int MESSAGE_NO) throws Exception;
	public List<MessageVO>listAll(String re_id) throws Exception;
	public int countArticle(String re_id) throws Exception;
}
