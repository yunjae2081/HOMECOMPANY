package kr.co.haeyum.lecture.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.NodeIndexVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.lecture.vo.VideoVO;

@Controller
@RequestMapping("/lecture")
public class LectureRegistController {

	@Autowired
	private LectureService service;
	
	@Autowired
	private ServletContext servletContext;
	
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
			
			//수정이 부분
			
			//video
			MultipartFile videoFile = req.getFile("chooseFile"+i);
			String orgFileName = videoFile.getOriginalFilename();
			if(orgFileName != null && !orgFileName.equals("")){
				String ext = "";
				int index = orgFileName.lastIndexOf(".");
				if(index != -1){
					ext = orgFileName.substring(index);
				}
				
				String saveFileName = "haeyum-" + UUID.randomUUID().toString() + ext;
				videoFile.transferTo(new File("C:\\java73\\web-workspace\\haeyum\\src\\main\\webapp\\video" + saveFileName));

				byte decode[] = Base64.decodeBase64(req.getParameter("v_capture_test1"+ i));
				FileOutputStream fo;
				File mainImg = new File("C:\\java73\\web-workspace\\haeyum\\src\\main\\webapp\\mainImg/vMainImage"+i+".jpg");
				mainImg.createNewFile();
				fo = new FileOutputStream(mainImg);
				fo.write(decode);
				fo.close();
				
				String saveImgName = "haeyum-" + UUID.randomUUID().toString() + ".jpg";
				
				VideoVO videoVO = new VideoVO();
				videoVO.setsName("sName"+i);
				videoVO.setOrgFileName(orgFileName);
				videoVO.setRealFileName(saveFileName);
				videoVO.setiOrgFileName("vMainImage"+i+".jpg");
				videoVO.setiRealFileName(saveImgName);
				
			}
//			//lesson
//			for(int j = 0; j < Integer.parseInt(req.getParameter("totalLCount"+i)); j++){
//				
//			}
			
		}

		for (int i = 1; i <= Integer.parseInt(req.getParameter("tNodeIndex")); i++) {
			TnodeVO tVO = new TnodeVO();
			tVO.setlNo(lNo);
			tVO.settX(Integer.parseInt(req.getParameter("tX" + i)));
			tVO.settY(Integer.parseInt(req.getParameter("tY" + i)));
			tVO.setsName(req.getParameter("tPname" + i));
			tVO.settName(req.getParameter("tName" + i));
			service.inserttNode(tVO);

			if (req.getParameter("tLinkTitle" + i) != null) {
				TlinkVO linkVO = new TlinkVO();
				linkVO.setlNo(lNo);
				linkVO.settName(req.getParameter("tName" + i));
				linkVO.setLinkTitle(req.getParameter("tLinkTitle" + i));
				linkVO.setLinkContent(req.getParameter("tLinkContent" + i));
				linkVO.setlUrl(req.getParameter("tLinkUrl" + i));
				
				service.insertLink(linkVO);
			} else if (req.getParameter("tAsmtTitle" + i) != null) {
				MultipartFile mFile = req.getFile("tAsmtFile" + i);
				String orgFileName = mFile.getOriginalFilename();
				
				if (orgFileName != null && !orgFileName.equals("")) {
					String ext = "";
					
					int index = orgFileName.lastIndexOf(".");
					if(index != -1) {
						ext = orgFileName.substring(index);
					}
					
					String saveFileName = "haeyum-" + UUID.randomUUID().toString() + ext;
					mFile.transferTo(new File(servletContext.getRealPath("/assignment/") + "/" + saveFileName));
					TfileVO fileVO = new TfileVO();
					
					fileVO.setlNo(lNo);
					fileVO.setaTitle(req.getParameter("tAsmtTitle" + i));
					fileVO.setaContent(req.getParameter("tAsmtContent" + i));
					fileVO.setRealFileName(saveFileName);
					fileVO.setOrgFileName(orgFileName);
					fileVO.settName(req.getParameter("tName" + i));
					
					service.insertFile(fileVO);
				}
			}
		}
		return "redirect:/index.jsp";
	}
}
	
