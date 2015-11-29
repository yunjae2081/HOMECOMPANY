package kr.co.haeyum.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.member.vo.MemberVO;
import kr.co.haeyum.mypage.common.SearchVO;
import kr.co.haeyum.mypage.vo.myPageVO;
import kr.co.haeyum.store.vo.ProductVO;
import kr.co.haeyum.store.vo.StoreVO;
import kr.co.haeyum.video.vo.WatchVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	//비밀번호
	public String selectPass(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectPass", id);
		
	}
	public void updatePass(MemberVO member)throws Exception {
		session.update("kr.co.mypage.updatePass",member);
	}
	///////////
	
	//즐겨찾기
	public List<WatchVO> selectFavoriteList(SearchVO param)throws Exception{
		return session.selectList("kr.co.mypage.selectFavoriteList",param);
	}
	public int selectFavoriteCount(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectFavoriteCount",id);
	}
	/////////////
	
	//판매
	public List<ProductVO> selectSellList(myPageVO pagevo)throws Exception{
		return session.selectList("kr.co.mypage.selectSellList",pagevo);
	}
	public int selectLastPage(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectLastPage",id);
	}
	//구매
	public List<ProductVO> selectBuyList(myPageVO pagevo)throws Exception{
		return session.selectList("kr.co.mypage.selectBuyList",pagevo);
	}
	public int selectBuyLastPage(String id)throws Exception{
		return session.selectOne("kr.co.mypage.selectBuyLastPage",id);
	}
	
	////////////
	
	//regist Lecture
	public List<LectureVO> selectLectureList(myPageVO pagevo)throws Exception{
		return session.selectList("kr.co.mypage.selectLectureList",pagevo);
	}
	public int LectureLastPage(String id)throws Exception {
		return session.selectOne("kr.co.mypage.LectureLastPage",id);
	}
	
	//studies Lecture
	public List<WatchVO> selectWatchList(myPageVO pagevo)throws Exception {
		return session.selectList("kr.co.mypage.selectWatchList",pagevo);
	}
	public int watchLastPage(String id)throws Exception{
		return session.selectOne("kr.co.mypage.watchLastPage",id);
	}

}
