package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.vo.StoreListVO;

public interface StoreSearchService {

	List<StoreListVO> selectBestList(String title) throws Exception;

}
