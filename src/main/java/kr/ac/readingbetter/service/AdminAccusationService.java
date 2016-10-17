package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AccusationDao;
import kr.ac.readingbetter.dao.CommentsDao;
import kr.ac.readingbetter.dao.MemberDao;
import kr.ac.readingbetter.dao.ReviewDao;
import kr.ac.readingbetter.vo.AccusationVo;

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
	
	public AccusationVo getAccuView(Long no){
		AccusationVo vo;
		
		Long identity = accusationDao.selectIdentity(no);
		
		if (identity == 1) {
			vo = accusationDao.getAccusationViewFromReview(no);
		} else {
			vo = accusationDao.getAccusationViewFromComments(no);
		}
		
		return vo;
	}
	
	public void updateAccept(AccusationVo vo){		
		if(vo.getAccept().equals("1")){
			accusationDao.updateAccept(vo);
			memberDao.updatePenalty(vo);
		} else if (vo.getAccept().equals("2")){
			accusationDao.update(vo);
			
			if(vo.getIdentity() == 1){
				reviewDao.updateStateToZero(vo);
			} else {
				commentsDao.updateStateToZero(vo);
			}
		} else if (vo.getAccept().equals("3")){
			vo.setAccuTarget(vo.getId());	// 페널티 대상을 신고자로 변경
			vo.setAccept("2");				// 상태를 반려로 변경
			accusationDao.update(vo);
			memberDao.updatePenalty(vo);
			
			if(vo.getIdentity() == 1){
				reviewDao.updateStateToZero(vo);
			} else {
				commentsDao.updateStateToZero(vo);
			}
		}
	}
}
