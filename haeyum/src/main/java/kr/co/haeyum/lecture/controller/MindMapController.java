package kr.co.haeyum.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.xmlrpc.base.Member;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.BMarkVO;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.LessonVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.lecture.vo.VideoVO;
import kr.co.haeyum.lecture.vo.WatchListVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.video.vo.FavoriteVO;

@Controller
@RequestMapping("/mindMap")
public class MindMapController {

	@Autowired
	private LectureService service;
	
	@RequestMapping("/view.do")
	public ModelAndView viewMap(@RequestParam(value="lNo", required=false, defaultValue="1") int lNo, HttpSession session) throws Exception{
		
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
		if(sList.size() != 0){
			VideoVO firstVideo = service.selectVideo(sList.get(0).getsNo());
			FavoriteVO fav = new FavoriteVO();
			if(session.getAttribute("user") != null) {
				String id = ((MemberVO) session.getAttribute("user")).getId();
				if(id != null) {
					fav.setlNo(lNo);
					fav.setFavId(id);
					if(service.selectFavCheck(fav) == 1){
						mav.addObject("favCheck", "1");
					} else {
						mav.addObject("favCheck", "0");
					}
				}
			}
			mav.addObject("firstVideo", firstVideo);
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/viewVideo.do")
	public Object viewVideo(@RequestParam(value="sNo") int sNo, HttpSession session) throws Exception{
		VideoVO video = service.selectVideo(sNo); // video
		Map<String, Object> retVal = new HashMap<String, Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user != null) {
			WatchListVO watch = new WatchListVO();
			watch.setwId(user.getId());
			watch.setvNo(video.getvNo());
			WatchListVO check = service.selectWatchList(watch);
			int wNo = 0;
			if(check == null){
				wNo = service.insertWatchList(watch);
			} else {
				wNo = check.getwNo();
				List<BMarkVO> bmarkList = service.selectBMarkList(wNo);
				retVal.put("bmarkList", bmarkList);
			}
			retVal.put("wNo", wNo);
		}
		
		service.updateVideoHit(video.getvNo());
		
		List<LessonVO> lessonList =  service.selectLessonList(video.getvNo());  //lessonList
		List<ProductVO> productList = service.selectProductList(video.getvNo()); //productList
		List<ProductImgVO> productImgList = new ArrayList<ProductImgVO>() ;
		for (ProductVO product : productList ) {
			productImgList.add(service.selectProductImg(product.getpNo()));
		}
		
		retVal.put("video", video);
		retVal.put("lessonList", lessonList);
		retVal.put("productList", productList);
		retVal.put("productImgList", productImgList);
		
		return retVal;
		
		
	}
	
	@ResponseBody
	@RequestMapping("/bookMarkRegist.do")
	public void bookMarkRegist(BMarkVO bmark) throws Exception {
		service.insertBMark(bmark);
	}
	
	
	@ResponseBody
	@RequestMapping("/wishVideo.do")
	public void wishVideo(FavoriteVO fav, @RequestParam(value="favCheck", required=false, defaultValue="0") int favCheck) throws Exception {
		System.out.println("check" + favCheck + "id" + fav.getFavId());
		if(favCheck == 1) {
			service.insertFavVideo(fav);
		} else {
			service.deleteFavVideo(fav);
		}
	}
}
