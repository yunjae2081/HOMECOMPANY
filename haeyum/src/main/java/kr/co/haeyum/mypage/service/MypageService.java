package kr.co.haeyum.mypage.service;

import java.util.List;
import java.util.Map;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.mypage.vo.myPageVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.video.vo.FavoriteVO;
import kr.co.haeyum.video.vo.WatchVO;

public interface MypageService {

	//비밀번호 변경
	public String selectPass(String id)throws Exception;
	
	public void updatePass(MemberVO member)throws Exception;
	

	//Store
	public List<ProductVO> selectSellList(myPageVO pagevo)throws Exception;

	public int selectLastPage(String id)throws Exception;

	public List<ProductVO> selectBuyList(myPageVO pagevo)throws Exception;

	public int selectBuyLastPage(String id)throws Exception;


	//Lecture
	public List<LectureVO> selectLectureList(myPageVO pagevo)throws Exception;

	public int LectureLastPage(String id)throws Exception;

	public List<WatchVO> selectWatchList(myPageVO pagevo)throws Exception;

	public int watchLastPage(String id)throws Exception;

	
	//즐겨찾기
	public List<FavoriteVO> selectFavoriteList(myPageVO pagevo)throws Exception;

	public int selectFavoriteLastPage(String id)throws Exception;





	
	

	













	
	

	
	
	

}
