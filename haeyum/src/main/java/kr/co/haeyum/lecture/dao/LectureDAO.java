package kr.co.haeyum.lecture.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;

@Repository
public class LectureDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertLecture(LectureVO lVO) throws Exception{
		sqlSession.insert("kr.co.lecture.insertLecutre", lVO);
		return lVO.getlNo();
	}

	public void insertfNode(FnodeVO fVO) throws Exception {
		sqlSession.insert("kr.co.lecture.insertfNode", fVO);
	}

	public void insertsNode(SnodeVO sVO) throws Exception{
		sqlSession.insert("kr.co.lecture.insertsNode", sVO);
	}

	public void inserttNode(TnodeVO tVO) throws Exception{
		sqlSession.insert("kr.co.lecture.inserttNode", tVO);
	}

	public void insertLink(TlinkVO linkVO) {
		sqlSession.insert("kr.co.lecture.insertLink", linkVO);
	}

	public void insertFile(TfileVO fileVO) {
		sqlSession.insert("kr.co.lecture.insertFile", fileVO);
	}
	
}
