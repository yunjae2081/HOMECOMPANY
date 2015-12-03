package kr.co.haeyum.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.board.vo.BoardCommentVO;
import kr.co.haeyum.board.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertBoard(BoardVO bVO) throws Exception{
		
		sqlSession.insert("kr.co.board.insertBoard", bVO);
	}

	public Map<String, Object> selectLastPage(Map<String, Object> param) throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("count", sqlSession.selectOne("kr.co.board.selectLastPage", param));
		result.put("bList", sqlSession.selectList("kr.co.board.selectbList", param));
		
		return result;
	}

	public void insertComment(BoardCommentVO cVO) throws Exception {
		sqlSession.insert("kr.co.board.insertComment", cVO);
	}

	public List<BoardCommentVO> selectCommentList(int bNo) throws Exception{
		return sqlSession.selectList("kr.co.board.selectCommentList", bNo);
	}

}
