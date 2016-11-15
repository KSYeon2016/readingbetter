package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AccusationDao;
import kr.ac.readingbetter.dao.CommentsDao;
import kr.ac.readingbetter.dao.MemberDao;
import kr.ac.readingbetter.dao.QuizDao;
import kr.ac.readingbetter.dao.ReviewDao;
import kr.ac.readingbetter.vo.AccusationVo;
import kr.ac.readingbetter.vo.QuizVo;

@Service
public class AdminAccusationService {
	
	@Autowired
	private AccusationDao accusationDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	@Autowired
	private QuizDao quizDao;
	
	public List<AccusationVo> getList() {
		List<AccusationVo> list = accusationDao.getList();
		return list;
	}

	public AccusationVo getAccusation(Long no) {
		AccusationVo adminAccusation = accusationDao.getByNo(no);
		return adminAccusation;
	}
	
	public AccusationVo getByNo(Long no) {
		AccusationVo adminAccusation = accusationDao.getByNo(no);
		return adminAccusation;
	}
	
	// 신고 내용 보기
	public AccusationVo getAccuView(Long no) {
		AccusationVo vo = new AccusationVo();
		Long identity = accusationDao.selectIdentity(no);

		if (identity == 0) {
			vo = accusationDao.getAccusationViewFromQuiz(no);
		}
		else if (identity == 1) {
			vo = accusationDao.getAccusationViewFromReview(no);
		} else {
			vo = accusationDao.getAccusationViewFromComments(no);
		}

		return vo;
	}
	
	// 신고 승인, 반려, 패널티 시 동작
	public void updateAccept(AccusationVo vo) {
		if (vo.getAccept().equals("1")) { // 신고 승인
			accusationDao.updateAccept(vo);
			memberDao.updatePenalty(vo); // 신고받은 회원에게 패널티
		} else if (vo.getAccept().equals("2")) { // 신고 반려
			accusationDao.update(vo);

			if (vo.getIdentity() == 0) {
				QuizVo quizvo = new QuizVo();
				quizvo.setAccept("1");
				quizvo.setNo(vo.getKeyNo());
				quizDao.updateQuizAccept(quizvo);
			} else if (vo.getIdentity() == 1) {
				reviewDao.updateStateToZero(vo);
			} else {
				commentsDao.updateStateToZero(vo);
			}

		} else if (vo.getAccept().equals("3")) { // 부당신고에 의한 패널티
			vo.setAccuTarget(vo.getId()); // 페널티 대상을 신고자로 변경
			vo.setAccept("2"); // 상태를 반려로 변경
			accusationDao.update(vo);
			memberDao.updatePenalty(vo);

			if (vo.getIdentity() == 1) {
				reviewDao.updateStateToZero(vo);
			} else {
				commentsDao.updateStateToZero(vo);
			}
		}
	}
}
