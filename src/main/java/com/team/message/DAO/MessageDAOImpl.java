package com.team.message.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.message.BVO.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.team.message.Mapper.messageMapper";
	
	@Override
	public void insertMessage(MessageVO mevo) throws Exception{
		sqlSession.insert(namespace + ".insertMessage", mevo);
	}
	
	@Override
	public List<MessageVO> getMessageList(String str) throws Exception{
		return sqlSession.selectList(namespace+".selectMessageList", str);
	}
}
