package kr.co.haeyum.lecture.service;

import java.util.List;

import kr.co.haeyum.lecture.vo.FnodeVO;
import kr.co.haeyum.lecture.vo.LectureVO;
import kr.co.haeyum.lecture.vo.SnodeVO;
import kr.co.haeyum.lecture.vo.TfileVO;
import kr.co.haeyum.lecture.vo.TlinkVO;
import kr.co.haeyum.lecture.vo.TnodeVO;

public interface LectureService {

	public int insertLecture(LectureVO lVO) throws Exception;

	public void insertfNode(FnodeVO fVO) throws Exception;

	public void insertsNode(SnodeVO sVO) throws Exception;

	public void inserttNode(TnodeVO tVO) throws Exception;

	public void insertLink(TlinkVO linkVO) throws Exception;

	public void insertFile(TfileVO fileVO) throws Exception;

	public List<FnodeVO> selectfNode(int lNo) throws Exception;

	public List<SnodeVO> selectsNode(int lNo) throws Exception;

	public List<TnodeVO> selecttNode(int lNo) throws Exception;

	public List<TlinkVO> selecttLink(int lNo) throws Exception;

	public List<TfileVO> selecttFile(int lNo) throws Exception;

	public LectureVO selectLecture(int lNo) throws Exception;

}
