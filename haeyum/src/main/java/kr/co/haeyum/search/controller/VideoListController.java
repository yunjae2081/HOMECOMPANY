package kr.co.haeyum.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.search.service.VideoListService;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

@Controller
@RequestMapping("/list")
public class VideoListController {
	
	@Autowired
	private VideoListService service;
	
	@Autowired
	private LectureService lService;
	
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
	public ModelAndView search() throws Exception{
		
		ModelAndView mav = new ModelAndView("/video_search/video_list");
		List<VideoBestListVO> list = service.selectBestList();
		
		mav.addObject("list", list);
		
		return mav;
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
