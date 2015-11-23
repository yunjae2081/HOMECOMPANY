package kr.co.haeyum.search.controller;

import java.util.List;

import kr.co.haeyum.search.service.VideoSearchService;
import kr.co.haeyum.search.vo.VideoBestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/search")
public class VideoSearchController {

	@Autowired
	private VideoSearchService service;
	
	@RequestMapping("/video.do")
	@ResponseBody
	public ModelAndView search(String title) throws Exception{
		
		System.out.println(title);
		
		ModelAndView mav = new ModelAndView("/video_search/video_list");
		List<VideoBestListVO> list = service.selectNormalList(title);
		
		for(VideoBestListVO vlist : list){
			System.out.println(vlist.getTitle());
		}
		
		mav.addObject("list", list);
		
		return mav;
	}
}
