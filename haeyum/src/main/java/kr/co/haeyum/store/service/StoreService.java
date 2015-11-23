package kr.co.haeyum.store.service;

import java.util.List;

import kr.co.haeyum.store.vo.ProductVO;

public interface StoreService {

	List<ProductVO> selectProductNo();

	List<ProductVO> selectProductExtend(int no);

}
