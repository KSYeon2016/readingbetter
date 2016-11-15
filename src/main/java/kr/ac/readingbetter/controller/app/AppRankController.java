package kr.ac.readingbetter.controller.app;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.vo.ScoresVo;

/**
 * 앱 랭킹
 */
@Controller
@RequestMapping("/rankapp")
public class AppRankController {

	@Autowired
	private ScoresService scoresService;

	// 한 달 랭킹 상위 5명
	@ResponseBody
	@RequestMapping(value = "monthlyrank", method = RequestMethod.GET)
	public List<ScoresVo> MonthlyRank(ScoresVo vo) {
		List<ScoresVo> monthlyRank = scoresService.monthlyMainRank(vo);
		return monthlyRank;
	}

	// 나의 한 달 랭킹
	@ResponseBody
	@RequestMapping(value = "mymonthlyrank", method = RequestMethod.GET)
	public ScoresVo MyMonthlyRank(Long memberNo, ScoresVo vo) {
		vo = scoresService.mymonthlyRank(memberNo);
		return vo;
	}
	
	// 학교 랭킹 상위 5곳
	@ResponseBody
	@RequestMapping(value = "schoolrank", method = RequestMethod.GET)
	public List<ScoresVo> SchoolRank(ScoresVo vo) {
		List<ScoresVo> schoolRank = scoresService.mainSchool(vo);
		return schoolRank;
	}

	// 나의 학교 랭킹
	@ResponseBody
	@RequestMapping(value = "myschoolrank", method = RequestMethod.GET)
	public ScoresVo MySchoolRank(String id, ScoresVo vo) {
		vo = scoresService.mySchoolRank(id);
		return vo;
	}

	// 명예의 전당 상위 5명
	@ResponseBody
	@RequestMapping(value = "honor", method = RequestMethod.GET)
	public List<ScoresVo> HonorRank(ScoresVo vo) {
		List<ScoresVo> honorRank = scoresService.mainHonor(vo);
		return honorRank;
	}

	// 나의 명예의 전당 랭킹
	@ResponseBody
	@RequestMapping(value = "myhonor", method = RequestMethod.GET)
	public ScoresVo MyHonorRank(Long memberNo, ScoresVo vo) {
		vo = scoresService.myTotalRank(memberNo);
		return vo;
	}
	
}