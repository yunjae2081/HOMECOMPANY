package kr.co.haeyum.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.search.service.VideoSearchService;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

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
	
	@Autowired
	private LectureService lService;
	
	@RequestMapping("/video.do")
	@ResponseBody
	public ModelAndView search(String title) throws Exception{
		
		ModelAndView mav = new ModelAndView("/video_search/video_search");
		List<VideoBestListVO> list = service.selectBestList(title);
		
		mav.addObject("list", list);
		mav.addObject("title", title);
		
		return mav;
	}
	
	@RequestMapping("/bestVideo.json")
	@ResponseBody
	public List<VideoBestListVO> bList(String title) throws Exception{		
		List<VideoBestListVO> vVo = service.selectBestList(title);
		
		return vVo;
	}
	
	@RequestMapping("/bestVideoExtend.json")
	@ResponseBody
	public List<VideoBestListVO> bExtend(String title, int no) throws Exception{	
		List<VideoBestListVO> vVo = service.selectBestExtend(title, no);
		
		return vVo;
	}
	
	@RequestMapping("/latestVideo.json")
	@ResponseBody
	public List<VideoLatestListVO> lList(String title) throws Exception{		
		List<VideoLatestListVO> vVo = service.selectLatestList(title);
		
		return vVo;
	}
	
	@RequestMapping("/latestVideoExtend.json")
	@ResponseBody
	public List<VideoLatestListVO> lExtend(String title, int no) throws Exception{	
		List<VideoLatestListVO> vVo = service.selectLatestExtend(title, no);
		
		return vVo;
	}
	
	@RequestMapping("/mindMap.json")
	@ResponseBody
	public  Map<String, Object> mindMap(int lNo) throws Exception {
		Map<String, Object> node = new HashMap<String, Object>();
		
		LectureVO lVO = lService.selectLecture(lNo);
		List<FnodeVO> fList = lService.selectfNode(lNo);
		List<SnodeVO> sList = lService.selectsNode(lNo);
		List<TnodeVO> tList = lService.selecttNode(lNo);
		List<TlinkVO> tLink = lService.selecttLink(lNo);
		List<TfileVO> tFile = lService.selecttFile(lNo);
		
		node.put("lVO", lVO);
		node.put("fList", fList);
		node.put("sList", sList);
		node.put("tList", tList);
		node.put("tLink", tLink);
		node.put("tFile", tFile);
		
		return node;
	}

}
