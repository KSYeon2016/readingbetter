package kr.ac.readingbetter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.readingbetter.vo.HistoryVo;

@Repository
public class HistoryDao {
	@Autowired
	private SqlSession sqlSession;

	public void insertHistory(HistoryVo vo) {
		sqlSession.insert("history.insertHistory", vo);
	}

	public List<HistoryVo> getList(HistoryVo vo) {
		List<HistoryVo> list = sqlSession.selectList("history.list", vo);
		return list;
	}
	
	// 페이징 리스트
	public List<HistoryVo> getListPage(HistoryVo vo) {
		List<HistoryVo> list = sqlSession.selectList("history.listpage", vo);
		return list;
	}
	
	public void insertAttBonus(HistoryVo vo){
		sqlSession.insert("history.insertAttBonus", vo);
	}
	
	public Integer countHistory(Long no){
		Integer count = sqlSession.selectOne("history.countHistory", no);
		return count;
	}
}