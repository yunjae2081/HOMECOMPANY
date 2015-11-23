package kr.co.haeyum.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.haeyum.lecture.dao.LectureDAO;
import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	private LectureDAO dao;

	@Override
	public int insertLecture(LectureVO lVO) throws Exception {
		return dao.insertLecture(lVO);
	}

	@Override
	public void insertfNode(FnodeVO fVO) throws Exception {
		dao.insertfNode(fVO);
	}

	@Override
	public void insertsNode(SnodeVO sVO) throws Exception {
		dao.insertsNode(sVO);
	}

	@Override
	public void inserttNode(TnodeVO tVO) throws Exception {
		dao.inserttNode(tVO);
	}

	@Override
	public void insertLink(TlinkVO linkVO) throws Exception {
		dao.insertLink(linkVO);
	}

	@Override
	public void insertFile(TfileVO fileVO) throws Exception {
		dao.insertFile(fileVO);
	}

}
