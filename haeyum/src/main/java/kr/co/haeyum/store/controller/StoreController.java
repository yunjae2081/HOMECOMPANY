package kr.co.haeyum.store.controller;

import java.util.List;

import kr.co.haeyum.store.service.StoreService;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.StoreListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService service;
	
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
	
//	탑메뉴 스토어 버튼 진입
	@RequestMapping("/storeList.do")
	public ModelAndView search() throws Exception{
		
		ModelAndView mav = new ModelAndView("/store/storeList");
		List<StoreListVO> list = service.selectStoreList();
		
		mav.addObject("list", list);
		
		return mav;
	}
	
//	최신순 진입
	@RequestMapping("/latestStore.json")
	@ResponseBody
	public List<StoreListVO> lList() throws Exception{		
		List<StoreListVO> vVo = service.selectLatestList();
		
		return vVo;
	}
	
//	인기순 진입
	@RequestMapping("/bestStore.json")
	@ResponseBody
	public List<StoreListVO> bList() throws Exception{		
		List<StoreListVO> vVo = service.selectBestList();
		
		return vVo;
	}
	
	
	
}
