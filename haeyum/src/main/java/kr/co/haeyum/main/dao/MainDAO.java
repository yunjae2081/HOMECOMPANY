package kr.co.haeyum.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.main.vo.MainVO;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public MainVO mainClist(int i) {
		return session.selectOne("kr.co.main.selectMainCurriCount", i);
	}
	
	public MainVO mainVlist(int i) {
		return session.selectOne("kr.co.main.selectMainVideoCount", i);
	}

	public List<VideoBestListVO> selectPopular() {
		return session.selectList("kr.co.main.selectPopular");
	}

	public List<VideoLatestListVO> selectLetest() {
		return session.selectList("kr.co.main.selectLetest");
	}

}
