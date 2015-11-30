package kr.co.haeyum.store.controller;

import java.util.List;

import kr.co.haeyum.store.service.StoreSearchService;
import kr.co.haeyum.store.vo.StoreListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/store")
public class StoreSearchController {
	
	@Autowired
	private StoreSearchService service;
	
	@RequestMapping("/search.do")
	public ModelAndView search(String title) throws Exception{
		
		System.out.println(title);
		
		ModelAndView mav = new ModelAndView("/store/storeSearch");
		List<StoreListVO> list = service.selectBestList(title);
		
		mav.addObject("list", list);
		mav.addObject("title", title);
		
		return mav;
	}

	
}
