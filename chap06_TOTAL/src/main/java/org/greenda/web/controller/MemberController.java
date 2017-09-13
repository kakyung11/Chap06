package org.greenda.web.controller;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.greenda.web.models.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	ObjectMapper mapper;
	@Autowired
	MemberDao memberDao;	
	
	@GetMapping("/join")
	public ModelAndView getJoinHandle(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_member");
		mav.addObject("section", "member/join");
		return mav;
	}
	
	@PostMapping("/join")
	public String postJoinHandle(@RequestParam Map map, ModelMap mMap, HttpSession session){
		try{
			int r = memberDao.addOne(map);
			session.setAttribute("auth", map.get("id"));
			return "redirect:/board/list";
		}catch(Exception e){
			mMap.addAttribute("temp", map);
			mMap.addAttribute("section", "member/join");
			return "t_member";
		}
	}
	
	@PostMapping(path="/signup_check/{mode}",produces="application/json;charset=utf-8")
	@ResponseBody
	public boolean signupCheckHandle(@RequestBody(required=false) String body, @PathVariable(name="mode")String mode) throws SQLException{
		boolean b=true;
		if(mode.equals("id")){
			b = memberDao.checkId(body);
			System.out.println("id = "+b);
		}
		if(mode.equals("email")){
			b = memberDao.checkEmail(body);
			System.out.println("email = "+b);
		}
		return b;
	}
	
	// login Ã³¸®
	@GetMapping("/logIn")
	public ModelAndView getloginHandle(){	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_member");
		mav.addObject("section", "member/logIn");
		return mav;
	}
	
	@PostMapping("/session")
	public String postloginHandle(@RequestParam Map map, HttpSession session, ModelMap mMap ) throws SQLException{
		try{
			boolean b = memberDao.logIn(map);
			session.setAttribute("auth", map.get("id"));
			return "redirect:/board/list";
		}catch(Exception e){
			mMap.addAttribute("temp", map);
			mMap.addAttribute("section", "member/logIn");
			return "t_member";
		}
	}
}
