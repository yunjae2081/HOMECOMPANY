package kr.co.haeyum.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.store.dao.StoreDAO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.StoreListVO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO dao;

	@Override
	public ProductVO selectStoreDetail(int no) {
		return dao.selectStoreDetail(no);
	}

	@Override
	public List<ProductImgVO> selectStoreImg(int no) {
		return dao.selectStoreImg(no);
	}

	@Override
	public String selectLectureName(int no) {
		return dao.selectLectureName(no);
	}

	@Override
	public String selectCategoryName(int no) {
		return dao.selectCategoryName(no);
	}

	@Override
	public List<StoreListVO> selectStoreList() throws Exception {
		return dao.selectStoreList();
	}

	@Override
	public List<StoreListVO> selectLatestList() throws Exception {
		return dao.selectLatestList();
	}

	@Override
	public List<StoreListVO> selectBestList() throws Exception {
		return dao.selectStoreList();
	}
	
	

}
