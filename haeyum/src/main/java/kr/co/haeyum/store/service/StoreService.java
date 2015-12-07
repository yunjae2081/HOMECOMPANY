package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.store.vo.BuyVO;
import kr.co.haeyum.store.vo.CategoryVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.SellVO;
import kr.co.haeyum.store.vo.SideListVO;
import kr.co.haeyum.store.vo.StoreListVO;

public interface StoreService {

	public ProductVO selectStoreDetail(int no);

	public List<ProductImgVO> selectStoreImg(int no);

	public LectureVO selectLecture(int no);

	public CategoryVO selectCategory(int no);

	// 탑메뉴 스토어 진입
	public List<StoreListVO> selectStoreList() throws Exception;

	// 최신순 진입
	public List<StoreListVO> selectLatestList() throws Exception;

	// 인기순 진입
	public List<StoreListVO> selectBestList() throws Exception;

	// 인기순 무한 스크롤
	public List<StoreListVO> selectBestExtend(int no) throws Exception;

	// 최신순 무한 스크롤
	public List<StoreListVO> selectListExtend(int no) throws Exception;

	public List<SideListVO> selectSideList(int no);

	public void insertBuy(BuyVO bVO) throws Exception;

	public void insertSell(SellVO sVO) throws Exception;


}
