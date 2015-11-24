package kr.co.haeyum.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.video.vo.WatchVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate session;


	public String selectPass(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectPass", id);
		
	}
	public void updatePass(MemberVO member)throws Exception {
		session.update("kr.co.mypage.updatePass",member);
	}

	//lecture 
	public List<LectureVO> selectlectureList(SearchVO param)throws Exception {
		return session.selectList("kr.co.mypage.selectlectureList",param);
	}
	
	public int selectlectureCount(String id)throws Exception {
		return session.selectOne("kr.co.mypage.selectlectureCount", id);
	}	
	//////////
	
	//판매
	public List<ProductVO> selectProductList(SearchVO param)throws Exception {
		return session.selectList("kr.co.mypage.selectProductList",param);
	}
	
	public int selectProductCount(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectProductCount",id);
	}
	
	//즐겨찾기
	public List<WatchVO> selectFavoriteList(SearchVO param)throws Exception{
		return session.selectList("kr.co.mypage.selectFavoriteList",param);
	}
	public int selectFavoriteCount(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectFavoriteCount",id);
	}
	/////////////
	







	

	

}
