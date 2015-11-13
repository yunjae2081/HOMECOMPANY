package kr.co.haeyum.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/list")
public class VideoListController {
	
	@RequestMapping("/bestVideo.json")
	@ResponseBody
	public String list() throws Exception{
		System.out.println("hi");
		
		return "1";
	}
}
