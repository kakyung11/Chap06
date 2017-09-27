package org.greenda.web.controller;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.greenda.web.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chart")
public class ChartController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	ObjectMapper mapper;

	@RequestMapping("/01")
	public ModelAndView chart01Handle(){
		ModelAndView mav = new ModelAndView("t_chart");
		List<Map> list = memberDao.countByGender();
		//System.out.println(list);
		mav.addObject("list", list);
		mav.addObject("section", "chart/01");
		return mav;
	}
	
	@RequestMapping("/02")
	public ModelAndView chart02Handle() throws JsonProcessingException{
		ModelAndView mav = new ModelAndView("t_chart");
		List<Map> list = memberDao.countByGender();
		//System.out.println(list);
		mav.addObject("section", "chart/02");
		// 2차원 배열형태의 JSON 문자열을 설정해둠 (JSON Array == java ArrayList,[][])
		List json = new ArrayList();
		for(Map m : list){
			Object[] ar = new Object[]{m.get("GENDER"),m.get("CNT")};
			json.add(ar);
		}
		String str = mapper.writeValueAsString(json);
		mav.addObject("json", str);
		System.out.println(str);		
		return mav;
	}
	
	// ajax를 이용해서 세팅
	@RequestMapping("/03")
	public ModelAndView chart03Handle() throws JsonProcessingException{
		ModelAndView mav = new ModelAndView("t_chart");
		mav.addObject("section", "chart/03");
		return mav;
	}	
	@RequestMapping("/piedata")
	@ResponseBody
	public List piedataHandle() throws JsonProcessingException{
		List<Map> list = memberDao.countByGender();		
		//System.out.print("list->");	System.out.println(list);
		List json = new ArrayList();
		for(Map m : list){
			Object[] ar = new Object[]{m.get("GENDER"),m.get("CNT")};
			json.add(ar);
		}
		return json;
	}
	
	@RequestMapping("/research")
	public ModelAndView researchChartHandle() throws JsonProcessingException{
		ModelAndView mav = new ModelAndView("t_chart");
		List<Map> list = memberDao.countByResearch();
		List json = new ArrayList();
		for(Map m : list){
			Object[] ar = new Object[]{m.get("SCORE"),m.get("CNT"),"orange"};
			json.add(ar);
		}
		json.add(new Object[] {5,0,"red"});
		String str = mapper.writeValueAsString(json);
		System.out.println(str);
		mav.addObject("json", str);
		mav.addObject("section","chart/research");
		
		return mav;
	}
	
}
