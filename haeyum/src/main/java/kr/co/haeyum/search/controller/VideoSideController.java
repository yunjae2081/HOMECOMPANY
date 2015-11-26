package kr.co.haeyum.search.controller;

import java.util.List;

import kr.co.haeyum.search.service.VideoSideService;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/side")
public class VideoSideController {
	
	@Autowired
	private VideoSideService service;
	
	@RequestMapping("/video.do")
	@ResponseBody
	public ModelAndView search(int category) throws Exception{
		
		System.out.println(category);
		
		ModelAndView mav = new ModelAndView("/video_search/video_side");
		List<VideoBestListVO> list = service.selectBestList(category);
		
		mav.addObject("list", list);
		mav.addObject("category", category);
		
		return mav;
	}

	@RequestMapping("/bestVideo.json")
	@ResponseBody
	public List<VideoBestListVO> bList(int category) throws Exception{		
		List<VideoBestListVO> vVo = service.selectBestList(category);
		
		return vVo;
	}
	
	@RequestMapping("/bestVideoExtend.json")
	@ResponseBody
	public List<VideoBestListVO> bExtend(int category, int no) throws Exception{	
		List<VideoBestListVO> vVo = service.selectBestExtend(category, no);
		
		return vVo;
	}
	
	@RequestMapping("/latestVideo.json")
	@ResponseBody
	public List<VideoLatestListVO> lList(int category) throws Exception{		
		List<VideoLatestListVO> vVo = service.selectLatestList(category);
		
		return vVo;
	}
	
	@RequestMapping("/latestVideoExtend.json")
	@ResponseBody
	public List<VideoLatestListVO> lExtend(int category, int no) throws Exception{	
		List<VideoLatestListVO> vVo = service.selectLatestExtend(category, no);
		
		return vVo;
	}
}
