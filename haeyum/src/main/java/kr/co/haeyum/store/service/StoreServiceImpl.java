package kr.co.haeyum.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.store.dao.StoreDAO;
import kr.co.haeyum.store.vo.CategoryVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.SideListVO;
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
	public LectureVO selectLecture(int no) {
		return dao.selectLecture(no);
	}

	@Override
	public CategoryVO selectCategory(int no) {
		return dao.selectCategory(no);
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

	@Override
	public List<StoreListVO> selectBestExtend(int no) throws Exception {
		return dao.selectStoreExtend(no);
	}

	@Override
	public List<StoreListVO> selectListExtend(int no) throws Exception {
		return dao.selectLatestExtend(no);
	}

	@Override
	public List<SideListVO> selectSideList(int no) {
		return dao.selectSideList(no);
	}
	
}
