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
public class VideoSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<VideoBestListVO> selectBestList(String title) {
		return sqlSession.selectList("videosearchvo.dao.VideoSearchDAO.selectBestList", title);
	}

	public List<VideoBestListVO> selectBestExtend(String title, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("title", title);
		param.put("no", no);
		
		return sqlSession.selectList("videosearchvo.dao.VideoSearchDAO.selectBestExtend", param);
	}

	public List<VideoLatestListVO> selectLatestList(String title) {
		return sqlSession.selectList("videosearchvo.dao.VideoSearchDAO.selectLatestList", title);
	}

	public List<VideoLatestListVO> selectLatestExtend(String title, int no) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("title", title);
		param.put("no", no);
		
		return sqlSession.selectList("videosearchvo.dao.VideoSearchDAO.selectLatestExtend", param);
	}
}
