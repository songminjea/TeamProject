package com.team.recomment.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.recomment.DAO.RecommentDAO;
import com.team.recomment.Service.RCService;
import com.team.recomment.VO.RecommentVO;

@Service("RCService")
public class RCServiceImpl implements RCService{
	
	@Autowired
	private RecommentDAO rdao;
	
	@Override
	public List<RecommentVO> serchRecomment(int GB_Num) {
	
		return rdao.serchRecomment(GB_Num);
	}
	
	@Override
	public void recommentWrite(RecommentVO revo) {
		
		rdao.recommentWrite(revo);
		
	}
}
