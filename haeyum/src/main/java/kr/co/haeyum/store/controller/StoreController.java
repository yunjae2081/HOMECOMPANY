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
	public ModelAndView detail(int no) throws Exception{
		
		System.out.println("물품번호 ㅣ " + no);
		ModelAndView mav = new ModelAndView("/store/storeDetail");
		
//		List<ProductImgVO> prdImg = service.selectStoreImg(no);
		ProductVO pVo = service.selectStoreDetail(no);
		String cate = service.selectCategoryName(no);
		String lecture = service.selectLectureName(no);
		
//		System.out.println("prdImg : " + prdImg.size());
		System.out.println("pVo : " + pVo.getpNo());
		System.out.println("cate : " + cate);
		System.out.println("lecture : " + lecture);
		
		
//		mav.addObject("prdImg", prdImg);
		mav.addObject("pVo", pVo);
		mav.addObject("cate", cate);
		mav.addObject("lecture", lecture);
		
		return mav;
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
