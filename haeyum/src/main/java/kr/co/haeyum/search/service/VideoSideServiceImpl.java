package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.dao.VideoSideDAO;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoSideServiceImpl implements VideoSideService{
	
	@Autowired
	private VideoSideDAO dao;

	@Override
	public List<VideoBestListVO> selectBestList(int category) throws Exception {
		return dao.selectBestList(category);
	}

	@Override
	public List<VideoBestListVO> selectBestExtend(int category, int no)	throws Exception {
		return dao.selectBestExtend(category, no);
	}

	@Override
	public List<VideoLatestListVO> selectLatestList(int category) throws Exception {
		return dao.selectLatestList(category);
	}

	@Override
	public List<VideoLatestListVO> selectLatestExtend(int category, int no)	throws Exception {
		return dao.selectLatestExtend(category, no);
	}

}
