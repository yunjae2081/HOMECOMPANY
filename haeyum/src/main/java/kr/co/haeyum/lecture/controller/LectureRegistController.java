package kr.co.haeyum.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture")
public class LectureRegistController {

	
	@RequestMapping("/regist.do")
	public String regist() {
		
		return "";
	}
}
