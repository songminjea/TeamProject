package com.team.chat.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.chat.VO.ChatSearchVO;
import com.team.chat.VO.ChatVO;
import com.team.member.VO.MemberVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace = "com.team.chat.Mapper.chatMapper";
	
	//채팅 아이디 검색 목록
	public List<MemberVO>listAll(Map<String, String> searchInfo){
		return sqlSession.selectList(namespace+".listAll", searchInfo);
	}
	
	public void sendMessage(ChatVO cvo) throws Exception{
		sqlSession.insert(namespace+".insert", cvo);
	}
	
	public ChatVO sendRead(ChatVO cvo)throws Exception{
		return sqlSession.selectOne(namespace+".read", cvo);
	}
}
