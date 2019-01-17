package com.team.recomment.DAO;

import java.util.List;

import com.team.recomment.VO.RecommentVO;

public interface RecommentDAO {

	List<RecommentVO> serchRecomment(int GB_Num);

	void recommentWrite(RecommentVO revo);

	void delRecomment(int cm_Seq);

	void modifyRecomment(int cm_Seq);


	

}
