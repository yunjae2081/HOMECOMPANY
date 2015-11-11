package kr.co.haeyum.search.controller;

import kr.co.haeyum.search.service.VideoSearchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class VideoSearchController {

	@Autowired
	private VideoSearchService service;
	
	@RequestMapping("/video.do")
	public String search() throws Exception{
		return "/video_search/video_llist";
	}
}
