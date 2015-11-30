package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.vo.StoreListVO;

public interface StoreSearchService {

	List<StoreListVO> selectBestList(String title) throws Exception;

	List<StoreListVO> selectBestExtend(String title, int no) throws Exception;

	List<StoreListVO> selectLatestList(String title) throws Exception;

	List<StoreListVO> selectLatestExtend(String title, int no) throws Exception;

}
