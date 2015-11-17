package kr.co.haeyum.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.search.vo.VideoListVO;

@Repository
public class VideoListDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<VideoListVO> selectVideoNo() {
		return sqlSession.selectList("videolistvo.dao.VideoListDAO.selectNo");
	}

	public List<VideoListVO> selectVideoExtend(int no) {
		return sqlSession.selectList("videolistvo.dao.VideoListDAO.selectExtend", no);
	}

}
