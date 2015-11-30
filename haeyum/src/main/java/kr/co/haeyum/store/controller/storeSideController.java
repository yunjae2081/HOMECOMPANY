package kr.co.haeyum.store.controller;

import java.util.List;

import kr.co.haeyum.store.service.StoreSideService;
import kr.co.haeyum.store.vo.StoreListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/side")
public class storeSideController {
	
	@Autowired
	private StoreSideService service;
	
	@RequestMapping("/category.do")
	@ResponseBody
	public ModelAndView search(int category) throws Exception{
		
		System.out.println(category);
		
		ModelAndView mav = new ModelAndView("/store/storeSide");
		List<StoreListVO> list = service.selectBestList(category);
		
		mav.addObject("list", list);
		mav.addObject("category", category);
		
		return mav;
	}

	@RequestMapping("/bestSearch.json")
	@ResponseBody
	public List<StoreListVO> bList(int category) throws Exception{		
		List<StoreListVO> vVo = service.selectBestList(category);
		
		return vVo;
	}
	
	@RequestMapping("/bestSearchExtend.json")
	@ResponseBody
	public List<StoreListVO> bExtend(int category, int no) throws Exception{
		
		System.out.println("hi~" + category);
		System.out.println("bye" + no);
		
		List<StoreListVO> vVo = service.selectBestExtend(category, no);
		System.out.println(vVo.size());
		System.out.println("before");
		
		for(StoreListVO list : vVo){
			System.out.println("get");
			System.out.println(list.getPrice());
		}
		
		System.out.println("null");
		
		return vVo;
	}
	
	@RequestMapping("/latestSearch.json")
	@ResponseBody
	public List<StoreListVO> lList(int category) throws Exception{		
		List<StoreListVO> vVo = service.selectLatestList(category);
		
		return vVo;
	}
	
	@RequestMapping("/latestSearchExtend.json")
	@ResponseBody
	public List<StoreListVO> lExtend(int category, int no) throws Exception{	
		List<StoreListVO> vVo = service.selectLatestExtend(category, no);
		
		return vVo;
	}
}
