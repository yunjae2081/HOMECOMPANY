package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.StoreListVO;

public interface StoreService {

	public ProductVO selectStoreDetail(int no);

	public List<ProductImgVO> selectStoreImg(int no);

	public String selectLectureName(int no);

	public String selectCategoryName(int no);

	// 탑메뉴 스토어 진입
	public List<StoreListVO> selectStoreList() throws Exception;

	// 최신순 진입
	public List<StoreListVO> selectLatestList() throws Exception;

	// 인기순 진입
	public List<StoreListVO> selectBestList() throws Exception;


}
