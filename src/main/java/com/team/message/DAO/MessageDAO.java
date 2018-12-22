package com.team.message.DAO;

import java.util.List;

import com.team.message.BVO.MessageVO;

public interface MessageDAO {
	public void insertMessage(MessageVO mevo) throws Exception;
	public List<MessageVO> getMessageList(String str) throws Exception;
}
