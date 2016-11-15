package kr.ac.readingbetter.controller.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.ac.readingbetter.service.MemberService;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.ScoresVo;

/**
 * 앱 사용자 활동
 */
@Controller
@RequestMapping("/memberapp")

public class AppMemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ScoresService scoresService;

	// 회원가입
	@ResponseBody
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public MemberVo historyapp(String id, String pw, MemberVo vo, HistoryVo histroyVo, ScoresVo scoresVo) {
		vo.setId(id);
		vo.setPw(pw);
		MemberVo authUser = memberService.selectAuthUser(vo);

		// 0이면 초기화됨, 1이면 초기화안됨
		int check = memberService.checkreset();
		if (check == 0) {
			// 랭킹 월 초기화
			scoresService.MonthReset(scoresVo, histroyVo);
		}
		
		// 출석체크
		int checkAttend = memberService.attendAction(authUser.getNo());
		authUser.setCheck(checkAttend);

		// 누적 출석일 가져오기
		if (authUser != null) {
			int attCount = memberService.selectAttCount(authUser.getNo());
			authUser.setAttCount(attCount);
		}
		
		return authUser;
	}
	
	// 로그인
	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinApp(MemberVo memberVo, String name, String id, String pw, String email, String tel) {
		memberVo.setGrade(0);
		memberVo.setClassNo(0);
		memberVo.setSchoolName("기타");
		memberVo.setName(name);
		memberVo.setId(id);
		memberVo.setPw(pw);
		memberVo.setEmail(email);
		memberVo.setTel(tel);
		memberService.insertMember(memberVo);
	}

	// 회원가입시 아이디 체크
	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	@ResponseBody
	public MemberVo checkId(String id) {
		MemberVo vo = memberService.checkId(id);
		
		return vo;
	}

	// 회원가입시 이메일 체크
	@RequestMapping(value = "/checkemail", method = RequestMethod.GET)
	@ResponseBody
	public MemberVo checkEmail(String email) {
		MemberVo vo = memberService.checkEmail(email);
		
		return vo;
	}
}