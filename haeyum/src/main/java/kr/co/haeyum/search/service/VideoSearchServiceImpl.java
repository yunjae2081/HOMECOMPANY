package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.dao.VideoSearchDAO;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoSearchServiceImpl implements VideoSearchService{

	@Autowired
	private VideoSearchDAO dao;

	@Override
	public List<VideoBestListVO> selectBestList(String title) throws Exception {
		return dao.selectBestList(title);
	}

	@Override
	public List<VideoBestListVO> selectBestExtend(String title, int no) throws Exception{
		return dao.selectBestExtend(title, no);
	}

	@Override
	public List<VideoLatestListVO> selectLatestList(String title) throws Exception {
		return dao.selectLatestList(title);
	}

	@Override
	public List<VideoLatestListVO> selectLatestExtend(String title, int no)	throws Exception {
		return dao.selectLatestExtend(title, no);
	}

}
