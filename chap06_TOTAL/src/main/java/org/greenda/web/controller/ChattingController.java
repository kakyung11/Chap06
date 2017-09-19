package org.greenda.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chat")
public class ChattingController {
	@Autowired
	ObjectMapper mapper;
	
	@RequestMapping("/chat")
	public ModelAndView ChattingHandle(){
		ModelAndView mav = new ModelAndView("t_chat");
		mav.addObject("section", "chat/chat");
		return mav;
	}
}
