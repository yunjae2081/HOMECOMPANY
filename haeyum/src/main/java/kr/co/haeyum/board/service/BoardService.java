package kr.co.haeyum.board.service;

import java.util.List;
import java.util.Map;

import kr.co.haeyum.board.vo.BoardCommentVO;
import kr.co.haeyum.board.vo.BoardVO;

public interface BoardService {

	public void insertBoard(BoardVO bVO) throws Exception;

	public Map<String, Object> selectLastPage(Map<String, Object> param) throws Exception;

	public void insertComment(BoardCommentVO cVO) throws Exception;

	public List<BoardCommentVO> selectCommentList(int bNo) throws Exception;

}
