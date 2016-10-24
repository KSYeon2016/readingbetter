package kr.ac.readingbetter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.readingbetter.vo.AccusationVo;

@Repository
public class AccusationDao {

	@Autowired
	private SqlSession sqlSession;

	public List<AccusationVo> getList() {
		List<AccusationVo> list = sqlSession.selectList("accusation.list");
		return list;
	}

	public AccusationVo getByNo(Long no) {
		AccusationVo vo = sqlSession.selectOne("accusation.getByNo", no);
		return vo;
	}

	public void update(AccusationVo vo) {
		sqlSession.update("accusation.update", vo);
	}

	public void insert(AccusationVo vo) {
		sqlSession.insert("accusation.insert", vo);
	}
	
	public Long selectIdentity(Long no){
		Long identity = sqlSession.selectOne("accusation.selectIdentity", no);
		return identity;
	}
	
	public AccusationVo getAccusationViewFromReview(Long no){
		AccusationVo vo = sqlSession.selectOne("accusation.getAccusationViewFromReview", no);
		return vo;
	}
	
	public AccusationVo getAccusationViewFromComments(Long no){
		AccusationVo vo = sqlSession.selectOne("accusation.getAccusationViewFromComments", no);
		return vo;
	}
	
	public AccusationVo getAccusationViewFromQuiz(Long no){
		AccusationVo vo = sqlSession.selectOne("accusation.getAccusationViewFromQuiz", no);
		return vo;
	}
	
	public void updateAccept(AccusationVo vo){
		sqlSession.update("accusation.updateAccept", vo);
	}
}