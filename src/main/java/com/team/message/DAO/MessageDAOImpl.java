package com.team.message.DAO;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team.message.VO.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.team.message.Mapper.messageMapper";
	//쪽지 작성
	@Override
	public void create(MessageVO mvo) throws Exception{
		sqlSession.insert(namespace + ".insert", mvo);
	}
	//쪽지 내용 상세 보기
	@Override
	public MessageVO read(int MESSAGE_NO) throws Exception{
		return sqlSession.selectOne(namespace+".view", MESSAGE_NO);
	}
	//쪽지 삭제
	@Override
	public void delete(int MESSAGE_NO) throws Exception{
		sqlSession.delete(namespace+".delete", MESSAGE_NO);
	}
	//쪽지 전체 목록
	@Override
	public List<MessageVO> listAll() throws Exception{
		return sqlSession.selectList(namespace+".listAll");
	}
}
