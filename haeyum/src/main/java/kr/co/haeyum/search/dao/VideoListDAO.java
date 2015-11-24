package kr.co.haeyum.search.dao;

import java.util.List;

import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoListDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<VideoBestListVO> selectBestExtend(int no) {
		return sqlSession.selectList("videolistvo.dao.VideoListDAO.selectBestExtend", no);
	}

	public List<VideoBestListVO> selectBestList() {
		return sqlSession.selectList("videolistvo.dao.VideoListDAO.selectBestList");
	}

	public List<VideoLatestListVO> selectLatestList() {
		return sqlSession.selectList("videolistvo.dao.VideoListDAO.selectLatestList");
	}

	public List<VideoLatestListVO> selectLatestExtend(int no) {
		return sqlSession.selectList("videolistvo.dao.VideoListDAO.selectLatestExtend", no);
	}

}
