package kr.co.haeyum.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MypageService service;

	@RequestMapping("/mypageMember.do")
	public ModelAndView mypageMain(HttpSession session, MemberVO member) throws Exception {
		member.setNo(1);
		member.setId("tntntntn");
		member.setName("안수정");
		session.setAttribute("user", member);
		System.out.println("강제로그인");
		ModelAndView mav = new ModelAndView("/mypage/mypage");
		// mav.addObject("user", (MemberVO)session.getAttribute("user"));
		return mav;
	}

	@RequestMapping("/lectureList.do")
	public ModelAndView lectureList(HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("user");
		System.out.println(member.getNo());
		List<LectureVO> list = service.selectlectureList(member.getNo());
		System.out.println(list.size());
		ModelAndView mav = new ModelAndView("/mypage/lectureList");
		mav.addObject("list", list);
		return mav;

	}
}
