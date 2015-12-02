package kr.co.haeyum.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.main.dao.MainDAO;
import kr.co.haeyum.main.vo.MainVO;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO dao;
	
	@Override
	public MainVO mainClist(int i) throws Exception {
		MainVO cMainVO = dao.mainClist(i);
		return cMainVO;
	}
	
	public MainVO mainVlist(int i) throws Exception {
		MainVO vMainVO = dao.mainVlist(i);
		return vMainVO;
	}

	@Override
	public List<VideoBestListVO> selectPopular() {
		return dao.selectPopular();
	}

	@Override
	public List<VideoLatestListVO> selectLetest() {
		return dao.selectLetest();
	}

}
