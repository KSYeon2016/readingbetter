package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.ReviewDao;
import kr.ac.readingbetter.vo.ReviewVo;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewDao;

	public List<ReviewVo> getList(ReviewVo vo) {
		List<ReviewVo> list = reviewDao.getList(vo);
		return list;
	}

	public List<ReviewVo> getListApp(ReviewVo vo) {
		List<ReviewVo> list = reviewDao.getListApp(vo);
		return list;
	}

	public void reviewDelete(Long no) {
		reviewDao.reviewDelete(no);
	}

	public void insert(ReviewVo vo) {
		reviewDao.insert(vo);
	}

	public ReviewVo getByNo(Long no) {
		ReviewVo adminReview = reviewDao.getByNo(no);
		return adminReview;
	}
	
	public void updateState(Long no) {
		reviewDao.updateState(no);
	}
	
	public Integer listCount(Long no) {
		int count = reviewDao.listCount(no);
		return count;
	}
}