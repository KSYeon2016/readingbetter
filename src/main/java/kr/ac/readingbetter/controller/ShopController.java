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

import kr.ac.readingbetter.service.HistoryService;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.service.ShopService;
import kr.ac.readingbetter.vo.GifticonVo;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.ScoresVo;
import kr.ac.readingbetter.vo.ShopVo;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private ScoresService scoresService;

	@Autowired
	private HistoryService historyService;

	// 상점 화면 열기
	@RequestMapping("/shop")
	public String goodsList(HttpSession session, Model model, ShopVo vo, ScoresVo scoresVo) {
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		// 세션 정보가 없으면 로그인 화면으로 간다
		if (authUser == null) {
			return "redirect:/member/loginform";
		}

		if (vo.getTitle() == null) { // 검색할 상품명이 없으면 빈 문자열로 교체
			vo.setTitle("");
		}

		List<ShopVo> getGoodsList = shopService.getList(vo);
		scoresVo = scoresService.selectScores(authUser.getNo());
		model.addAttribute("getGoodsList", getGoodsList);
		model.addAttribute("scoresVo", scoresVo);
		return "shop/shop";
	}

	// 구입 확인 모달
	@ResponseBody
	@RequestMapping(value = "readAjax", method = RequestMethod.POST)
	public ShopVo readBoardAjax(Long no) {
		ShopVo shopvo = shopService.getByNo(no);
		return shopvo;
	}

	// 구입 차감 모달
	@ResponseBody
	@RequestMapping(value = "/shop/buy", method = RequestMethod.POST)
	public ScoresVo shopbuy(HttpSession session, GifticonVo gifticonVo, HistoryVo historyVo, @RequestBody ShopVo vo)
			throws Exception {
		// 로그인 정보로 scores 호출
		MemberVo authUser = (MemberVo) session.getAttribute("authUser");
		ScoresVo scoresVo = scoresService.selectScores(authUser.getNo());

		// scores update
		int point = scoresVo.getPoint();
		point = point - vo.getPrice();
		scoresVo.setPoint(point);
		scoresVo.setMemberNo(authUser.getNo());
		scoresService.scoreUpdate(scoresVo);

		// 이메일로 기프티콘 전송
		shopService.sendEmail(authUser, vo);

		// history insert
		historyVo.setTitle(vo.getTitle());
		historyVo.setScore(0);
		historyVo.setPoint(vo.getPrice());
		historyVo.setMemberNo(authUser.getNo());
		historyVo.setIdentity(1);
		historyVo.setKeyNo(vo.getNo());
		historyService.insertHistory(historyVo);

		gifticonVo.setMemberNo(authUser.getNo());
		gifticonVo.setCover(
				"http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/barcode/barcode" + vo.getNo() + ".jpg");
		gifticonVo.setTitle(vo.getTitle());
		shopService.gifticonInsert(gifticonVo);

		return scoresVo;
	}
}