package org.greenda.web.controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.greenda.web.models.MyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/my")
public class MyController {

	@Autowired
	ObjectMapper mapper;
	@Autowired
	MyDao myDao;
	@Autowired
	ServletContext application;
	
	//Info
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
	
	//Profile 이미지 
	@GetMapping("/profile")
	public ModelAndView getProfileHandle(){
		ModelAndView mav = new ModelAndView("t_my");
		mav.addObject("section", "my/profile");
		return mav;	}
	
	@PostMapping("/profile")
	public ModelAndView postProfileHandle(@RequestParam Map map,
					@RequestParam(name="profile") MultipartFile f ,HttpServletRequest request) throws InterruptedException{
		System.out.println(application.getRealPath("/temp"));
		Thread.sleep(10000);
		ModelAndView mav = new ModelAndView("t_my");
		System.out.println("파일 정보===============");
		System.out.println(f.toString());
		System.out.println(f.getContentType());
		System.out.println(f.getName());
		System.out.println(f.getOriginalFilename());
		System.out.println(f.getSize());
		System.out.println(f.isEmpty());
		System.out.println("postProfileHandle="+map);
		System.out.println("=====================");
		// transeferTo(File f) == 실제 업로드. 
		
		mav.addObject("section", "my/profile");
		return mav;
	}

}
