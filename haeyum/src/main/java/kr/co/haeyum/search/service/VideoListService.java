package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

public interface VideoListService {
	List<VideoBestListVO> selectBestExtend(int no) throws Exception;

	List<VideoBestListVO> selectBestList() throws Exception;

	List<VideoLatestListVO> selectLatestList() throws Exception;

	List<VideoLatestListVO> selectLatestExtend(int no) throws Exception;

}
