package org.greenda.web.controller;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.greenda.web.models.MarketDao;

@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired
	MarketDao mDao;
	
	@GetMapping("/add")
	public String addGetHandle(Map map){
		map.put("section", "market/add");
		return "t_market";
	}
	@PostMapping("/add")
	public String addPostHandle(@RequestParam Map map, Model model){
		int r = mDao.addOne(map);
		if(r==1){
			return "redirect:/market/list";
		}
		else{
			model.addAttribute("section", "market/add");
		}
		return "t_market";
	}
	
	@RequestMapping("/list")
	public ModelAndView readAllList(HttpSession session){
		ModelAndView mav = new ModelAndView("t_market");
		//mav.setViewName("t_m_expr");
		System.out.println(session.getAttribute("auth"));
		List<Map> list = mDao.readAll();
		//map.put("marketList", list);
		mav.addObject("marketList", list);
		mav.addObject("section", "market/list");
		return mav;
	}
	
	@PostMapping("/search")
	public String search(@RequestParam Map map, ModelMap model){
		List<Map> list = mDao.search(map);
		for(Map m : list){
			System.out.println(m);
		}
		model.addAttribute("searchList",list);
		model.addAttribute("section", "market/search");
		return "t_market";
	}
	
	@GetMapping("/view/{num}")
	public String marketViewHandle(@PathVariable(name="num") String num, Map map, HttpSession session) throws SQLException{
		map.put("m", mDao.readOne(num));
		map.put("section", "market/view");
		return "t_market";
	}
}











