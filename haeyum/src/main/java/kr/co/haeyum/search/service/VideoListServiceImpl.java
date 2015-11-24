package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.dao.VideoListDAO;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoListServiceImpl implements VideoListService{
	
	@Autowired
	private VideoListDAO dao;

	@Override
	public List<VideoBestListVO> selectBestExtend(int no) throws Exception {
		return dao.selectBestExtend(no);
	}

	@Override
	public List<VideoBestListVO> selectBestList() throws Exception {
		return dao.selectBestList();
	}

	@Override
	public List<VideoLatestListVO> selectLatestList() throws Exception {
		return dao.selectLatestList();
	}

	@Override
	public List<VideoLatestListVO> selectLatestExtend(int no) throws Exception {
		return dao.selectLatestExtend(no);
	}
}
