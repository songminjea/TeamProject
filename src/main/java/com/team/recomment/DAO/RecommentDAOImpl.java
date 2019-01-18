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
	
	@Override
	public void recommentWrite(RecommentVO revo) {
		
		sqlSession.insert("RecommentInsert", revo);
	}
	
	@Override
	public void delRecomment(int cm_Seq) {
		
		System.out.println(cm_Seq);
			
		sqlSession.delete("delRecomment",cm_Seq);
	}
	
	@Override
	public void modifyRecomment(int cm_Seq) {
		
		sqlSession.update("modifyRecomment",cm_Seq);
		
	}
	
	@Override
	public int getCount(int gb_Num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecommentCnt",gb_Num);
	}
	
}
