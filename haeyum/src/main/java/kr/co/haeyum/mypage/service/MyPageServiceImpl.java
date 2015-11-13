package kr.co.haeyum.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.mypage.dao.MypageDAO;

@Service
public class MyPageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO dao;

	@Override
	public List<LectureVO> selectlectureList(int no) throws Exception {
		List<LectureVO> list =dao.selectlectureList(no);
		return list;
	}




	
	
}
