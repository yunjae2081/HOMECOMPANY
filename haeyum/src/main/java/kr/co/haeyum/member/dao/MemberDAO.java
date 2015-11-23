package kr.co.haeyum.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.haeyum.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	public int selectlogin(MemberVO member)throws Exception {
			return session.selectOne("kr.co.member.selectlogin",member);
	}

	public void insertJoin(MemberVO member)throws Exception {
			 session.insert("kr.co.member.insertJoin",member);
	}

}
