package kr.co.haeyum.store.dao;

import java.util.List;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.store.vo.CategoryVO;
import kr.co.haeyum.store.vo.ProductImgVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.SideListVO;
import kr.co.haeyum.store.vo.StoreListVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO {

	@Autowired
	private SqlSessionTemplate session;

	// store 디테일 상품정보
	public ProductVO selectStoreDetail(int no) {
		return session.selectOne("store.dao.StoreDAO.selectStoreDetail",no);
	}

	// store 디테일 이미지(4장)
	   public List<ProductImgVO> selectStoreImg(int no) {
	      return session.selectList("store.dao.StoreDAO.selectStoreImg",no);
	   }

	   // store 디테일 강의명
	   public LectureVO selectLecture(int no) {
	      return session.selectOne("store.dao.StoreDAO.selectLecture",no);
	   }

	   // store 디테일 카테고리명
	   public CategoryVO selectCategory(int no) {
	      return session.selectOne("store.dao.StoreDAO.selectCategory",no);
	   }

	// store 버튼을 누르고 리스트
	public List<StoreListVO> selectStoreList() {
		return session.selectList("store.dao.StoreDAO.selectStoreList");
	}

	// 최신순 진입
	public List<StoreListVO> selectLatestList() {
		return session.selectList("store.dao.StoreDAO.selectLatestList");
	}

	// 인기순 무한 스크롤
	public List<StoreListVO> selectStoreExtend(int no) {
		return session.selectList("store.dao.StoreDAO.selectStoreExtend", no);
	}

	// 최신순 무한 스크롤
	public List<StoreListVO> selectLatestExtend(int no) {
		return session.selectList("store.dao.StoreDAO.selectListExtend", no);
	}
	
	// store 디테일 사이드 강의 다른 상품
	   public List<SideListVO> selectSideList(int no) {
	      return session.selectList("store.dao.StoreDAO.selectSideList",no);
	   }

}
