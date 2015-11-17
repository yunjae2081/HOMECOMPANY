package kr.co.haeyum.search.controller;

import java.util.List;

import kr.co.haeyum.search.service.VideoListService;
import kr.co.haeyum.search.vo.VideoListVO;

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
	public List<VideoListVO> list() throws Exception{		
		List<VideoListVO> vVo = service.selectVideoNo();
		
		return vVo;
	}
	
	@RequestMapping("/bestVideoExtend.json")
	@ResponseBody
	public List<VideoListVO> extend(int no) throws Exception{	
		List<VideoListVO> vVo = service.selectVideoExtend(no);
		for(VideoListVO vo : vVo) {
			System.out.println(vo.getvNo());
		}
		
		return vVo;
	}
}
