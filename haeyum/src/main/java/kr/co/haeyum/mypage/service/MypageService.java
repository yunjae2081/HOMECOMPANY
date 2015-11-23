package kr.co.haeyum.mypage.service;

import java.util.Map;

import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.SearchVO;

public interface MypageService {

	public String selectPass(String id)throws Exception;
	
	public void updatePass(MemberVO member)throws Exception;
	
	public Map<String, Object> selectlectureList(SearchVO param)throws Exception;

	public Map<String, Object> selectProductList(SearchVO param) throws Exception;

	public Map<String, Object> selectWatchList(SearchVO param2)throws Exception;









	
	

	
	
	

}
