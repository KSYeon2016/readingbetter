package kr.ac.readingbetter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.ScoresVo;

@Repository
public class ScoresDao {

	@Autowired
	private SqlSession sqlSession;

	// 전체 랭킹
	public List<ScoresVo> monthlyRank(ScoresVo vo) {
		return sqlSession.selectList("scores.monthlyRank", vo);
	}
	
	//월별 점수 초기화
	public void MonthUpdate(ScoresVo vo) {
		sqlSession.update("scores.updateMonth", vo);
	}

	// 로그인 한 회원 전체 랭킹
	public ScoresVo mymonthlyRank(Long no) {
		return sqlSession.selectOne("scores.myMonthlyRank", no);
	}

	// 로그인 한 회원의 학교 랭킹
	public ScoresVo mySchoolRank(String id) {
		return sqlSession.selectOne("scores.mySchoolRank", id);
	}

	// 명예의 전당
	public List<ScoresVo> honor(ScoresVo vo) {
		return sqlSession.selectList("scores.honor", vo);
	}

	// 로그인 한 회원의 명예의 전당
	public ScoresVo myTotalRank(Long no) {
		return sqlSession.selectOne("scores.myTotalRank", no);
	}

	// 명예의 전당 Top 3
	public List<ScoresVo> totalTopRanker(ScoresVo vo) {
		return sqlSession.selectList("scores.totalTopRanker", vo);
	}

	public List<ScoresVo> schoolRank(ScoresVo vo) {
		return sqlSession.selectList("scores.schoolRank", vo);
	}

	public void updateScores(HistoryVo vo) {
		sqlSession.update("scores.updateScores", vo);
	}

	public ScoresVo selectScores(Long no) {
		ScoresVo vo = sqlSession.selectOne("scores.selectScores", no);
		return vo;
	}

	public void insertScores(Long no) {
		sqlSession.insert("scores.insertScores", no);
	}

	public List<ScoresVo> monthlyGrade(Integer grade) {
		return sqlSession.selectList("scores.monthlygrade", grade);
	}

	public List<ScoresVo> monthlyMainRank(ScoresVo vo) {
		return sqlSession.selectList("scores.monthlyMainRank", vo);
	}

	public List<ScoresVo> mainHonor(ScoresVo vo) {
		return sqlSession.selectList("scores.mainHonor", vo);
	}

	public List<ScoresVo> monthlyMyGrade(String id) {
		return sqlSession.selectList("scores.monthlyMyGrade", id);
	}

	public ScoresVo monthlyMyGradeRank(String id) {
		return sqlSession.selectOne("scores.monthlyMyGradeRank", id);
	}

	// 상점
	public void scoreUpdate(ScoresVo vo) {
		sqlSession.update("scores.updateshop", vo);
	}

	public List<ScoresVo> mainSchool(ScoresVo vo) {
		return sqlSession.selectList("scores.mainSchool");
	}

	public List<ScoresVo> mainGrade(String id) {
		return sqlSession.selectList("scores.mainGrade", id);
	}
	
	// 출석체크
	public void updateAttendBonus(HistoryVo vo){
		sqlSession.update("scores.updateAttendBonus", vo);
	}
	
	public ScoresVo myScores(Long no) {
		return sqlSession.selectOne("myScores", no);
	}
}