package kr.co.haeyum.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.Constants;
import kr.co.haeyum.mypage.common.PageVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.mypage.service.MypageService;

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
	@RequestMapping("/lectureList.do")
	public ModelAndView lectureList(@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView("/mypage/lectureList");

		System.out.println("pageNo" + pageNo);

		// regist 목록관련 파라미터 처리
		SearchVO param = new SearchVO();
		param.setStart((pageNo - 1) * Constants.PAGE_LIST_COUNT);
		param.setEnd((pageNo * Constants.PAGE_LIST_COUNT) - param.getStart());
		param.setId(member.getId());

		System.out.println(member.getId());
		System.out.println("param.getStart() param.getEnd()" + param.getStart() + "   " + param.getEnd());

		Map<String, Object> result = service.selectlectureList(param);

		int count = (Integer) result.get("count");
		System.out.println(result.get("list").toString());

		PageVO pagevo = new PageVO("lectureList.do", count, pageNo);
		mav.addObject("pageVO", pagevo);

		mav.addObject("list", result.get("list"));

		return mav;

	}

	// 스토어 list
	@RequestMapping("/storeList.do")
	public ModelAndView storeList(@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView("/mypage/StoreList");

		SearchVO param = new SearchVO();
		param.setStart((pageNo - 1) * Constants.PAGE_LIST_COUNT);
		param.setEnd((pageNo * Constants.PAGE_LIST_COUNT) - param.getStart());
		param.setId(member.getId());

		Map<String, Object> result = service.selectProductList(param);

		int count = (Integer) result.get("count");

		PageVO pagevo = new PageVO("storeList.do", count, pageNo);
		mav.addObject("pageVO", pagevo);

		mav.addObject("list", result.get("list"));
		return mav;
	}

	@RequestMapping("/favoriteList.do")
	public ModelAndView favoriteList(@RequestParam(value="pageNo",required=false,defaultValue="1")int pageNo,
			HttpSession session)throws Exception{
			MemberVO member = (MemberVO) session.getAttribute("user");	
			ModelAndView mav = new ModelAndView("/mypage/favoriteList");
			
			SearchVO param = new SearchVO();
			param.setStart((pageNo - 1) * Constants.PAGE_LIST_COUNT);
			param.setEnd((pageNo * Constants.PAGE_LIST_COUNT) - param.getStart());
			param.setId(member.getId());

			Map<String, Object> result = service.selectFavoriteList(param);

			int count = (Integer) result.get("count");

			PageVO pagevo = new PageVO("favoriteList.do", count, pageNo);
			mav.addObject("pageVO", pagevo);

			mav.addObject("list", result.get("list"));
			return mav;
	}

}
