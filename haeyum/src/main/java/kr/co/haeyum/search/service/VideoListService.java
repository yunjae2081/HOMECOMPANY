package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.vo.VideoBestListVO;

public interface VideoListService {
	List<VideoBestListVO> selectBestExtend(int no) throws Exception;

	List<VideoBestListVO> selectBestList() throws Exception;

}
