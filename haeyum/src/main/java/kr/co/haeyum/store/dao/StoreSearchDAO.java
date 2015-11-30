package kr.co.haeyum.store.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.store.vo.StoreListVO;

@Repository
public class StoreSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<StoreListVO> selectBestList(String title) {
		return sqlSession.selectList("storeSearch.dao.StoreDAO.selectStoreSearchList", title);
	}

	public List<StoreListVO> selectBestExtend(String title, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("title", title);
		param.put("no", no);
		
		return sqlSession.selectList("storeSearch.dao.StoreDAO.selectStoreSearchExtend", param);
	}

	public List<StoreListVO> selectLatestList(String title) {
		return sqlSession.selectList("storeSearch.dao.StoreDAO.selectLatestList", title);
	}

	public List<StoreListVO> selectLatestExtend(String title, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("title", title);
		param.put("no", no);
		
		return sqlSession.selectList("storeSearch.dao.StoreDAO.selectLatestExtend", param);
	}

}
