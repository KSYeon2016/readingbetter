package kr.ac.readingbetter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.readingbetter.service.AdminQuizService;
import kr.ac.readingbetter.service.BookService;
import kr.ac.readingbetter.service.HistoryService;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.QuizVo;

@Controller
@RequestMapping("/admin")
public class AdminQuizController {
	
	@Autowired
	private AdminQuizService adminQuizService;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private ScoresService scoresService;
	
	@Autowired
	private HistoryService historyService;
	
	String preAccept = null; // 선택한 퀴즈의 변경 전 승인여부
	
	// 퀴즈 리스트
	@RequestMapping(value = "/quizlist", method = RequestMethod.GET)
	public String quizList(Model model) {
		List<QuizVo> list = adminQuizService.getList();
		model.addAttribute("list", list);
		return "admin/quizlist";
	}
	
	// 퀴즈 상세보기
	@RequestMapping(value = "/quizview/{no}", method = RequestMethod.GET)
	public String quizView(@PathVariable("no") Long no, Model model) {
		QuizVo vo = adminQuizService.quizView(no);
		preAccept = vo.getAccept();	// 수정 전 퀴즈의 승인 상태
		
		model.addAttribute("vo", vo);
		
		return "admin/quizview";
	}
	
	// 퀴즈 업데이트
	@RequestMapping(value = "/quizUpdate", method = RequestMethod.POST)
	public String quizUpdate(@ModelAttribute QuizVo vo) {
		adminQuizService.quizUpdate(vo);
		String afterAccept = vo.getAccept();

		if (preAccept != afterAccept) { // accept의 값이 달라졌을 경우
			if (afterAccept.equals("1")) { // accept가 승인 값이 되었을 경우
				// 퀴즈 승인 시 캔디 지급
				scoresService.pointUpdate(vo.getMemberNo());

				// 퀴즈 승인 시 캔디 지급 히스토리에 기록
				HistoryVo hvo = new HistoryVo();
				BookVo bookVo = bookService.getByNo(vo.getBookNo()); // 책 제목 불러오기
				hvo.setTitle(bookVo.getTitle());
				hvo.setMemberNo(vo.getMemberNo());
				hvo.setIdentity(2);
				hvo.setKeyNo(vo.getBookNo());
				hvo.setPoint(1);
				hvo.setScore(0);
				historyService.insertHistory(hvo);
			}
		}
		
		return "redirect:/admin/quizlist";
	}
	
	// 퀴즈에 책 추가
	@RequestMapping(value = "/quizaddbook", method = RequestMethod.GET)
	public String quizAddBook(Model model) {
		List<BookVo> bookList = bookService.getList();
		model.addAttribute("bookList", bookList);
		
		return "admin/quizaddbook";
	}

	// 퀴즈 폼 불러오기
	@RequestMapping(value = "/quizaddform/{no}", method = RequestMethod.GET)
	public String quizAddForm(@PathVariable("no") Long no, Model model) {
		BookVo bookVo = bookService.getByNo(no);
		model.addAttribute("bookVo", bookVo);
		
		return "admin/quizaddform";
	}
	
	// 퀴즈 추가
	@RequestMapping(value = "/quizadd", method = RequestMethod.POST)
	public String quizAddAdmin(@ModelAttribute QuizVo vo, HttpSession session) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		vo.setMemberNo(authUser.getNo());
		adminQuizService.quizAdd(vo);
		
		return "redirect:/admin/quizlist";
	}
}