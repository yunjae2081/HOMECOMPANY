package kr.co.haeyum.store.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.haeyum.store.vo.StoreListVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreSideDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<StoreListVO> selectBestList(int category) {
		return sqlSession.selectList("storeSide.dao.StoreDAO.selectStoreSearchList", category);
	}

	public List<StoreListVO> selectBestExtend(int category, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		
		System.out.println("아 씨발!!!!");
		System.out.println("category" + category);
		System.out.println("no" + no);
		
		param.put("category", category);
		param.put("no", no);
		return sqlSession.selectList("storeSide.dao.StoreDAO.selectStoreSearchExtend", param);
	}

	public List<StoreListVO> selectLatestList(int category) {
		return sqlSession.selectList("storeSide.dao.StoreDAO.selectLatestList", category);
	}

	public List<StoreListVO> selectLatestExtend(int category, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("category", category);
		param.put("no", no);
		return sqlSession.selectList("storeSide.dao.StoreDAO.selectLatestExtend", param);
	}

}
