package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.DaysDao;
import kr.ac.readingbetter.dao.HistoryDao;
import kr.ac.readingbetter.dao.ScoresDao;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.ScoresVo;

@Service
public class ScoresService {

	@Autowired
	private ScoresDao scoresDao;

	@Autowired
	private DaysDao daysDao;
	
	@Autowired
	private HistoryDao historyDao;
	
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
	public void MonthReset(ScoresVo vo, HistoryVo historyVo){
		Integer result = daysDao.selectMonth();
		if(result != null){
			
			//초기화 되기 전에 포인트 지급	
			Long count1 = scoresDao.pointTop(1L);
			Long count2 = scoresDao.pointTop(2L);
			Long count3 = scoresDao.pointTop(3L);
			System.out.println(count1);
			System.out.println(count2);
			System.out.println(count3);
			for(int i=0;i<count1;i++){
				String top1Id = scoresDao.monthlyRankReset(vo).get(i).getMemberNo().toString();
				Long top1memberNo= Long.parseLong(top1Id);
				vo.setMemberNo(top1memberNo);
				
				String point=scoresDao.monthlyRankReset(vo).get(i).getPoint().toString();
				Integer pointInt=Integer.parseInt(point);
				vo.setPoint(10+pointInt);
				//history에 기록하기
				historyVo.setTitle("이달의 랭킹 1등 보상");
				historyVo.setScore(0);
				historyVo.setPoint(10);
				historyVo.setMemberNo(top1memberNo);
				historyVo.setIdentity(4);
				historyVo.setKeyNo(0L);
				historyDao.insertHistory(historyVo);
				
				//점수 업데이트
				scoresDao.resetPoint(vo);
			}
			if(count1 < 3){
				for(int j = 0; j < count2; j++){
					String top2Id = scoresDao.monthlyRankReset(vo).get((int) (j+count1)).getMemberNo().toString();
					Long top2memberNo= Long.parseLong(top2Id);
					vo.setMemberNo(top2memberNo);
					
					String point=scoresDao.monthlyRankReset(vo).get(j).getPoint().toString();
					Integer pointInt=Integer.parseInt(point);
					vo.setPoint(5 + pointInt);
					
					//history에 기록하기
					historyVo.setTitle("이달의 랭킹 2등 보상");
					historyVo.setScore(0);
					historyVo.setPoint(5);
					historyVo.setMemberNo(top2memberNo);
					historyVo.setIdentity(4);
					historyVo.setKeyNo(0L);
					historyDao.insertHistory(historyVo);
					
					//점수 업데이트
					scoresDao.resetPoint(vo);
				}
			}else if(count1 + count2 < 3){
				for(int k=0; k<count3; k++){
					String top3Id = scoresDao.monthlyRankReset(vo).get((int) (k+count1+count2)).getMemberNo().toString();
					Long top3memberNo = Long.parseLong(top3Id);
					vo.setMemberNo(top3memberNo);
					
					String point = scoresDao.monthlyRankReset(vo).get(k).getPoint().toString();
					Integer pointInt = Integer.parseInt(point);
					vo.setPoint(3 + pointInt);
					
					//history에 기록하기
					historyVo.setTitle("이달의 랭킹 3등 보상");
					historyVo.setScore(0);
					historyVo.setPoint(3);
					historyVo.setMemberNo(top3memberNo);
					historyVo.setIdentity(4);
					historyVo.setKeyNo(0L);
					historyDao.insertHistory(historyVo);
					
					//점수 업데이트
					scoresDao.resetPoint(vo);
				}
			}
			
			//초기화
			scoresDao.MonthUpdate(vo);
		}
	}
	
	public void pointUpdate(Long memberNo) {
		scoresDao.pointUpdate(memberNo);
	}
}