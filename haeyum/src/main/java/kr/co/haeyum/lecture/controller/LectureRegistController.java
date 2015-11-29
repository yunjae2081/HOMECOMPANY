package kr.co.haeyum.lecture.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.haeyum.lecture.service.LectureService;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.LessonVO;
import kr.co.haeyum.lecture.vo.NodeIndexVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.lecture.vo.VideoVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;

@Controller
@RequestMapping("/lecture")
public class LectureRegistController {

	@Autowired
	private LectureService service;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/regist.do")
	public String regist(HttpSession session,  MultipartHttpServletRequest req, NodeIndexVO nodeVO, LectureVO lVO) throws Exception {

		int lNo = service.insertLecture(lVO);
		int vNo = 0;
		int lCount = 0;
		int iCount = 0;

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
			// 수정이는 수정수정
			
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
				videoFile.transferTo(new File("C:\\java73\\web-workspace\\haeyum\\src\\main\\webapp\\video/" + saveFileName));

				String imgURL = req.getParameter("v_capture_test1"+ i);
				byte decode[] = Base64.decodeBase64(imgURL.substring(22));
				FileOutputStream fo;
				String saveImgName = "haeyum-" + UUID.randomUUID().toString() + ".jpg";
				File mainImg = new File("C:\\java73\\web-workspace\\haeyum\\src\\main\\webapp\\mainImg/"+saveImgName);
				mainImg.createNewFile();
				fo = new FileOutputStream(mainImg);
				fo.write(decode);
				fo.close();
				
				VideoVO videoVO = new VideoVO();
				videoVO.setlNo(lNo);
				videoVO.setsName("sNode"+i);
				videoVO.setOrgFileName(orgFileName);
				videoVO.setRealFileName(saveFileName);
				videoVO.setiOrgFileName("vMainImage"+lNo+".jpg");
				videoVO.setiRealFileName(saveImgName);
				vNo = service.insertVideo(videoVO);
				
			}
			
			//lesson
			for(int j = 0; j < Integer.parseInt(req.getParameter("totalLCount"+i)); j++){
				if(Integer.parseInt(req.getParameter("lesson-sNum"+ ++lCount)) == i){
					System.out.println("lesson등록 : " + lCount);
					String lesson = req.getParameter("lesson-lText"+ lCount);
					String playTime = req.getParameter("lesson-lPlayTime" + lCount);
					String stayTime = req.getParameter("lesson-lSTime" + lCount);
					req.getParameter("lesson-lLeft"+ lCount).indexOf(".");
					String left = req.getParameter("lesson-lLeft"+ lCount);
					int leftIndex = left.indexOf(".");
					if(leftIndex != -1){
						left = left.substring(0, leftIndex);
					}
					
					String top = req.getParameter("lesson-lTop" + lCount);
					int topIndex = top.indexOf(".");
					if(topIndex != -1) {
						top = top.substring(0, topIndex);
					}

					String color = req.getParameter("lesson-lColor" + lCount);
					LessonVO lessonVO = new LessonVO();
					lessonVO.setvNo(vNo);
					lessonVO.setPlLesson(lesson);
					lessonVO.setPlPlayTime(Integer.parseInt(playTime));
					lessonVO.setPlStayTime(Integer.parseInt(stayTime));
					lessonVO.setPlX(Integer.parseInt(left));
					lessonVO.setPlY(Integer.parseInt(top));
					lessonVO.setPlColor(color);
					service.insertLesson(lessonVO);
					
					
				}else {
					--lCount;
					break;
				}
			}
			
			//item
			for(int j = 0; j < Integer.parseInt(req.getParameter("totalICount"+i)); j++){
				if(Integer.parseInt(req.getParameter("item-sNum" + ++iCount)) == i){
					System.out.println("lessonImg등록 : " + iCount);
					String name = req.getParameter("item-iTitle" + iCount);
					String content = req.getParameter("item-iContent" + iCount);
					int price = Integer.parseInt(req.getParameter("item-iPrice" + iCount));
					int count = Integer.parseInt(req.getParameter("item-iNumber" + iCount));
					
					ProductVO productVO = new ProductVO();
					productVO.setlNo(lNo);
					productVO.setvNo(vNo);
					productVO.setpId(((MemberVO)session.getAttribute("user")).getId());
					productVO.setpName(name);
					productVO.setpContent(content);
					productVO.setpPrice(price);
					productVO.setpCount(count);
					int pNo = service.insertItem(productVO);
					
					for(int k = 1; k <= 4; k++){
						MultipartFile itemFile = req.getFile("sNum"+i+"iCount"+iCount+"imgCount"+k);
						if(itemFile != null) {
							String itemOrgFileName = itemFile.getOriginalFilename();
							
							if(itemOrgFileName != null && !itemOrgFileName.equals("")){
								String ext = "";
								
								int index = itemOrgFileName.lastIndexOf(".");
								if(index != -1){
									ext = itemOrgFileName.substring(index);
								}
								
								String itemSaveFileName = "haeyum-" + UUID.randomUUID().toString() + ext;
								itemFile.transferTo(new File("C:\\java73\\web-workspace\\haeyum\\src\\main\\webapp\\itemImg/" + itemSaveFileName));
								
								ProductImgVO imgVO = new ProductImgVO();
								imgVO.setpNo(pNo);
								imgVO.setOrgFileName(itemOrgFileName);
								imgVO.setRealFileName(itemSaveFileName);
								//제품등록후 제품 번호를 받아와서 처리해줌.
								
								service.insertItemImg(imgVO);
							}
						} else {
							--iCount;
							break;
						}
					}
					
					
				}
			}
			
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
	
