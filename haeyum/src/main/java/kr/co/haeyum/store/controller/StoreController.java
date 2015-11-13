package kr.co.haeyum.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.haeyum.store.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	private StoreService service;
	
	@RequestMapping("/storeList.do")
	public String search() throws Exception{
		System.out.println("µé¾î¿È");
		return "/store/storeList";
	}
}
