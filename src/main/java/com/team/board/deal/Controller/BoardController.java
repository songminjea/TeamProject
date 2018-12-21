package com.team.board.deal.Controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.team.board.deal.VO.DealVO;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/deal", method = RequestMethod.GET)
	public void deal(DealVO boardVO, Model model) throws Exception {
		logger.info("deal board............");
		
	}

}
