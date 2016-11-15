package kr.ac.readingbetter.controller.app;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.readingbetter.service.AccusationService;
import kr.ac.readingbetter.service.BookService;
import kr.ac.readingbetter.service.ReviewService;
import kr.ac.readingbetter.vo.AccusationVo;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.ReviewVo;

/**
 * 앱 독서활동
 */
@Controller
@RequestMapping("/bookapp")
public class AppBookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private AccusationService accusationService;
	
	// 책 리스트
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public List<BookVo> List(BookVo bookvo) {
		List<BookVo> list = bookService.getList();
		return list;
	}

	// 리뷰 보기
	@ResponseBody
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public List<ReviewVo> Review(Long bookNo, ReviewVo reviewVo) {
		reviewVo.setBookNo(bookNo);
		List<ReviewVo> list = reviewService.getListApp(reviewVo);
		return list;
	}

	// 리뷰 쓰기
	@ResponseBody
	@RequestMapping(value = "insertreview", method = RequestMethod.GET)
	public void InsertReview(
			Long bookNo, 
			String review, 
			Long memberNo, 
			@ModelAttribute ReviewVo vo) {
		vo.setBookNo(bookNo);
		vo.setReview(review);
		vo.setMemberNo(memberNo);
		reviewService.insert(vo);
	}

	// 리뷰 신고하기
	@ResponseBody
	@RequestMapping(value = "insertReviewAccusation", method = RequestMethod.GET)
	public void insertReviewAccusation(
			AccusationVo vo, 
			String reason, 
			Long memberNo, 
			Long keyNo) {
		vo.setReason(reason.replace("_", " "));
		vo.setMemberNo(memberNo);
		vo.setKeyNo(keyNo);
		vo.setIdentity(1L);
		accusationService.insert(vo);
		ReviewVo reviewVo = reviewService.getByNo(vo.getKeyNo());
		reviewService.updateState(reviewVo.getNo());
	}
}