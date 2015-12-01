package kr.co.haeyum.mypage.controller;

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

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.Constants;
import kr.co.haeyum.mypage.common.PageVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.mypage.service.MypageService;
import kr.co.haeyum.mypage.vo.myPageVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.video.vo.FavoriteVO;
import kr.co.haeyum.video.vo.WatchVO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MypageService service;

	// 회원정보 표시
	@RequestMapping("/mypageMember.do")
	public ModelAndView mypageMain(HttpSession session, MemberVO member) throws Exception {
		member = (MemberVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView("/mypage/mypage");
		return mav;
	}

	// 비밀번호 변경
	@RequestMapping("/modify.json")
	@ResponseBody
	public boolean modifyPass(HttpSession session, String pPass, String mPass) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("user");
		String id = member.getId();
		String pass = service.selectPass(id);
		member.setPassword(mPass);

		if (pPass.equals(pass)) {
			service.updatePass(member);
			return true;
		} else {
			return false;
		}

	}
 
	// 강의 list
	@RequestMapping("/lectureList.json")
	@ResponseBody
	public Map<String, Object> lectureList(HttpSession session,
			@RequestParam(value = "reqPage", defaultValue = "1") int reqPage, int tabNumber) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		MemberVO member = (MemberVO) session.getAttribute("user");
		String id = member.getId();

		if(tabNumber==1){
			int lastPage = service.LectureLastPage(id);
			lastPage  = (int)Math.ceil(lastPage/10d);
			myPageVO pagevo = new myPageVO(reqPage, lastPage);
			pagevo.setId(id);			
			List<LectureVO> llist = service.selectLectureList(pagevo);
			map.put("llist", llist);
			map.put("pagevo", pagevo);
		}else{
			int lastPage = service.watchLastPage(id);
			lastPage  = (int)Math.ceil(lastPage/10d);
			myPageVO pagevo = new myPageVO(reqPage, lastPage);
			pagevo.setId(id);			
			List<WatchVO> wlist = service.selectWatchList(pagevo);
			map.put("wlist", wlist);
			map.put("pagevo", pagevo);
		}

		return map;

	}

	// 스토어 list(구매,판매)
	@RequestMapping("/storeList.json")
	@ResponseBody
	public Map<String, Object> storeList(HttpSession session,
			@RequestParam(value = "reqPage", defaultValue = "1") int reqPage, int tabNumber) throws Exception {

		Map<String, Object> map = new HashMap<>();
		MemberVO member = (MemberVO) session.getAttribute("user");
		String id = member.getId();

		
		if (tabNumber == 1) {
			int lastPage = service.selectLastPage(id);
			lastPage = (int) Math.ceil(lastPage / 10d);// 마지막페이지에 보여줄
			myPageVO pagevo = new myPageVO(reqPage, lastPage);
			pagevo.setId(id);
			List<ProductVO> slist = service.selectSellList(pagevo);
			map.put("slist", slist);
			map.put("pagevo", pagevo);

		} else {
			int lastPage = service.selectBuyLastPage(id);
			lastPage = (int) Math.ceil(lastPage / 10d);// 마지막페이지에 보여줄
			myPageVO pagevo = new myPageVO(reqPage, lastPage);
			pagevo.setId(id);
			 List<ProductVO> blist = service.selectBuyList(pagevo);
			 map.put("blist", blist);
			 map.put("pagevo", pagevo);
		}

		return map;

	}

	// 즐겨찾기
	@RequestMapping("/favoriteList.json")
	@ResponseBody
	public Map<String,Object> favoriteList(HttpSession session,
			@RequestParam(value = "reqPage", defaultValue = "1") int reqPage) throws Exception {
		
		Map<String,Object> map = new HashMap<>();
		MemberVO member = (MemberVO) session.getAttribute("user");
		String id = member.getId();
	
		int lastPage = service.selectFavoriteLastPage(id);
		lastPage =(int) Math.ceil(lastPage/10d);
		myPageVO pagevo = new myPageVO(reqPage, lastPage);
		pagevo.setId(id);
		List<FavoriteVO> flist = service.selectFavoriteList(pagevo);
		map.put("flist", flist);
		map.put("pagevo", pagevo);
		
		return map;
	
	}

}
