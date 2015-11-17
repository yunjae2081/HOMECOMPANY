package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.vo.VideoListVO;

public interface VideoListService {

	List<VideoListVO> selectVideoNo() throws Exception;

	List<VideoListVO> selectVideoExtend(int no) throws Exception;

}
