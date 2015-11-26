package kr.co.haeyum.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

@Repository
public class VideoSideDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<VideoBestListVO> selectBestList(int category) {
		return sqlSession.selectList("videosidevo.dao.VideoListDAO.selectBestList", category);
	}

	public List<VideoBestListVO> selectBestExtend(int category, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("category", category);
		param.put("no", no);
		return sqlSession.selectList("videosidevo.dao.VideoListDAO.selectBestExtend", param);
	}

	public List<VideoLatestListVO> selectLatestList(int category) {
		return sqlSession.selectList("videosidevo.dao.VideoListDAO.selectLatestList", category);
	}

	public List<VideoLatestListVO> selectLatestExtend(int category, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("category", category);
		param.put("no", no);
		return sqlSession.selectList("videosidevo.dao.VideoListDAO.selectLatestExtend", param);
	}

}
