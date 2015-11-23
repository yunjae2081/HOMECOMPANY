package kr.co.haeyum.lecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.NodeIndexVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TnodeVO;

@Controller
@RequestMapping("/lecture")
public class LectureRegistController {

	@Autowired
	private LectureService service;

	@RequestMapping("/regist.do")
	public String regist(MultipartHttpServletRequest req, NodeIndexVO nodeVO, LectureVO lVO) throws Exception {

		int lNo = service.insertLecture(lVO);

		for (int i = 1; i <= Integer.parseInt(req.getParameter("fNodeIndex")); i++) {
			FnodeVO fVO = new FnodeVO();
			fVO.setlNo(lNo);
			fVO.setfX(Integer.parseInt(req.getParameter("fX" + i)));
			fVO.setfY(Integer.parseInt(req.getParameter("fY" + i)));
			fVO.setfTitle(req.getParameter("fTitle" + i));
			fVO.setfContent(req.getParameter("fContent" + i));
			fVO.setfName(req.getParameter("fName" + i));

			service.insertfNode(fVO);
		}

		for (int i = 1; i <= Integer.parseInt(req.getParameter("sNodeIndex")); i++) {
			SnodeVO sVO = new SnodeVO();
			sVO.setlNo(lNo);
			sVO.setsX(Integer.parseInt(req.getParameter("sX" + i)));
			sVO.setsY(Integer.parseInt(req.getParameter("sY" + i)));
			sVO.setsTitle(req.getParameter("sTitle" + i));
			sVO.setsContent(req.getParameter("sContent" + i));
			sVO.setsName(req.getParameter("sName" + i));
			sVO.setfName(req.getParameter("sPname" + i));
			
			service.insertsNode(sVO);
		}
		
		for (int i = 1; i < Integer.parseInt(req.getParameter("tNodeIndex" + i)); i++) {
			TnodeVO tVO = new TnodeVO();
			tVO.setlNo(lNo);
			tVO.settX(Integer.parseInt(req.getParameter("tX" + i)));
			tVO.settY(Integer.parseInt(req.getParameter("tY" + i)));
			
			service.inserttNode(tVO);
		}
		
		return "redirect:/index.jsp";
	}
}
