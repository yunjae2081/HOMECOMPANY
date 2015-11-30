package kr.co.haeyum.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.store.dao.StoreSearchDAO;
import kr.co.haeyum.store.vo.StoreListVO;


@Service
public class StoreSearchServiceImpl implements StoreSearchService{
	
	@Autowired
	private StoreSearchDAO dao;

	@Override
	public List<StoreListVO> selectBestList(String title) throws Exception {
		return dao.selectBestList(title);
	}

	@Override
	public List<StoreListVO> selectBestExtend(String title, int no) throws Exception {
		return dao.selectBestExtend(title, no);
	}

	@Override
	public List<StoreListVO> selectLatestList(String title) throws Exception {
		return dao.selectLatestList(title);
	}

	@Override
	public List<StoreListVO> selectLatestExtend(String title, int no) throws Exception {
		return dao.selectLatestExtend(title, no);
	}

}
