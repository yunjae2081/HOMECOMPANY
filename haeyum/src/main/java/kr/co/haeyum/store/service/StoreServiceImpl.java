package kr.co.haeyum.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.store.dao.StoreDAO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO dao;

	@Override
	public List<ProductVO> selectBestList() {
		return dao.selectBestList();
	}

	@Override
	public List<ProductVO> selectBestExtend(int no) {
		return dao.selectBestExtend(no);
	}

	@Override
	public List<ProductVO> selectLatestList() {
		return dao.selectLatestList();
	}

	@Override
	public List<ProductVO> selectLatestExtend(int no) {
		return dao.selectLatestList(no);
	}

	@Override
	public ProductVO selectStoreDetail(int no) {
		return dao.selectStoreDetail(no);
	}

	@Override
	public List<ProductImgVO> selectStoreImg(int no) {
		return dao.selectStoreImg(no);
	}
	
	

}
