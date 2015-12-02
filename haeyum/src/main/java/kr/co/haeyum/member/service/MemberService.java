package kr.co.haeyum.member.service;

import kr.co.haeyum.member.vo.MemberVO;

public interface MemberService {

	//로그인
	public int selectlogin(MemberVO member)throws Exception;

	//회원가입
	public void insertJoin(MemberVO member)throws Exception;

	public String selectName(MemberVO member) throws Exception;

}
