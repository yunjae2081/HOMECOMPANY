package kr.co.haeyum.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.mypage.dao.MypageDAO;
import kr.co.haeyum.mypage.vo.myPageVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.video.vo.FavoriteVO;
import kr.co.haeyum.video.vo.WatchVO;

@Service
public class MyPageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO dao;

	

	//비밀번호 변경
	@Override
	public String selectPass(String id) throws Exception {
		return dao.selectPass(id);
	}
	//비밀번호 변경
	@Override
	public void updatePass(MemberVO member) throws Exception {
		dao.updatePass(member);
		
	}
	
	//판매
	@Override
	public List<ProductVO> selectSellList(myPageVO pagevo) throws Exception {
		List<ProductVO> list = dao.selectSellList(pagevo);
		return list;
	}

	@Override
	public int selectLastPage(String id) throws Exception{
		return dao.selectLastPage(id);
		
	}
	
	//구매
	@Override
	public List<ProductVO> selectBuyList(myPageVO pagevo) throws Exception {
		List<ProductVO> list = dao.selectBuyList(pagevo);
		return list;
	}
	
	@Override
	public int selectBuyLastPage(String id) throws Exception{
		return dao.selectBuyLastPage(id);
		
	}
	
	//Lecture
	@Override
	public List<LectureVO> selectLectureList(myPageVO pagevo) throws Exception {
		List<LectureVO> list = dao.selectLectureList(pagevo);
		return list;
	}
	@Override
	public int LectureLastPage(String id) throws Exception {
		return dao.LectureLastPage(id);
	}
	@Override
	public List<WatchVO> selectWatchList(myPageVO pagevo) throws Exception {
		List<WatchVO> list = dao.selectWatchList(pagevo);
		return list;
	}
	@Override
	public int watchLastPage(String id) throws Exception {
		return dao.watchLastPage(id);
	}
	

	//즐겨찾기
	@Override
	public List<FavoriteVO> selectFavoriteList(myPageVO pagevo) throws Exception {
		List<FavoriteVO>  list = dao.selectFavoriteList(pagevo);
		return list;
	}
	@Override
	public int selectFavoriteLastPage(String id) throws Exception {
		return dao.selectFavoriteLastPage(id);
	}
	
	







	
	
}
