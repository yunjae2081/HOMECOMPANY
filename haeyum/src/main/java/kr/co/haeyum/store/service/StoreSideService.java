package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.vo.StoreListVO;

public interface StoreSideService {

	List<StoreListVO> selectBestList(int category) throws Exception;

	List<StoreListVO> selectBestExtend(int category, int no) throws Exception;

	List<StoreListVO> selectLatestList(int category) throws Exception;

	List<StoreListVO> selectLatestExtend(int category, int no) throws Exception;

}
