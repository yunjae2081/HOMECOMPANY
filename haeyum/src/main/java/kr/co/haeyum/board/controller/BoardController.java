package kr.co.haeyum.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.haeyum.board.service.BoardService;
import kr.co.haeyum.board.vo.BoardCommentVO;
import kr.co.haeyum.board.vo.BoardVO;
import kr.co.haeyum.board.vo.PageIndexVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String, Object> boardList(int lNo, @RequestParam(value="reqPage", defaultValue="1") int reqPage) throws Exception {
		Map<String, Object> data= new HashMap<>();
		Map<String, Object> param = new HashMap<>();
		param.put("lNo", lNo);
		param.put("pIndex", (reqPage-1)*5);
		Map<String, Object> result = service.selectLastPage(param);
		int count = (int) result.get("count");
		PageIndexVO pVO = new PageIndexVO(reqPage, count);
		
		data.put("pageVO", pVO);
		data.put("bList", result.get("bList"));
		return data; 
	}
	
	@RequestMapping("/registBoard.json")
	@ResponseBody
	public String boardList(BoardVO bVO) throws Exception{
		
		service.insertBoard(bVO);
		
		return "등록되었습니다.";
	}
	
	@RequestMapping("/registComment.json")
	@ResponseBody
	public List<BoardCommentVO> registComment(BoardCommentVO cVO) throws Exception{
		
		service.insertComment(cVO);
		
		return service.selectCommentList(cVO.getbNo());
	}
	
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<BoardCommentVO> commentList(int bNo) throws Exception{
		
		return service.selectCommentList(bNo);
	}
	
	@RequestMapping("/deleteBoard.json")
	@ResponseBody
	public void deleteBoard(int bNo) throws Exception {
		
		service.deleteBoard(bNo);
	}
	
	@RequestMapping("/deleteComment.json")
	@ResponseBody
	public List<BoardCommentVO> deleteComment(int cNo, int bNo) throws Exception {
		
		service.deleteComment(cNo);
		
		return service.selectCommentList(bNo);
	}
}
