package kr.co.haeyum.mypage.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.mypage.dao.MypageDAO;

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
	
	
	@Override
	public Map<String, Object> selectlectureList(SearchVO param) throws Exception {
		Map<String,Object> result = new HashMap<>();
		
		//페이지에 보여질 목록 게시물
		result.put("list", dao.selectlectureList(param));
		//페이징을 위한 전체 게시물 수 
		result.put("count",dao.selectlectureCount(param.getId()));
		return result;
	}
	
	
	@Override
	public Map<String, Object> selectProductList(SearchVO param) throws Exception {
		Map<String,Object> result = new HashMap<>();
		
		result.put("list",dao.selectProductList(param));
		result.put("count", dao.selectProductCount(param.getId()));
		return result;
	}
	@Override
	public Map<String, Object> selectFavoriteList(SearchVO param) throws Exception {
		Map<String,Object> result = new HashMap<>();
		result.put("list", dao.selectFavoriteList(param));
		result.put("count", dao.selectFavoriteCount(param.getId()));
		return result;
	}
	
	
	
	











	
	
}
