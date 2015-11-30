package kr.co.haeyum.store.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.store.vo.StoreListVO;

@Repository
public class StoreSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<StoreListVO> selectBestList(String title) {
		return sqlSession.selectList("");
	}

}
