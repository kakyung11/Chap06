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
			map.put("name", "������");
			map.put("gender", "��");
		return mapper.writeValueAsString(map);

	}
	
	@RequestMapping(path="/dst03")
	@ResponseBody
	public Map jqueryDst03() throws JsonProcessingException{
		// ResponseBody�� ��ü�� ��ȯ�ٸ�, ObjectMapper�� �ټ� �ڵ���ȯ�� ���ڿ��� ���۵�
		// ���� �������� applilcation/json;charset=utf-8�� ������ 
		Map map = new HashMap<>();
			map.put("name", "������");
			map.put("gender", "��");
		return map;

	}
}
