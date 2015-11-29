package kr.co.haeyum.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.main.vo.MainVO;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public MainVO mainClist(int i) {
		return null;
//		return session.selectOne("kr.co.main.selectMainCurriCount", i);
	}
	
	public MainVO mainVlist(int i) {
		return null;
//		return session.selectOne("kr.co.main.selectMainVideoCount", i);
	}

}
