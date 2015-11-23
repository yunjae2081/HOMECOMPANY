package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.dao.VideoListDAO;
import kr.co.haeyum.search.vo.VideoBestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoSearchServiceImpl implements VideoSearchService{

	@Autowired
	private VideoListDAO dao;

	@Override
	public List<VideoBestListVO> selectNormalList(String title) throws Exception {
		return dao.selectNormalList(title);
	}

}
