package kr.co.haeyum.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.lecture.vo.LectureVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<LectureVO> selectlectureList(int no) {
		return session.selectList("kr.co.mypage.selectlectureList",no);
	}

	

	

}
