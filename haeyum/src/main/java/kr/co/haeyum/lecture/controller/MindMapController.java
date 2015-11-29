package kr.co.haeyum.lecture.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.LessonVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.lecture.vo.VideoVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;

@Controller
@RequestMapping("/mindMap")
public class MindMapController {

	@Autowired
	private LectureService service;
	
	@RequestMapping("/view.do")
	public ModelAndView viewMap(@RequestParam(value="lNo", required=false, defaultValue="1") int lNo) throws Exception{
		
		ModelAndView mav = new ModelAndView("/mindMap/mindMapView3");
		
		LectureVO lVO = service.selectLecture(lNo);
		List<FnodeVO> fList = service.selectfNode(lNo);
		List<SnodeVO> sList = service.selectsNode(lNo);
		List<TnodeVO> tList = service.selecttNode(lNo);
		List<TlinkVO> tLink = service.selecttLink(lNo);
		List<TfileVO> tFile = service.selecttFile(lNo);
		
		mav.addObject("lVO", lVO);
		mav.addObject("fList", fList);
		mav.addObject("sList", sList);
		mav.addObject("tList", tList);
		mav.addObject("tLink", tLink);
		mav.addObject("tFile", tFile);
		
		
		//수정이 부분
		VideoVO firstVideo = service.selectVideo(sList.get(0).getsNo());
		mav.addObject("firstVideo", firstVideo);
		return mav;
	}
	
	@RequestMapping("/viewVideo.do")
	public String viewVideo(@RequestParam(value="sNo") int sNo) throws Exception{
		System.out.println("sno : " + sNo);
		VideoVO video = service.selectVideo(sNo); // video
		List<LessonVO> lessonList =  service.selectLessonList(video.getvNo());  //lessonList
		List<ProductVO> productList = service.selectProductList(video.getvNo()); //productList
		List<ProductImgVO> productImgList = new ArrayList<ProductImgVO>() ;
		for (ProductVO product : productList ) {
			productImgList.add(service.selectProductImg(product.getpNo()));
		}
		
		
		return null;
		
	}
}
