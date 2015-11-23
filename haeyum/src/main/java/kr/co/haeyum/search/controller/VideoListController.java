package kr.co.haeyum.search.controller;

import java.util.List;

import kr.co.haeyum.search.service.VideoListService;
import kr.co.haeyum.search.vo.VideoBestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/list")
public class VideoListController {
	
	@Autowired
	private VideoListService service;
	
	@RequestMapping("/bestVideo.json")
	@ResponseBody
	public List<VideoBestListVO> list() throws Exception{		
		List<VideoBestListVO> vVo = service.selectBestList();
		
		return vVo;
	}
	
	@RequestMapping("/bestVideoExtend.json")
	@ResponseBody
	public List<VideoBestListVO> extend(int no) throws Exception{	
		List<VideoBestListVO> vVo = service.selectBestExtend(no);
		
		return vVo;
	}
}
