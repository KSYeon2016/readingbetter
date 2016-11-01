package kr.ac.readingbetter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.readingbetter.service.AdminAccusationService;
import kr.ac.readingbetter.service.AdminBookService;
import kr.ac.readingbetter.service.AdminQuizService;
import kr.ac.readingbetter.service.AuthorService;
import kr.ac.readingbetter.service.BookService;
import kr.ac.readingbetter.service.CardService;
import kr.ac.readingbetter.service.HistoryService;
import kr.ac.readingbetter.service.MemberService;
import kr.ac.readingbetter.service.NoticeService;
import kr.ac.readingbetter.service.PublisherService;
import kr.ac.readingbetter.service.SchoolService;
import kr.ac.readingbetter.service.ScoresService;
import kr.ac.readingbetter.service.ShopService;
import kr.ac.readingbetter.service.WishbookService;
import kr.ac.readingbetter.vo.AccusationVo;
import kr.ac.readingbetter.vo.AuthorVo;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.CardVo;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.NoticeVo;
import kr.ac.readingbetter.vo.PublisherVo;
import kr.ac.readingbetter.vo.QuizVo;
import kr.ac.readingbetter.vo.SchoolVo;
import kr.ac.readingbetter.vo.ScoresVo;
import kr.ac.readingbetter.vo.ShopVo;
import kr.ac.readingbetter.vo.WishbookVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminAccusationService adminAccusationService;

	@Autowired
	private BookService bookService;

	@Autowired
	private AuthorService authorService;

	@Autowired
	private PublisherService publisherService;

	@Autowired
	private AdminBookService adminBookService;
	
	@Autowired
	private CardService cardService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminQuizService adminQuizService;
	
	@Autowired
	private ScoresService scoresService;
	
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private WishbookService wishBookService;
	
	@RequestMapping("/main")
	public String main() {
		return "admin/main";
	}
	
	/*
	 * 신고 관리
	 */
	@RequestMapping("/accusationlist")
	public String accusationList(Model model) {
		List<AccusationVo> list = adminAccusationService.getList();
		model.addAttribute("accusationlist", list);
		return "admin/accusationlist";
	}

	@RequestMapping(value = "/accusationview/{no}", method = RequestMethod.GET)
	public String accusationView(@PathVariable("no") Long no, Model model) {
		AccusationVo vo = adminAccusationService.getAccuView(no);
		
		model.addAttribute("vo", vo);
		
		return "admin/accusationview";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void modify(@RequestBody AccusationVo vo) {
		adminAccusationService.updateAccept(vo);
	}
	
	/*
	 * 도서 관리
	 */
	@RequestMapping("/booklist")
	public String bookList(BookVo bookvo, Model model) {
		int pageLength = 5;
		int beginPage;
		if (bookvo.getPageNo() == null) {
			bookvo.setPageNo(1);
		}
		List<BookVo> list = bookService.getList();
		List<BookVo> listpage = bookService.getAdminListPage(bookvo);
		model.addAttribute("list", listpage);

		int currentBlock = (int) Math.ceil((double) bookvo.getPageNo() / pageLength);

		int currentPage = bookvo.getPageNo();
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

		return "admin/booklist";
	}

	// 책 저장
	@RequestMapping("/bookaddform")
	public String bookaddList(Model model) {

		return "admin/bookaddform";
	}
	
	@RequestMapping("/insertbook")
	public String Insert(@ModelAttribute BookVo vo) {
		adminBookService.insert(vo);
		
		return "redirect:/admin/booklist";
	}
	
	// 책 수정 폼
	@RequestMapping(value = "/bookmodifyform/{no}", method = RequestMethod.GET)
	public String bookmodifyform(@PathVariable("no") Long no, Model model) {
		BookVo vo = bookService.getByNo(no);
		model.addAttribute("vo", vo);
		return "admin/bookmodifyform";
	}
	
	// 책 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String bookModify(BookVo bookVo, @RequestParam(value="pageNo") Integer pageNo){
		if(pageNo == null){
			pageNo = 1;
		}
		
		adminBookService.modify(bookVo);
		
		return "redirect:/admin/booklist?pageNo=" + pageNo;
	}
	
	@RequestMapping(value = "/checkbook", method = RequestMethod.POST)
	@ResponseBody
	public List<BookVo> checkBook(@RequestParam(value = "title") String title) {
		title = title.replace(" ", "");
		
		List<BookVo> bookList = adminBookService.checkBook(title);	
		return bookList;
	}
	
	@RequestMapping(value = "/writercheck", method = RequestMethod.POST)
	@ResponseBody
	public List<AuthorVo> checkwriter(@RequestParam(value = "kwd2") String kwd2,AuthorVo authorvo) {
		
		if (authorvo.getKwd2() == null) {
			authorvo.setKwd2("");
		}

		List<AuthorVo> authorlist = authorService.getList(authorvo);
		return authorlist;
	}
	
	@RequestMapping(value = "/publishercheck", method = RequestMethod.POST)
	@ResponseBody
	public List<PublisherVo> checkpublisher(@RequestParam(value = "kwd1") String kwd1,PublisherVo publishervo) {
		
		if (publishervo.getKwd1() == null) {
			publishervo.setKwd1("");
		}

		List<PublisherVo> publisherlist = publisherService.getList(publishervo);
		
		return publisherlist;
	}
	
	/*
	 * 출판사,작가 관리
	 */
	@RequestMapping("/bookinfolist")
	public String bookInfoList(Model model, PublisherVo publishervo, AuthorVo authorvo) {
		if (authorvo.getKwd2() == null) {
			authorvo.setKwd2("");
		}

		List<AuthorVo> list = authorService.getList(authorvo);
		model.addAttribute("authorlist", list);

		if (publishervo.getKwd1() == null) {
			publishervo.setKwd1("");
		}
		List<PublisherVo> list2 = publisherService.getList(publishervo);
		model.addAttribute("publisherlist", list2);

		return "admin/bookinfolist";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPublisher(@ModelAttribute PublisherVo vo) {
		publisherService.insert(vo);
		return "redirect:/admin/bookinfolist";
	}

	@RequestMapping(value = "/insertauthor", method = RequestMethod.POST)
	public String insertAuthor(@ModelAttribute AuthorVo vo) {
		authorService.insert(vo);
		return "redirect:/admin/bookinfolist";
	}
	
	/*
	 * 카드 관리
	 */
	// 카드 리스트 및 폼 출력
	@RequestMapping("/cardlist")
	public String cardList(Model model, CardVo vo) {
		if (vo.getTitle() == null) {
			vo.setTitle("");
		}
		List<CardVo> getCardList = cardService.getList(vo);
		model.addAttribute("getCardList", getCardList);
		return "admin/cardlist";
	}

	// 카드 등록 폼
	@RequestMapping("/cardaddform")
	public String cardAddForm() {
		return "admin/cardaddform";
	}

	// 카드 등록
	@RequestMapping("/cardaddform/cardadd")
	public String insertCard(CardVo vo) {
		cardService.insertCard(vo);
		return "redirect:/admin/cardlist";
	}

	// 카드 수정 폼
	@RequestMapping(value = "/cardmodifyform")
	public String cardModifyForm(Long no, Model model) {
		CardVo vo = cardService.getCardByNo(no);
		model.addAttribute("cardVo", vo);
		return "admin/cardmodifyform";
	}

	// 카드 수정
	@RequestMapping("/cardmodifyform/modify")
	public String updateCard(CardVo vo){
		cardService.updateCard(vo);
		return "redirect:/admin/cardlist";
	}
	
	// 카드 삭제
	@RequestMapping("/cardlist/delete")
	public String deleteCard(Long no) {
		cardService.deleteCard(no);
		return "redirect:/admin/cardlist";
	}
	
	/*
	 * 회원 관리
	 */
	@RequestMapping(value="/memberlist", method=RequestMethod.GET)
	public String memberList(Model model, MemberVo vo) {
		if(vo.getKwd() == null){
			vo.setKwd("");
		}
		List<MemberVo> list = memberService.getList(vo);
		model.addAttribute("list", list);
		return "admin/memberlist";
	}
	
	@RequestMapping("/memberlist/delete/{no}")
	public String memberDelete(@PathVariable("no") Long no, @ModelAttribute MemberVo vo){
		memberService.delete(vo);
		return "redirect:/admin/memberlist";
	}
	
	// 포인트 업데이트
	@ResponseBody
	@RequestMapping(value = "/memberlist/updatePoint", method = RequestMethod.POST)
	public void updatePoint(Integer point, Long memberNo, ScoresVo vo) {
		vo.setPoint(point);
		vo.setMemberNo(memberNo);
		memberService.updatePoint(vo);
	}
	
	/*
	 * 공지 관리
	 */
	@RequestMapping(value = "/noticelist", method = RequestMethod.GET)
	public String noticeList(Model model, NoticeVo vo) {
		List<NoticeVo> list = noticeService.getList(vo);
		model.addAttribute("list", list);
		return "admin/noticelist";
	}
	
	@RequestMapping(value = "/noticewriteform", method = RequestMethod.GET)
	public String noticeWriteForm() {
		return "admin/noticewriteform";
	}
	
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticeWrite(@ModelAttribute NoticeVo vo) {
		noticeService.noticeWrite(vo);
		return "redirect:/admin/noticelist";
	}

	@RequestMapping(value = "/noticeview/{no}", method = RequestMethod.GET)
	public String noticeView(@PathVariable("no") Long no, Model model) {
		NoticeVo vo = noticeService.noticeView(no);
		model.addAttribute("vo", vo);
		return "admin/noticeview";
	}

	@RequestMapping(value = "/noticemodifyform/{no}", method = RequestMethod.GET)
	public String noticeModifyForm(@PathVariable("no") Long no, Model model) {
		NoticeVo vo = noticeService.noticeView(no);
		model.addAttribute("vo", vo);
		return "admin/noticemodifyform";
	}
	
	@RequestMapping(value = "/noticemodify", method = RequestMethod.POST)
	public String noticeModify(@ModelAttribute NoticeVo vo) {
		noticeService.noticeModify(vo);
		return "redirect:/admin/noticelist";
	}
	
	/*
	 * 퀴즈 관리
	 */
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
	
	/*
	 * 학교 관리
	 */
	@RequestMapping("/schoollist")
	public String schoolList(Model model, @RequestParam(value="kwd", required=false, defaultValue="") String kwd) {
		if(kwd == null){
			kwd = "";
		}
		
		List<SchoolVo> list = schoolService.getList(kwd);
		
		model.addAttribute("list", list);
		
		return "admin/schoollist";
	}
	
	@RequestMapping(value="/schoollist/insert", method=RequestMethod.POST)
	public String insertSchool(@RequestParam(value="add", required=false, defaultValue="") String title){
		schoolService.insertSchool(title);
		
		return "redirect:/admin/schoollist";
	}
	
	/*
	 * 상점 관리
	 */
	// 상품 리스트 폼 및 출력
	@RequestMapping("/shoplist")
	public String goodsList(Model model, ShopVo vo) {
		if (vo.getTitle() == null) { // 검색할 상품명이 없으면 빈 문자열로 교체
			vo.setTitle("");
		}
		List<ShopVo> getGoodsList = shopService.getList(vo);
		model.addAttribute("getGoodsList", getGoodsList);
		return "admin/shoplist";
	}

	// 상품 등록 폼
	@RequestMapping("/shopaddform")
	public String goodsInsertForm() {
		return "admin/shopaddform";
	}

	// 상품 추가
	@RequestMapping(value = "/shopadd", method = RequestMethod.POST)
	public String goodsInsert(ShopVo vo) {
		shopService.goodsInsert(vo);
		return "redirect:shoplist";
	}

	// 상품 삭제
	@RequestMapping(value = "/shoplist/delete")
	public String goodsDelete(Long no) {
		shopService.goodsDelete(no);
		return "redirect:/admin/shoplist";
	}
	
	// 상품 수정 폼
	@RequestMapping(value = "/shoplist/modifyform", method = RequestMethod.GET)
	public String goodsModifyForm(Long no, Model model){
		
		ShopVo shopVo = shopService.getByNo(no);
		
		model.addAttribute("vo", shopVo);
		
		return "admin/shopmodifyform";
	}
	
	// 상품 수정
	@RequestMapping(value = "/shoplist/modify")
	public String goodsModify(ShopVo vo){
		
		shopService.update(vo);
		
		return "redirect:/admin/shoplist";
	}
	
	/*
	 * 희망도서 관리
	 */
	@RequestMapping("/wishbooklist")
	public String wishBookList(Model model) {
		List<WishbookVo> list = wishBookService.getList();
		model.addAttribute("list", list);

		return "admin/wishbooklist";
	}

	@RequestMapping("/wishbooklist/wishbookview")
	public String wishBookView(Model model, WishbookVo vo, PublisherVo pVo, BookVo bVo) {
		vo = wishBookService.getView(vo);

		if (pVo.getKwd1() == null || pVo.getKwd1().equals("")) {
			pVo.setKwd1("@@@@@@@@@@@@@@@@");
		}

		if (bVo.getBkwd() == null || bVo.getBkwd().equals("")) {
			bVo.setBkwd("@@@@@@@@@@@@@@@@@@@@");
		}

		List<PublisherVo> pList = publisherService.getList(pVo);
		List<BookVo> bList = bookService.findBook(bVo);

		model.addAttribute("vo", vo);
		model.addAttribute("plist", pList);
		model.addAttribute("blist", bList);

		return "admin/wishbookview";
	}

	@RequestMapping(value = "/wishbooklist/wishbookview/accept", method = RequestMethod.POST)
	public String wishBookAccept(@ModelAttribute WishbookVo vo) {
		List<PublisherVo> pList = publisherService.selectPublisher(vo);
		Integer pListLength = pList.size();

		if (pListLength == 0) {
			wishBookService.insertPublisher(vo);
		}

		wishBookService.insertBook(vo);
		wishBookService.updateAcceptToOne(vo);

		return "redirect:/admin/wishbooklist";
	}

	@RequestMapping("/wishbooklist/wishbookview/refuse")
	public String wishBookRefuse(WishbookVo vo) {
		wishBookService.updateAcceptToTwo(vo);

		return "redirect:/admin/wishbooklist";
	}
}