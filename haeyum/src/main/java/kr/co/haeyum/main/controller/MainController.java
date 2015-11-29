package kr.co.haeyum.main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.haeyum.main.service.MainService;
import kr.co.haeyum.main.vo.MainVO;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/main.do")
	public ModelAndView mainList() throws Exception{
		ModelAndView mav = new ModelAndView("main");
		List<MainVO> clist = new ArrayList<>();
		List<MainVO> vlist = new ArrayList<>();
		
		
		for(int i = 1; i <= 10; i++){
			MainVO cMainVO = service.mainClist(i);
			MainVO vMainVO = service.mainVlist(i);
			
//		
//			System.out.println("카테이름: " + cMainVO.getCategory() + "강의" 
//								+ cMainVO.getCntCurri() + "총" + vMainVO.getCntVideo());
//			System.out.println("!!!!!");
			clist.add(cMainVO);
			vlist.add(vMainVO);
		}
		mav.addObject("clist", clist);
		mav.addObject("vlist", vlist);
		
		return mav;
	}
}
