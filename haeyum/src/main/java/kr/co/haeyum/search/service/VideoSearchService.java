package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

public interface VideoSearchService {
	List<VideoBestListVO> selectBestList(String title) throws Exception;

	List<VideoBestListVO> selectBestExtend(String title, int no) throws Exception;

	List<VideoLatestListVO> selectLatestList(String title) throws Exception;

	List<VideoLatestListVO> selectLatestExtend(String title, int no) throws Exception;
	
}
