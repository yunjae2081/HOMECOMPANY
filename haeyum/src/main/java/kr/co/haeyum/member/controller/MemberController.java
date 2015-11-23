package kr.co.haeyum.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.haeyum.member.service.MemberService;
import kr.co.haeyum.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping("/login.json")
	@ResponseBody
	public boolean login(MemberVO member, HttpServletRequest req) throws Exception {
		System.out.println(member.getId());
		System.out.println(member.getPassword());

		int cnt = service.selectlogin(member);
		if (cnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("user", member);
			System.out.println(cnt);
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/logout.json")
	@ResponseBody
	public void logout(HttpServletRequest req) throws Exception {
		System.out.println("뿅");
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		System.out.println("세션종료");
	}

	@RequestMapping("/join.json")
	@ResponseBody
	public void insertJoin(MemberVO member) throws Exception {
		service.insertJoin(member);
		System.out.println("가입!");

	}

}
