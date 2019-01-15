package com.team.chat.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.chat.VO.ChatVO;
import com.team.chat.VO.ChatroomVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace = "com.team.chat.Mapper.chatMapper";
	
	//채팅 리스트
	public List<ChatroomVO>listAll(String my_id){
		return sqlSession.selectList(namespace+".listAll", my_id);
	}
	
	//채팅방 생성
	@Override
	public void create(ChatroomVO cvo)throws Exception{
		sqlSession.insert(namespace+".insert", cvo);
	}
		
	//채팅 내용
	@Override
	public ChatVO read(ChatroomVO cvo)throws Exception{
		return sqlSession.selectOne(namespace+".view", cvo);
	}
	
	//이미 있는 채팅방 입장
	@Override
	public ChatroomVO areadyRead(ChatroomVO cvo2)throws Exception{
		return sqlSession.selectOne(namespace+".aready", cvo2);
	}
}
