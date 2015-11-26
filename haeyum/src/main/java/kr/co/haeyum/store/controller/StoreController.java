package kr.co.haeyum.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.haeyum.store.service.StoreService;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService service;
	
	// 인기순리스트
	@RequestMapping("/bestProduct.json")
	@ResponseBody
	public List<ProductVO> bList() throws Exception{		
		List<ProductVO> pVo = service.selectBestList();
		
		return pVo;
	}
	
	// 인기순리스트(무한스크롤)
	@RequestMapping("/bestProductExtend.json")
	@ResponseBody
	public List<ProductVO> bExtend(int no) throws Exception{	
		List<ProductVO> pVo = service.selectBestExtend(no);
		for(ProductVO vo : pVo) {
			System.out.println(vo.getvNo());
		}
		
		return pVo;
	}

	
	/**/
	@RequestMapping("/storeDetail.do")
	public /*ModelAndView*/ String detail(/*int no*/) throws Exception{
		
		/*ModelAndView mav = new ModelAndView("/store/storeDetail");
		List<ProductImgVO> iList = service.selectStoreImg(no);
		ProductVO pVo = service.selectStoreDetail(no);
		
		mav.addObject("ilist", iList);
		mav.addObject("pVo", pVo);*/
		return "/store/storeDetail";
	}
	
	// 최신순리스트
	@RequestMapping("/latestProduct.json")
	@ResponseBody
	public List<ProductVO> lList() throws Exception{		
		List<ProductVO> pVo = service.selectLatestList();
		
		return pVo;
	}
	
	// 최신순리스트(무한스크롤)
	@RequestMapping("/latestProductExtend.json")
	@ResponseBody
	public List<ProductVO> lExtend(int no) throws Exception{	
		List<ProductVO> pVo = service.selectLatestExtend(no);
		
		return pVo;
	}

	// 인기순리스트(초기화면)
	@RequestMapping("/storeList.do")
	@ResponseBody
	public ModelAndView search() throws Exception{
		
		ModelAndView mav = new ModelAndView("/store/storeList");
		List<ProductVO> list = service.selectBestList();
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	
}
