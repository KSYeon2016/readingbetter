package kr.ac.readingbetter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.readingbetter.service.BookService;
import kr.ac.readingbetter.service.MemberService;
import kr.ac.readingbetter.service.NoticeService;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.NoticeVo;
import kr.ac.readingbetter.vo.ScoresVo;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private ScoresService scoresService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private BookService bookService;
	
	// 메인
	// 메인 화면 열기
	@RequestMapping("")
	public String Main(ScoresVo vo, NoticeVo nvo, Model model, HttpSession session) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		
		// 로그인 후 나의 점수 정보 출력
		if (authUser != null) { // 로그인을 했을 경우에만 vo에 회원 랭킹 삽입
			Long no = authUser.getNo();
			vo = scoresService.myScores(no);
			model.addAttribute("myScores", vo);
			vo = scoresService.mymonthlyRank(no);
			model.addAttribute("myMonthlyRank", vo);
			vo = scoresService.myTotalRank(no);
			model.addAttribute("myTotalRank", vo);
		}
				
		// 메인에 최근 5개의 공지 출력
		List<NoticeVo> listrecent = noticeService.getListRecent(nvo);
		model.addAttribute("listrecent", listrecent);
		
		// 메인에 한 달 랭킹 상위 5명 출력
		List<ScoresVo> monthlyMainRank = scoresService.monthlyMainRank(vo);
		model.addAttribute("monthlyMainRank", monthlyMainRank);

		// 메인에 명예의 전당 랭킹 상위 5명 출력
		List<ScoresVo> mainHonor = scoresService.mainHonor(vo);
		model.addAttribute("mainHonor", mainHonor);

		// 메인에 학교 랭킹 상위 5곳 출력
		List<ScoresVo> mainSchool = scoresService.mainSchool(vo);
		model.addAttribute("mainSchool", mainSchool);
		
		// 메인에 학년 랭킹 상위 5명 출력
		if (authUser != null) { // 로그인을 했을 경우에만 vo에 랭킹 삽입
			String id = authUser.getId();
			List<ScoresVo> mainGrade = scoresService.mainGrade(id);
			model.addAttribute("mainGrade", mainGrade);
			
			// 학년 정보 받아오기
			vo = scoresService.monthlyMyGradeRank(id);
			model.addAttribute("monthlyMyGradeRank", vo);
		}
		
		if(authUser != null){
			int attCount = memberService.selectAttCount(authUser.getNo());
			model.addAttribute("attCount", attCount);
		}
		
		// 오늘의 책 가져오기
		List<BookVo> todayBookList = bookService.todayBook();
		
		model.addAttribute("todayBookList", todayBookList);
		
		return "main/main";
	}
	////////////////////////////////////////////////////////////////////////////
	
	// 네비
	// 네비의 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(@RequestBody MemberVo vo, HttpSession session) {
		
		// login
		MemberVo authUser = memberService.selectAuthUser(vo);

		if (authUser == null) {
			return "member/loginform?error=true";
		}

		// 인증 성공
		session.setAttribute("authUser", authUser);
		
		// scores insert
		ScoresVo scoresVo = scoresService.selectScores(authUser.getNo());

		if (scoresVo == null) {
			scoresService.insertScores(authUser.getNo());
		}
		
		// 출석체크
		int check = memberService.attendAction(authUser.getNo());
		
		// 출석 체크 모달 보기 세션 추가
		// 0이면 새로 출석, 1이면 이미 출석
		session.setAttribute("checkAttend", check);
		
		return "main";
	}
	////////////////////////////////////////////////////////////////////////////
	
	// 헤더
	// 헤더에 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.removeAttribute("checkAttend");
		session.invalidate();

		return "redirect:/main";
	}
	////////////////////////////////////////////////////////////////////////////
	
	// 푸터
	// 푸터의 이용법
	@RequestMapping("/manual")
	public String Manual() {
		return "main/manual";
	}

	// 푸터의 소개
	@RequestMapping("/siteinfo")
	public String SiteInfo() {
		return "main/siteinfo";
	}

	// 푸터의 사이트맵
	@RequestMapping("/sitemap")
	public String SiteMap() {
		return "main/sitemap";
	}
	
	@RequestMapping(value="/removeattend", method=RequestMethod.POST)
	@ResponseBody
	public void removeAttend(HttpSession session){
		session.removeAttribute("checkAttend");
	}
	
	@RequestMapping(value = "/newmain")
	public String newMain(){
		return "main/index";
	}
}