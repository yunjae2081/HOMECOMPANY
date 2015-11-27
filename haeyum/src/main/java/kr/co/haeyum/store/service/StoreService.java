package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.StoreListVO;

public interface StoreService {

	public List<ProductVO> selectBestList();

	public List<ProductVO> selectBestExtend(int no);

	public List<ProductVO> selectLatestList();

	public List<ProductVO> selectLatestExtend(int no);

	public ProductVO selectStoreDetail(int no);

	public List<ProductImgVO> selectStoreImg(int no);

	public String selectLectureName(int no);

	public String selectCategoryName(int no);

	public List<StoreListVO> selectStoreList() throws Exception;


}
