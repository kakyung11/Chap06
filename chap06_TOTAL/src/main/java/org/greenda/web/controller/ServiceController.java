package org.greenda.web.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	ObjectMapper mapper;
	
	@RequestMapping("/parkingList")
	public String parkingListHandle(@RequestParam(name="gu",defaultValue="")String gu, Map map){
		RestTemplate template = new RestTemplate();
		String resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/GetParkInfo/1/1000/{gu}",String.class,gu);
		
		try {
			Map obj = mapper.readValue(resp, Map.class);
			Map row = (Map) obj.get("GetParkInfo");
			System.out.println(row);
			map.put("data", row);
			map.put("section", "service/parkingList");
			
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return "t_service";
	}
	
}
