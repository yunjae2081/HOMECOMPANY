package kr.co.haeyum.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.member.dao.MemberDAO;
import kr.co.haeyum.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public int selectlogin(MemberVO member) throws Exception {
		return dao.selectlogin(member);
	}

	
	@Override
	public void insertJoin(MemberVO member) throws Exception {
		  dao.insertJoin(member);
	}


}
