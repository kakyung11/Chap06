package org.greenda.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/jquery")
public class JQueryAjaxController {

	@RequestMapping("/src01")
	public ModelAndView jquerySrc01(){
		ModelAndView mav = new ModelAndView("t_jquery");
		mav.addObject("section", "jquery/src01");
		return mav;
	}
	
	@RequestMapping("/dst01")
	@ResponseBody
	public String jqueryDst01(@RequestParam Map param){
		System.out.println("jquery Dst01 exec");
		System.out.println(param);
		return "YYYYY";
	}
	@Autowired
	ObjectMapper mapper;
	
	@RequestMapping(path="/dst02", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String jqueryDst02() throws JsonProcessingException{
		Map map = new HashMap<>();
			map.put("name", "진가경");
			map.put("gender", "여");
		return mapper.writeValueAsString(map);

	}
	
	@RequestMapping(path="/dst03")
	@ResponseBody
	public Map jqueryDst03() throws JsonProcessingException{
		// ResponseBody로 객체를 반환바면, ObjectMapper에 읳서 자동변환된 문자열이 전송됨
		// 응답 컨텐츠가 applilcation/json;charset=utf-8로 설정됨 
		Map map = new HashMap<>();
			map.put("name", "진가경");
			map.put("gender", "여");
		return map;

	}
}
