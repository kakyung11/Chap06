package org.greenda.web.controller;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.greenda.web.controller.ws.AlertWSHandler;
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
	@Autowired
	AlertWSHandler alertws; // 웹소켓 핸들러 와이어링 받아둠
	
	@GetMapping("/join")
	public String getJoinHandle(Map map){
		//ModelAndView mav = new ModelAndView();
		//mav.setViewName("t_member");
		//mav.addObject("section", "member/join");
		map.put("section", "member/join");
		return "t_member";
	}
	
	@PostMapping("/join")
	public String postJoinHandle(@RequestParam Map map, ModelMap mMap, HttpSession session){
		try{
			int r = memberDao.addOne(map);
			session.setAttribute("auth", map.get("id"));
			// AlertWSHandler를 통해서, 메세지를 보냄
			alertws.sendMessage(map.get("id")+"님이 가입하였습니다");			
			return "redirect:/my/info";
		}catch(Exception e){
			mMap.addAttribute("temp", map);
			mMap.addAttribute("section", "member/join");
			return "t_member";
		}
	}
	
	@PostMapping(path="/signup_check/{mode}",produces="application/json;charset=utf-8")
	@ResponseBody
	public boolean signupCheckHandle(@RequestBody(required=false) String body, @PathVariable(name="mode")String mode) throws SQLException{
		System.out.println(mode);
		System.out.println(body);
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
	
	// login 처리
	@GetMapping("/login")
	public ModelAndView getloginHandle(){	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t_member");
		mav.addObject("section", "member/login");
		return mav;
	}
	
	@PostMapping("/session")
	public String postloginHandle(@RequestParam Map map, HttpSession session, ModelMap mMap ) throws SQLException{
		try{
			Map m = memberDao.logIn(map);
			session.setAttribute("auth", m.get("ID"));
			//System.out.println(session.getAttribute("auth"));
			return "redirect:/my/info";
		}catch(Exception e){
			mMap.addAttribute("temp", map);
			mMap.addAttribute("section", "member/login");
			e.printStackTrace();
			return "t_member";
		}
	}
	
	//logout
	@GetMapping("/logout")
	public String logoutHandle(HttpSession session){	
		session.invalidate();
		return "redirect:/member/login";
	}
	
	@GetMapping("/readAllMemberInfo")
	public ModelAndView readAllMemberInfoHandle(@RequestParam(name="page", defaultValue="1") int page,HttpSession session){
		ModelAndView mav = new ModelAndView("t_member");
		int count = memberDao.memberCount();
		if(count%5==0){
			count = count/5;
		}else{
			count = count/5+1;
		}
		Map map = new HashMap();
		map.put("start", (page-1)*5+1);
		map.put("end", page*5);
		List<Map> list = memberDao.readMemberPaging(map);
		//List<Map> list = memberDao.readAllMemberInfo();
		mav.addObject("pageCount", count);
		mav.addObject("memberInfo", list);
		mav.addObject("section", "member/readAllMemberInfo");
		return mav;
	}
}
