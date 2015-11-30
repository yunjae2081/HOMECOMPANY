package kr.co.haeyum.store.controller;

import java.util.List;

import kr.co.haeyum.store.service.StoreSearchService;
import kr.co.haeyum.store.vo.StoreListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/store")
public class StoreSearchController {
	
	@Autowired
	private StoreSearchService service;
	
	@RequestMapping("/search.do")
	public ModelAndView search(String title) throws Exception{
		
		ModelAndView mav = new ModelAndView("/store/storeSearch");
		List<StoreListVO> list = service.selectBestList(title);
		
		mav.addObject("list", list);
		mav.addObject("title", title);
		
		return mav;
	}

	@RequestMapping("/bestSearch.json")
	@ResponseBody
	public List<StoreListVO> bList(String title) throws Exception{		
		List<StoreListVO> vVo = service.selectBestList(title);
		
		return vVo;
	}
	
	@RequestMapping("/bestSearchExtend.json")
	@ResponseBody
	public List<StoreListVO> bExtend(String title, int no) throws Exception{	
		List<StoreListVO> vVo = service.selectBestExtend(title, no);
		
		return vVo;
	}
	
	@RequestMapping("/latestSearch.json")
	@ResponseBody
	public List<StoreListVO> lList(String title) throws Exception{		
		List<StoreListVO> vVo = service.selectLatestList(title);
		
		return vVo;
	}
	
	@RequestMapping("/latestSearchExtend.json")
	@ResponseBody
	public List<StoreListVO> lExtend(String title, int no) throws Exception{	
		List<StoreListVO> vVo = service.selectLatestExtend(title, no);
		
		return vVo;
	}
	
}
