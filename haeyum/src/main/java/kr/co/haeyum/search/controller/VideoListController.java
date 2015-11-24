package kr.co.haeyum.search.controller;

import java.util.List;

import kr.co.haeyum.search.service.VideoListService;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/list")
public class VideoListController {
	
	@Autowired
	private VideoListService service;
	
	@RequestMapping("/bestVideo.json")
	@ResponseBody
	public List<VideoBestListVO> bList() throws Exception{		
		List<VideoBestListVO> vVo = service.selectBestList();
		
		return vVo;
	}
	
	@RequestMapping("/bestVideoExtend.json")
	@ResponseBody
	public List<VideoBestListVO> bExtend(int no) throws Exception{	
		List<VideoBestListVO> vVo = service.selectBestExtend(no);
		
		return vVo;
	}
	
	@RequestMapping("/latestVideo.json")
	@ResponseBody
	public List<VideoLatestListVO> lList() throws Exception{		
		List<VideoLatestListVO> vVo = service.selectLatestList();
		
		return vVo;
	}
	
	@RequestMapping("/latestVideoExtend.json")
	@ResponseBody
	public List<VideoLatestListVO> lExtend(int no) throws Exception{	
		List<VideoLatestListVO> vVo = service.selectLatestExtend(no);
		
		return vVo;
	}
	
	@RequestMapping("/listVideo.do")
	@ResponseBody
	public ModelAndView search() throws Exception{
		
		ModelAndView mav = new ModelAndView("/video_search/video_list");
		List<VideoBestListVO> list = service.selectBestList();
		
		mav.addObject("list", list);
		
		return mav;
	}
}
