package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.vo.VideoBestListVO;
import kr.co.haeyum.search.vo.VideoLatestListVO;

public interface VideoSideService {

	List<VideoBestListVO> selectBestList(int category) throws Exception;

	List<VideoBestListVO> selectBestExtend(int category, int no) throws Exception;

	List<VideoLatestListVO> selectLatestList(int category) throws Exception;

	List<VideoLatestListVO> selectLatestExtend(int category, int no) throws Exception;

}
