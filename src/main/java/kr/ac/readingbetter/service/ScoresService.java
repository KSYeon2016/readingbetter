package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.DaysDao;
import kr.ac.readingbetter.dao.ScoresDao;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.ScoresVo;

@Service
public class ScoresService {

	@Autowired
	private ScoresDao scoresDao;

	@Autowired
	private DaysDao daysDao;
	
	// 전체 랭킹
	public List<ScoresVo> monthlyRank(ScoresVo vo) {
		return scoresDao.monthlyRank(vo);
	}

	// 로그인 한 회원의 전체 랭킹
	public ScoresVo mymonthlyRank(Long no) {
		return scoresDao.mymonthlyRank(no);
	}

	// 학교 랭킹
	public List<ScoresVo> schoolRank(ScoresVo vo) {
		return scoresDao.schoolRank(vo);
	}

	// 로그인 한 회원의 학교 랭킹
	public ScoresVo mySchoolRank(String id) {
		return scoresDao.mySchoolRank(id);
	}

	// 명예의 전당
	public List<ScoresVo> honor(ScoresVo vo) {
		return scoresDao.honor(vo);
	}

	// 로그인 한 회원의 명예의 전당
	public ScoresVo myTotalRank(Long no) {
		return scoresDao.myTotalRank(no);
	}

	// 명예의 전당 Top 3
	public List<ScoresVo> totalTopRanker(ScoresVo vo) {
		return scoresDao.totalTopRanker(vo);
	}

	public void updateScores(HistoryVo vo) {
		scoresDao.updateScores(vo);
	}

	public ScoresVo selectScores(Long no) {
		ScoresVo vo = scoresDao.selectScores(no);
		return vo;
	}

	public void insertScores(Long no) {
		scoresDao.insertScores(no);
	}

	public List<ScoresVo> monthlyGrade(Integer grade) {
		return scoresDao.monthlyGrade(grade);
	}

	// 메인화면에 한 달 랭킹 상위 5명 출력
	public List<ScoresVo> monthlyMainRank(ScoresVo vo) {
		return scoresDao.monthlyMainRank(vo);
	}

	// 메인화면에 명예의 전당 랭킹 상위 5명 출력
	public List<ScoresVo> mainHonor(ScoresVo vo) {
		return scoresDao.mainHonor(vo);
	}

	// 로그인 한 회원의 학년 점수 랭킹
	public List<ScoresVo> monthlyMyGrade(String id) {
		return scoresDao.monthlyMyGrade(id);
	}

	public ScoresVo monthlyMyGradeRank(String id) {
		return scoresDao.monthlyMyGradeRank(id);
	}

	// 상점
	public void scoreUpdate(ScoresVo vo) {
		scoresDao.scoreUpdate(vo);
	}

	// 메인화면에 명예의 전당 랭킹 상위 5명 출력
	public List<ScoresVo> mainSchool(ScoresVo vo) {
		return scoresDao.mainSchool(vo);
	}

	public List<ScoresVo> mainGrade(String id) {
		return scoresDao.mainGrade(id);
	}
	
	// 로그인 후 내 점수 정보 출력
	public ScoresVo myScores(Long no) {
		return scoresDao.myScores(no);
	}
	
	//랭킹 초기화
	public void MonthReset(ScoresVo vo){
		Integer result = daysDao.selectMonth();
		
		if(result != null){
			scoresDao.MonthUpdate(vo);
		}
	}
}