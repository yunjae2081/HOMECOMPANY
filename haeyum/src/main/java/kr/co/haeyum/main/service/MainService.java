package kr.co.haeyum.main.service;

import java.util.List;

import kr.co.haeyum.main.vo.MainVO;
import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

public interface MainService {

	public MainVO mainClist(int i) throws Exception;
	public MainVO mainVlist(int i) throws Exception;
	public List<VideoBestListVO> selectPopular();
	public List<VideoLatestListVO> selectLetest();

}
