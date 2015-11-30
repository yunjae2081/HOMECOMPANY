package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.dao.StoreSideDAO;
import kr.co.haeyum.store.vo.StoreListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreSideServiceImpl implements StoreSideService{

	@Autowired
	private StoreSideDAO dao;
	
	@Override
	public List<StoreListVO> selectBestList(int category) throws Exception {
		return dao.selectBestList(category);
	}

	@Override
	public List<StoreListVO> selectBestExtend(int category, int no)	throws Exception {
		return dao.selectBestExtend(category, no);
	}

	@Override
	public List<StoreListVO> selectLatestList(int category) throws Exception {
		return dao.selectLatestList(category);
	}

	@Override
	public List<StoreListVO> selectLatestExtend(int category, int no) throws Exception {
		return dao.selectLatestExtend(category, no);
	}

}
