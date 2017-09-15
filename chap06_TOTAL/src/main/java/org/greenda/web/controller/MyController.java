package org.greenda.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.greenda.web.models.MyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/my")
public class MyController {

	@Autowired
	ObjectMapper mapper;
	@Autowired
	MyDao myDao;
	
	@GetMapping("/info")
	public String getInfoHandle(HttpSession session, ModelMap mMap){
		String id = (String) session.getAttribute("auth");
		System.out.println(id);
		Map map = myDao.readOneDetail(id);
		mMap.addAttribute("detail", map);
		mMap.addAttribute("section", "my/info");		
		return "t_my";
	} 
	
	@PostMapping("/info")
	public String PostInfoHandle(HttpSession session, @RequestParam Map map, ModelMap mMap){
		try{
			int r = myDao.editDetail(map);
			return "redirect:/my/info";
		}catch(Exception e){
			mMap.addAttribute("section","my/info");
			e.printStackTrace();
			return "t_my";	
		}
	}
	
	@GetMapping("/profile")
	public String getProfileHandle(ModelMap mMap){
		mMap.addAttribute("section", "my/profile");
		return "t_my";
	}

}
