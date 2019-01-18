package com.team.recomment.Service;

import java.util.List;

import com.team.recomment.VO.RecommentVO;

public interface RCService {

	public List<RecommentVO> serchRecomment(int GB_Num);

	public void recommentWrite(RecommentVO revo);

	public void delRecomment(int cm_Seq);

	public void modifyRecomment(int cm_Seq);

	public int getCount(int gb_Num);

}
