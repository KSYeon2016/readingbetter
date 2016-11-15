package kr.ac.readingbetter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.ScoresVo;

/**
 * 랭킹 카테고리
 */
@Controller
@RequestMapping("/ranking")
public class RankingController {

	@Autowired
	private ScoresService scoresService;

	// 요약 페이지 및 랭킹 출력
	@RequestMapping("/summary")
	public String summary(ScoresVo vo, Model model, HttpSession session) {
		
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 전체 랭킹
		List<ScoresVo> monthlyRank = scoresService.monthlyRank(vo);
		model.addAttribute("monthlyRank", monthlyRank);

		// 학교 랭킹
		List<ScoresVo> monthlySchool = scoresService.schoolRank(vo);
		model.addAttribute("monthlySchool", monthlySchool);
		
		// 로그인 한 회원의 학교 랭킹
		if (authUser != null) {// 로그인을 했을 때
			String id = authUser.getId(); // 로그인 한 회원의 아이디를 받아옴
			if (id != null) { // 학교 번호가 null이 아닐 경우에만 vo에 랭킹 정보 삽입
				vo = scoresService.mySchoolRank(id);
				model.addAttribute("mySchoolRank", vo);
			}
		}

		// 학년 랭킹 (로그인 한 회원의 학년 랭킹)
		if (authUser != null) { // 로그인을 했을 경우에만 vo에 랭킹 삽입
			String id = authUser.getId();
			List<ScoresVo> monthlyMyGrade = scoresService.monthlyMyGrade(id);
			model.addAttribute("monthlyMyGrade", monthlyMyGrade);
		}
		// 명예의 전당
		List<ScoresVo> honor = scoresService.honor(vo);
		model.addAttribute("honor", honor);
		return "ranking/summary";
	}

	// 전체 랭킹 페이지
	@RequestMapping("/monthlytotal")
	public String monthlyTotal(ScoresVo vo, Model model, HttpSession session) {

		// 전체 랭킹
		List<ScoresVo> monthlyRank = scoresService.monthlyRank(vo);
		model.addAttribute("monthlyRank", monthlyRank);

		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 로그인 한 회원 전체 랭킹
		if (authUser != null) { // 로그인을 했을 경우에만 vo에 회원 랭킹 삽입
			Long no = authUser.getNo();
			vo = scoresService.mymonthlyRank(no);
			model.addAttribute("myMonthlyRank", vo);
		}
		return "ranking/monthlytotal";
	}

	// 학년별 랭킹 페이지
	@RequestMapping("/monthlygrade")
	public String monthlyGrade(ScoresVo vo, Model model, HttpSession session,
			@RequestParam(value = "grade") Integer grade) { // get 방식으로 학년정보 전송

		// 학년별 랭킹
		List<ScoresVo> monthlyGrade = scoresService.monthlyGrade(grade);
		model.addAttribute("monthlygrade", monthlyGrade);

		// 로그인 한 회원의 학년 내 랭킹
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		if (authUser != null) {
			String id = authUser.getId();
			vo = scoresService.monthlyMyGradeRank(id);
			model.addAttribute("monthlyMyGradeRank", vo);
		}
		return "ranking/monthlygrade";
	}

	// 학교별 랭킹 페이지
	@RequestMapping("/monthlyschool")
	public String monthlySchool(ScoresVo vo, Model model, HttpSession session) {

		// 학교 랭킹
		List<ScoresVo> monthlySchool = scoresService.schoolRank(vo);
		model.addAttribute("monthlySchool", monthlySchool);

		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 로그인 한 회원의 학교 랭킹
		if (authUser != null) {// 로그인을 했을 때
			String id = authUser.getId(); // 로그인 한 회원의 아이디를 받아옴
			if (id != null) { // 학교 번호가 null이 아닐 경우에만 vo에 랭킹 정보 삽입
				vo = scoresService.mySchoolRank(id);
				model.addAttribute("mySchoolRank", vo);
			}
		}
		return "ranking/monthlyschool";
	}

	// 명예의 전당
	@RequestMapping("/honor")
	public String honor(ScoresVo vo, Model model, HttpSession session) {

		// 명예의 전당 Top 10 (테이블)
		List<ScoresVo> honor = scoresService.honor(vo);
		model.addAttribute("honor", honor);

		// 명예의 전당 Top 3 (그래프)
		List<ScoresVo> totalTopRanker = scoresService.totalTopRanker(vo);
		model.addAttribute("totalTopRanker", totalTopRanker);

		MemberVo authUser = (MemberVo) session.getAttribute("authUser");

		// 로그인 한 회원 명예의 전당 랭킹
		if (authUser != null) { // 로그인을 했을 경우에만 vo에 회원 랭킹 삽입
			Long no = authUser.getNo();
			vo = scoresService.myTotalRank(no);
			model.addAttribute("myTotalRank", vo);
		}
		
		return "ranking/honor";
	}
}