package kr.co.haeyum.lecture.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.LessonVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.lecture.vo.VideoVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;

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

	public void insertLink(TlinkVO linkVO) throws Exception{
		sqlSession.insert("kr.co.lecture.insertLink", linkVO);
	}

	public void insertFile(TfileVO fileVO) throws Exception{
		sqlSession.insert("kr.co.lecture.insertFile", fileVO);
	}

	public List<FnodeVO> selectfNode(int lNo) throws Exception{
		return sqlSession.selectList("kr.co.lecture.selectfNode", lNo);
	}

	public List<SnodeVO> selectsNode(int lNo) throws Exception{
		return sqlSession.selectList("kr.co.lecture.selectsNode", lNo);
	}

	public List<TnodeVO> selecttNode(int lNo) throws Exception{
		return sqlSession.selectList("kr.co.lecture.selecttNode", lNo);
	}

	public List<TlinkVO> selecttLink(int lNo) throws Exception{
		return sqlSession.selectList("kr.co.lecture.selecttLink", lNo);
	}

	public List<TfileVO> selecttFile(int lNo) throws Exception{
		return sqlSession.selectList("kr.co.lecture.selecttFile", lNo);
	}

	public LectureVO selectLecture(int lNo) throws Exception{
		return sqlSession.selectOne("kr.co.lecture.selectLecture", lNo);
	}
	
	//수정이 부분
	
	public int insertVideo(VideoVO videoVO) throws Exception {
		sqlSession.insert("kr.co.lecture.insertVideo", videoVO);
		return videoVO.getvNo();
	}
	
	public void insertLesson(LessonVO lessonVO) throws Exception {
		sqlSession.insert("kr.co.lecture.insertLesson", lessonVO);
	}
	
	public int insertItem(ProductVO productVO) throws Exception {
		sqlSession.insert("kr.co.lecture.insertItem", productVO);
		return productVO.getpNo();
	}
	
	public void insertItemImg(ProductImgVO iImgVO) throws Exception {
		sqlSession.insert("kr.co.lecture.insertItemImg", iImgVO);
	}
	
	public VideoVO selectVideo(int sNo) throws Exception {
		return sqlSession.selectOne("kr.co.lecture.selectVideo", sNo);
	}
	
	public List<LessonVO> selectLessonList(int vNo) throws Exception {
		return sqlSession.selectList("kr.co.lecture.selectLessonList", vNo);
	}
	
	public List<ProductVO> selectProductList(int vNo) throws Exception {
		return sqlSession.selectList("kr.co.lecture.selectProductList", vNo);
	}
	
	public ProductImgVO selectProductImg (int pNo) throws Exception {
		return sqlSession.selectOne("kr.co.lecture.selectProductImg", pNo);
	}
	
	// 수정이 부분
	
}
