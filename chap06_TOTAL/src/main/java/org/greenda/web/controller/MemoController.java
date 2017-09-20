package org.greenda.web.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.greenda.web.controller.ws.LoginUserWSHandler;
import org.greenda.web.models.MemberDao;
import org.greenda.web.models.MemoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/memo")
public class MemoController {
	@Autowired
	ObjectMapper mapper;
	@Autowired
	LoginUserWSHandler loginUser;
	@Autowired
	MemoDao memoDao;
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/send")
	public String addMemoGetHandle(Map map){
		List<Map> list = memberDao.readAllMemberInfo();
		map.put("memberList", list);
		map.put("section","memo/send");
		return "t_memo";
	}
	@PostMapping("/send")
	public ModelAndView addMemoPostHandle(@RequestParam Map map, HttpSession session){
		ModelAndView mav = new ModelAndView("t_memo");
		int r = memoDao.addMemo(map);
		mav.addObject("rst",r);
		Map m = new HashMap();
		m.put("mode","memo");
		m.put("sender",session.getAttribute("auth"));
		try {
			String msg = mapper.writeValueAsString(m);
			loginUser.sendMessageToUser((String)map.get("receiver"), msg);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}		
		mav.addObject("section", "memo/send");
		return mav;
	}
	
	@GetMapping("/list")
	public ModelAndView readAllMemoHandle(HttpSession session){
		ModelAndView mav = new ModelAndView("t_memo");
		List<Map> list = memoDao.readAllMemo((String)session.getAttribute("auth"));
		mav.addObject("section", "memo/list");
		mav.addObject("memoList", list);
		return mav;
	}
	
	@PostMapping("/delete")
	public String removeMemoHandle(@RequestParam Map map, Map m){
		int r = memoDao.removeMemo(map);
		if(r==1){
			return "redirect:/memo/list";
		}
		return "t_memo";
	}
	
}
