package kr.co.haeyum.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.board.dao.BoardDAO;
import kr.co.haeyum.board.vo.BoardCommentVO;
import kr.co.haeyum.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;

	@Override
	public void insertBoard(BoardVO bVO) throws Exception {
		dao.insertBoard(bVO);
	}

	@Override
	public Map<String, Object> selectLastPage(Map<String, Object> param) throws Exception {
		return dao.selectLastPage(param);
	}

	@Override
	public void insertComment(BoardCommentVO cVO) throws Exception {
		dao.insertComment(cVO);
	}

	@Override
	public List<BoardCommentVO> selectCommentList(int bNo) throws Exception {
		return dao.selectCommentList(bNo);
	}

	@Override
	public void deleteBoard(int bNo) throws Exception {
		dao.deleteBoard(bNo);
	}

	@Override
	public void deleteComment(int cNo) throws Exception {	
		dao.deleteComment(cNo);
	}
}
