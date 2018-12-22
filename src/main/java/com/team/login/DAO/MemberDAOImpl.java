package com.team.login.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.login.DTO.LoginDTO;
import com.team.login.DTO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.team.login.Mapper.loginMapper";
	@Override
	public MemberVO login(LoginDTO ldto) throws Exception {
		return sqlSession.selectOne(namespace + ".loginOk", ldto);
	}
}
