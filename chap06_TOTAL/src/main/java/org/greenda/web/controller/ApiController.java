package org.greenda.web.controller;

import java.io.IOException;
import java.net.URL;
import java.util.Map;
import java.util.Scanner;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javassist.bytecode.stackmap.BasicBlock.Catch;

@Controller
@RequestMapping("/api")
public class ApiController {	
	@Autowired
	ObjectMapper mapper;
	
	@RequestMapping("/01")
	public void api_01Handle( ) {
		//Spring에서 제공하는 RestTemplate를 사용하지 않으면
		try{
			URL url = new URL("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/SearchSTNBySubwayLineService/1/10/2/");
			Scanner sc = new Scanner(url.openStream(),"utf-8");
			String str = "";
			while(sc.hasNextLine()){
				str += sc.nextLine();
			}
			System.out.println(str);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/02")
	public void api_02Handle(@RequestParam(defaultValue="1") String line ) {
		System.out.println("api/02");
		RestTemplate template = new RestTemplate();
		// get방식으로 요청결과를 얻어오려면
		/*String resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/SearchSTNBySubwayLineService/1/10/"+line+"/",
								String.class);
		*/
		
		String resp = template.getForObject("http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/json/SearchSTNBySubwayLineService/1/{cnt}/{var}/",
					String.class,5,line);
		System.out.println(resp);
		// 인자 설정을 Map으로 할 수 있는데 이때, 생성하는 이름이 의미가 있음(중요)
		
		
		// ObjectMapper (JSON 문자열 -> 객체 : readValue)
		//				(객체 -> JSON 문자열 : writeValueAsString)
		try {
			Map obj = mapper.readValue(resp, Map.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
	//RestTemplate : 특정 결로로 요청을 발생시키는 객체 (보내고 응답을 받아볼 수 있음.)
	
	@RequestMapping("/03")
	public void api_03Handle() {
		System.out.println("api/03");
		RestTemplate template = new RestTemplate();
		String resp = template.getForObject(
				"http://openapi.seoul.go.kr:8088/6f66654142746530383254796c4859/xml/SearchSTNBySubwayLineService/1/{a}/{b}/",
				String.class, 5, "1");
		// JSON : ObjectMapper 로 객체 변환해서 사용하면 됨.
		// XML로만 데이터를 주는 곳도 존재함. XML 분석 라이브러리를 이용해서 해결 해보자.
		// JSOUP : 파싱라이브러리
		System.out.println(resp);
		Document doc = Jsoup.parse(resp);
		Elements elms =  doc.getElementsByTag("row");
		for(Element e : elms){
			String scd = e.getElementsByTag("STATION_CD").get(0).ownText();
			String snm = e.getElementsByTag("STATION_NM").get(0).ownText();
			String ln = e.getElementsByTag("LINE_NUM").get(0).ownText();
			System.out.println(scd+"/"+snm+"/"+ln);
		}		
	}
	
}