package kr.co.haeyum.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.search.dao.VideoListDAO;
import kr.co.haeyum.search.vo.VideoListVO;

@Service
public class VideoListServiceImpl implements VideoListService{
	
	@Autowired
	private VideoListDAO dao;

	@Override
	public List<VideoListVO> selectVideoNo() throws Exception {
		return dao.selectVideoNo();
	}

	@Override
	public List<VideoListVO> selectVideoExtend(int no) throws Exception {
		return dao.selectVideoExtend(no);
	}

}
