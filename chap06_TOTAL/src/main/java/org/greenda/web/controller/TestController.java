package org.greenda.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {

	@RequestMapping("/basic")
	public String basicHandle(){
		return "test/basic";
	}
}
