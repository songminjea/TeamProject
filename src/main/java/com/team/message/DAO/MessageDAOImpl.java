package com.team.message.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.message.VO.MessageSearchVO;
import com.team.message.VO.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace = "com.team.message.Mapper.messageMapper";
	
	//쪽지 전체 목록
	@Override
	public List<MessageVO>listAll()throws Exception{
		return sqlSession.selectList(namespace+".listAll");
	}
	
	//검색한 쪽지 리스트
	@Override
	public List<MessageVO>listSearch(MessageSearchVO msvo)throws Exception{
		return sqlSession.selectList(namespace+".searchList", msvo);
	}
	
	//페이징을 위한 카운트
	@Override
	public int countSearchedArticles(MessageSearchVO msvo)throws Exception{
		return sqlSession.selectOne(namespace+".pagingCount", msvo);
	}
	
	//내가 보낸 쪽지
	@Override
	public List<MessageVO>sendListAll()throws Exception{
		return sqlSession.selectList(namespace+".listAll");
	}
	
	//안 읽은 쪽지 개수
	@Override
	public int countList(String message_id)throws Exception{
		return sqlSession.selectOne(namespace+".count", message_id);
	}
	
	//쪽지 작성
	@Override
	public void create(MessageVO mvo)throws Exception{
		sqlSession.insert(namespace+".insert", mvo);
	}
	
	//쪽지 작성시 상대 아이디 여부 체크
	public int messageIdCheck(String MESSAGE_RECEIVER)throws Exception{
		return sqlSession.selectOne(namespace+".messageIdCheck", MESSAGE_RECEIVER);
	}
	
	//쪽지 상세 내용
	@Override
	public MessageVO read(MessageVO mvo)throws Exception{
		return sqlSession.selectOne(namespace+".view", mvo);
	}
	
	//내가 보낸 쪽지 상세 내용
	@Override
	public MessageVO sendRead(MessageVO mvo)throws Exception{
		return sqlSession.selectOne(namespace+".sendView", mvo);
	}
	
	//쪽지를 읽을 시, 읽지않음이 읽은 날짜로 변경된다.
	@Override
	public void updateRead(int MESSAGE_NO)throws Exception{
		sqlSession.update(namespace+".readvaltrue", MESSAGE_NO);
	}
	
	//쪽지 삭제
	@Override
	public void delete(int MESSAGE_NO)throws Exception{
		sqlSession.delete(namespace+".deleteMessage", MESSAGE_NO);
	}
}
