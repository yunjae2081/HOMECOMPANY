package kr.co.haeyum.store.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;

@Repository
public class StoreDAO {

	@Autowired
	private SqlSessionTemplate session;
	// store List 인기순
	public List<ProductVO> selectBestList() {
		return session.selectList("store.dao.StoreDAO.selectBestList");
	}

	// store List 인기순(무한스크롤)
	public List<ProductVO> selectBestExtend(int no) {
		return session.selectList("store.dao.StoreDAO.selectBestExtend",no);
	}

	// store List 최신순
	public List<ProductVO> selectLatestList() {
		return session.selectList("store.dao.StoreDAO.selectLatestList");
	}

	// store List 최신순(무한스크롤)
	public List<ProductVO> selectLatestExtend(int no) {
		return session.selectList("store.dao.StoreDAO.selectLatestExtend",no);
	}

	// store 디테일 상품정보
	public ProductVO selectStoreDetail(int no) {
		return session.selectOne("store.dao.StoreDAO.selectStoreDetail",no);
	}

	// store 디테일 이미지(4장)
	public List<ProductImgVO> selectStoreImg(int no) {
		return session.selectList("store.dao.StoreDAO.selectStoreImg",no);
	}

	// store 디테일 강의명
	public String selectLectureName(int no) {
		return session.selectOne("store.dao.StoreDAO.selectLectureName",no);
	}

	// store 디테일 카테고리명
	public String selectCategoryName(int no) {
		return session.selectOne("store.dao.StoreDAO.selectCategoryName",no);
	}

}
