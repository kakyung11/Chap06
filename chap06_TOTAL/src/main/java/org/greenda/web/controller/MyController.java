package org.greenda.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Autowired
	SimpleDateFormat sdf;
	
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
	public ModelAndView getProfileHandle(HttpSession session){
		ModelAndView mav = new ModelAndView("t_my");
		String id = (String) session.getAttribute("auth");
		Map map = myDao.readRecentProfile(id);
		//System.out.println(map);
		mav.addObject("section", "my/profile");
		mav.addObject("RecentProfile", map);
		return mav;	
	}
	
	@PostMapping("/profile")
	public ModelAndView postProfileHandle(@RequestParam Map map, HttpSession session,
					@RequestParam(name="profile") MultipartFile f ,HttpServletRequest request) throws InterruptedException{
		ModelAndView mav = new ModelAndView("t_my");
		
		System.out.println("파일 실제 경로 : "+application.getRealPath("/profiles")); // 파일이 저장되는 실제 경로를 찍어줌
		Thread.sleep(10000);
		System.out.println("파일 정보===============");
		System.out.println(f.toString());
		System.out.println(f.getContentType());
		System.out.println(f.getName());
		System.out.println(f.getOriginalFilename());
		System.out.println(f.getSize());
		System.out.println(f.isEmpty());
		System.out.println("=====================");
		
		// 파일업로드 시키기
		String fileName = session.getAttribute("auth")+"_"+sdf.format(System.currentTimeMillis())+".jpg";
		System.out.println("fileName: "+fileName);
		File profileImg = new File(application.getRealPath("/profiles"), fileName);
		String fileUrl = "/profiles/"+fileName;
		System.out.println("fileUrl: "+fileUrl);
		try {
			String type = f.getContentType();	// 가져온 파일의 타입 확인
			if(type.startsWith("image")){
				f.transferTo(profileImg); // transeferTo(File f) == 실제 업로드. 
				map.put("fileUrl", fileUrl);
				int r = myDao.uploadProfile(map);
				//System.out.println(r); 
				Map m = myDao.readRecentProfile((String)session.getAttribute("auth"));
				mav.addObject("RecentProfile", m);
			}						
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("section", "my/profile");
		return mav;
	}
	
	@PostMapping(path="/readAllProfile",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<Map> readAllProfileHandle(@RequestBody(required=false) String body){
		System.out.println(body);
		List<Map> list = myDao.readAllProfile(body);
		return list;
	}
}
