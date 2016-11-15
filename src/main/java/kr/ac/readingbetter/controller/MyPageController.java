package kr.ac.readingbetter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.readingbetter.service.HistoryService;
import kr.ac.readingbetter.service.MemberService;
import kr.ac.readingbetter.service.MypageService;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.vo.CertificationVo;
import kr.ac.readingbetter.vo.GifticonVo;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.ScoresVo;

/**
 * 나의 정보 카테고리
 */
@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private ScoresService scoresService;

	@Autowired
	private MypageService mypageService;

	@Autowired
	private HistoryService historyService;

	/*
	 * 내 정보
	 */
	// 회원 정보 화면 열기
	@RequestMapping("/info")
	public String Info(HttpSession session, Model model) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 세션 정보가 없으면 로그인 화면으로 간다
		if (authUser == null) {
			return "redirect:/member/loginform";
		}

		MemberVo memberVo = mypageService.selectMyinfo(authUser.getNo());
		ScoresVo scoresVo = scoresService.selectScores(authUser.getNo());
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("scoresVo", scoresVo);
		return "mypage/info";
	}

	// 회원 정보 수정 화면 열기
	@RequestMapping("/modifyform")
	public String ModifyForm(HttpSession session, Model model) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 세션 정보가 없으면 로그인 화면으로 간다
		if (authUser == null) {
			return "redirect:/member/loginform";
		}

		MemberVo vo = mypageService.selectMyinfo(authUser.getNo());
		model.addAttribute("vo", vo);
		return "mypage/modifyform";
	}

	// 내 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MemberVo vo, HttpSession session) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		vo.setMemberNo(authUser.getNo());
		mypageService.updateMember(vo);
		return "redirect:/mypage/info";
	}

	// 학교 찾기
	@RequestMapping("/findform")
	public String FindForm() {
		return "mypage/findform";
	}

	/*
	 * 내 활동
	 */
	// 히스토리 화면 열기
	@RequestMapping("/history")
	public String History(HttpSession session, Model model, HistoryVo historyvo, CertificationVo certificationvo) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 세션 정보가 없으면 로그인 화면으로 간다
		if (authUser == null) {
			return "redirect:/member/loginform";
		}

		MemberVo memberVo = memberService.selectMyinfo(authUser.getNo());
		ScoresVo scoresVo = scoresService.selectScores(authUser.getNo());

		model.addAttribute("memberVo", memberVo);
		model.addAttribute("scoresVo", scoresVo);

		historyvo.setMemberNo(authUser.getNo());

		if (historyvo.getPageNo() == null) {
			historyvo.setPageNo(1);
		}
		List<HistoryVo> list = historyService.getList(historyvo);
		List<HistoryVo> listpage = historyService.getListPage(historyvo);
		
		// 페이징
		int pageLength = 5;
		int beginPage;
		int currentBlock = (int) Math.ceil((double) historyvo.getPageNo() / pageLength);

		int currentPage = historyvo.getPageNo();
		beginPage = (currentBlock - 1) * 5 + 1;

		int total = (int) Math.ceil((double) list.size() / pageLength);
		int endPage = currentBlock * 5;
		if (endPage > total) {
			endPage = total;
		}
		
		Integer count = historyService.countHistory(authUser.getNo());
		
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);
		model.addAttribute("pageLength", pageLength);

		model.addAttribute("historylist", listpage);
		model.addAttribute("countList", count);

		return "mypage/history";
	}

	/*
	 * 기프티콘
	 */
	@RequestMapping("/gifticon")
	public String Gifticon(HttpSession session, GifticonVo vo, Model model) {
		
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		vo.setMemberNo(authUser.getNo());
		List<GifticonVo> list = mypageService.ListId(vo);
		List<GifticonVo> listpage = mypageService.ListPage(vo);

		int pageLength = 5;
		int beginPage;
		int currentBlock = (int) Math.ceil((double) vo.getPageNo() / pageLength);

		int currentPage = vo.getPageNo();
		beginPage = (currentBlock - 1) * 5 + 1;

		int total = (int) Math.ceil((double) list.size() / pageLength);
		int endPage = currentBlock * 5;
		if (endPage > total) {
			endPage = total;
		}

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);
		model.addAttribute("list", listpage);
		
		return "mypage/gifticon";
		
	}
	
}