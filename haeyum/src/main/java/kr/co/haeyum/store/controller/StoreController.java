package kr.co.haeyum.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.haeyum.store.service.StoreService;
import kr.co.haeyum.store.vo.ProductVO;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService service;
	
	@RequestMapping("/storeList.do")
	public String search() throws Exception{
		System.out.println("ㅡㅡ");
		return "/store/storeList";
	}
	
	@RequestMapping("/bestProduct.json")
	@ResponseBody
	public List<ProductVO> list() throws Exception{		
		List<ProductVO> pVo = service.selectProductNo();
		
		return pVo;
	}
	
	@RequestMapping("/bestProductExtend.json")
	@ResponseBody
	public List<ProductVO> extend(int no) throws Exception{	
		List<ProductVO> pVo = service.selectProductExtend(no);
		for(ProductVO vo : pVo) {
			System.out.println(vo.getvNo());
		}
		
		return pVo;
	}
	
	@RequestMapping("/storeDetail.do")
	public String detail() throws Exception{
		
		
		return "/store/storeDetail";
	}
	
}
