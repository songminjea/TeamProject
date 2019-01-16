package com.team.recomment.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.recomment.VO.RecommentVO;

@Repository
public class RecommentDAOImpl implements RecommentDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<RecommentVO> serchRecomment(int GB_Num) {
		
		System.out.println(GB_Num);
		
		return sqlSession.selectList("GetRecommentList", GB_Num);
	}
	
}
