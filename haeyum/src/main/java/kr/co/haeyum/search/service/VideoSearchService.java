package kr.co.haeyum.search.service;

import java.util.List;

import kr.co.haeyum.search.vo.VideoBestListVO;

public interface VideoSearchService {
	List<VideoBestListVO> selectNormalList(String title) throws Exception;
	
}
