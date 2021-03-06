package kr.co.haeyum.lecture.service;

import java.util.List;

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

public interface LectureService {

	public int insertLecture(LectureVO lVO) throws Exception;

	public void insertfNode(FnodeVO fVO) throws Exception;

	public void insertsNode(SnodeVO sVO) throws Exception;

	public void inserttNode(TnodeVO tVO) throws Exception;

	public void insertLink(TlinkVO linkVO) throws Exception;

	public void insertFile(TfileVO fileVO) throws Exception;

	public List<FnodeVO> selectfNode(int lNo) throws Exception;

	public List<SnodeVO> selectsNode(int lNo) throws Exception;

	public List<TnodeVO> selecttNode(int lNo) throws Exception;

	public List<TlinkVO> selecttLink(int lNo) throws Exception;

	public List<TfileVO> selecttFile(int lNo) throws Exception;

	public LectureVO selectLecture(int lNo) throws Exception;
	
	public int insertVideo(VideoVO videoVO) throws Exception;
	
	public void insertLesson(LessonVO lessonVO) throws Exception;
	
	public int insertItem(ProductVO itemVO) throws Exception;
	
	public void insertItemImg(ProductImgVO iImgVO) throws Exception;
	
	public VideoVO selectVideo(int sNo) throws Exception;

	public List<LessonVO> selectLessonList(int vNo) throws Exception;
	
	public List<ProductVO> selectProductList(int vNo) throws Exception;
	
	public ProductImgVO selectProductImg (int pNo) throws Exception;

	public WatchListVO selectWatchList(WatchListVO watch) throws Exception;
	
	public int insertWatchList(WatchListVO watch) throws Exception;
	
	public void updateVideoHit(int vNo) throws Exception;
	
	public List<BMarkVO> selectBMarkList(int wNo) throws Exception;
	
	public void insertBMark(BMarkVO bmark) throws Exception;
	
	public void insertFavVideo(FavoriteVO fav) throws Exception;
	
	public void deleteFavVideo(FavoriteVO fav) throws Exception;
	
	public int selectFavCheck(FavoriteVO fav) throws Exception;
}
