package com.team.recomment.Service;

import java.util.List;

import com.team.recomment.VO.RecommentVO;

public interface RCService {

	public List<RecommentVO> serchRecomment(int GB_Num);

	public void recommentWrite(RecommentVO revo);

}
