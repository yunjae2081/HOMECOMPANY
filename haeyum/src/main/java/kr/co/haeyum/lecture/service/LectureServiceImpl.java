package kr.co.haeyum.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.lecture.dao.LectureDAO;
import kr.co.haeyum.lecture.vo.BMarkVO;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.LessonVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;
import kr.co.haeyum.lecture.vo.VideoVO;
import kr.co.haeyum.lecture.vo.WatchListVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.video.vo.FavoriteVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	private LectureDAO dao;

	@Override
	public int insertLecture(LectureVO lVO) throws Exception {
		return dao.insertLecture(lVO);
	}

	@Override
	public void insertfNode(FnodeVO fVO) throws Exception {
		dao.insertfNode(fVO);
	}

	@Override
	public void insertsNode(SnodeVO sVO) throws Exception {
		dao.insertsNode(sVO);
	}

	@Override
	public void inserttNode(TnodeVO tVO) throws Exception {
		dao.inserttNode(tVO);
	}

	@Override
	public void insertLink(TlinkVO linkVO) throws Exception {
		dao.insertLink(linkVO);
	}

	@Override
	public void insertFile(TfileVO fileVO) throws Exception {
		dao.insertFile(fileVO);
	}

	@Override
	public List<FnodeVO> selectfNode(int lNo) throws Exception {
		return dao.selectfNode(lNo);
	}

	@Override
	public List<SnodeVO> selectsNode(int lNo) throws Exception {
		return dao.selectsNode(lNo);
	}

	@Override
	public List<TnodeVO> selecttNode(int lNo) throws Exception {
		return dao.selecttNode(lNo);
	}

	@Override
	public List<TlinkVO> selecttLink(int lNo) throws Exception {
		return dao.selecttLink(lNo);
	}

	@Override
	public List<TfileVO> selecttFile(int lNo) throws Exception {
		return dao.selecttFile(lNo);
	}

	@Override
	public LectureVO selectLecture(int lNo) throws Exception {
		return dao.selectLecture(lNo);
	}
	
	public int insertVideo(VideoVO videoVO) throws Exception {
		return dao.insertVideo(videoVO);
	}
	
	public void insertLesson(LessonVO lessonVO) throws Exception{
		dao.insertLesson(lessonVO);
	}
	
	public int insertItem(ProductVO itemVO) throws Exception{
		return dao.insertItem(itemVO);
	}
	
	public void insertItemImg(ProductImgVO iImgVO) throws Exception {
		dao.insertItemImg(iImgVO);
	}
	
	public VideoVO selectVideo(int sNo) throws Exception {
		return dao.selectVideo(sNo);
	}
	
	public List<LessonVO> selectLessonList(int vNo) throws Exception {
		return dao.selectLessonList(vNo);
	}
	
	public List<ProductVO> selectProductList(int vNo) throws Exception {
		return dao.selectProductList(vNo);
	}
	
	public ProductImgVO selectProductImg (int pNo) throws Exception {
		return dao.selectProductImg(pNo);
	}
	
	public WatchListVO selectWatchList(WatchListVO watch) throws Exception {
		return dao.selectWatchList(watch);
	}
	
	public int insertWatchList(WatchListVO watch) throws Exception {
		return dao.insertWatchList(watch);
	}
	
	public void updateVideoHit(int vNo) throws Exception {
		dao.updateVideoHit(vNo);
	}
	
	public List<BMarkVO> selectBMarkList(int wNo) throws Exception {
		return dao.selectBMarkList(wNo);
	}
	
	public void insertBMark(BMarkVO bmark) throws Exception {
		dao.insertBMark(bmark);
	}
	
	public void insertFavVideo(FavoriteVO fav) throws Exception {
		dao.insertFavVideo(fav);
	}
	
	public void deleteFavVideo(FavoriteVO fav) throws Exception {
		dao.deleteFavVideo(fav);
	}
	
	public int selectFavCheck(FavoriteVO fav) throws Exception {
		 return dao.selectFavCheck(fav);
	}

}
