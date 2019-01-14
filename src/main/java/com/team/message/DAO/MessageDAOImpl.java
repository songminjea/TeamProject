package com.team.message.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.message.VO.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace = "com.team.message.Mapper.messageMapper";
	
	//쪽지 전체 목록
	@Override
	public List<MessageVO>listAll(int start, int end, String searchOption, String keyword, String MESSAGE_RECEIVER)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("MESSAGE_RECEIVER", MESSAGE_RECEIVER);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(namespace+".listAll", map);
	}

	//페이징을 위한 카운트
	@Override
	public int countArticles(String searchOption, String keyword)throws Exception{
		Map<String, String> map = new HashMap<String, String>(); 
	 	map.put("searchOption", searchOption); 
		map.put("keyword", keyword); 
		return sqlSession.selectOne(namespace+".pagingCount", map);
	}
	
	//내가 보낸 쪽지
	@Override
	public List<MessageVO>sendListAll(int start, int end, String searchOption, String keyword, String MESSAGE_SENDER)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("MESSAGE_RECEIVER", MESSAGE_SENDER);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(namespace+".sendListAll", map);
	}
	
	//페이징을 위한 카운트
	@Override
	public int sendCountArticles(String searchOption, String keyword)throws Exception{
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("searchOption", searchOption); 
		map.put("keyword", keyword); 
		return sqlSession.selectOne(namespace+".pagingSendCount", map);
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
