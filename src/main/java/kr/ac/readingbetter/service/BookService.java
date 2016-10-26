package kr.ac.readingbetter.service;

import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.BookDao;
import kr.ac.readingbetter.dao.DaysDao;
import kr.ac.readingbetter.dao.QuizDao;
import kr.ac.readingbetter.dao.ToBookDao;
import kr.ac.readingbetter.util.NaverParser;
import kr.ac.readingbetter.vo.AnswerVo;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.BuyBookVo;
import kr.ac.readingbetter.vo.QuizVo;
import kr.ac.readingbetter.vo.ToBookVo;

@Service
public class BookService {

	@Autowired
	private BookDao bookDao;

	@Autowired
	private QuizDao quizDao;
	
	@Autowired
	private DaysDao daysDao;
	
	@Autowired
	private ToBookDao toBookDao;
	
	public List<BookVo> getList() {
		List<BookVo> list = bookDao.getList();
		return list;
	}

	public List<BookVo> getListKwd(BookVo vo) {
		List<BookVo> list = bookDao.getListKwd(vo);
		return list;
	}

	public BookVo getByNo(Long no) {
		BookVo vo = bookDao.getByNo(no);
		return vo;
	}

	public List<BookVo> findBook(BookVo vo) {
		List<BookVo> list = bookDao.findBook(vo);
		return list;
	}

	public List<BookVo> getListService(BookVo vo) {
		List<BookVo> list = bookDao.getListService(vo);
		return list;
	}
	
	public String getAnswer(Long no){
		return quizDao.selectAnswer(no);
	}
	
	// 정답 개수 구하기
	public Integer getCount(List<AnswerVo> list){
		Integer len = list.size();
		Integer count = 0;
		
		for (int i = 0; i < len; i++) {
			String oAnswer = quizDao.selectAnswer(list.get(i).getQuizNo());
			if (oAnswer.equals(list.get(i).getAnswer())) {
				count++;
			}
		}
		
		return count;
	}
	
	public List<QuizVo> selectQuiz(Long no) {
		List<QuizVo> list = quizDao.selectQuiz(no);
		return list;
	}

	// 퀴즈 추가 - 사용자는 무조건 대기상태여야 한다
	public void quizAdd(QuizVo vo) {
		// 퀴즈의 답에 따른 저장
		String answer = vo.getAnswer();

		switch (answer) {
		case "1":
			vo.setAnswer(vo.getEx1());
			break;
		case "2":
			vo.setAnswer(vo.getEx2());
			break;
		case "3":
			vo.setAnswer(vo.getEx3());
			break;
		case "4":
			vo.setAnswer(vo.getEx4());
			break;
		}

		vo.setAccept("0");
		quizDao.quizAdd(vo);
	}
	
	// 사용자 페이징 리스트
	public List<BookVo> getAdminListPage(BookVo vo) {
		List<BookVo> list = bookDao.getAdminListPage(vo);
		return list;
	}
	
	// 오늘의 책
	public List<BookVo> todayBook(){
		Integer result = daysDao.selectDays();
		
		// 날짜가 바뀐 경우
		if(result == null){
			daysDao.insertDays();
			Integer count = toBookDao.selectCount();
			List<Long> todayBookNoList = bookDao.selectBookByRandom();
			
			for (int i = 0; i < 5; i++) {
				ToBookVo vo = new ToBookVo();
				vo.setNo(i + 1);
				vo.setBookNo(todayBookNoList.get(i));

				if (count == 0) {
					toBookDao.insertToBook(vo);
				} else {
					toBookDao.updateToBook(vo);
				}
			}
		}
		
		// 오늘의 책 가져오기
		List<BookVo> todayBookList = new ArrayList<>();
		
		for(int i = 0; i < 5; i++){
			BookVo vo = bookDao.selectTodayBook(i+1);
			todayBookList.add(vo);
		}
		
		return todayBookList;
	}
	
	public List<BuyBookVo> buyBook(String title){
		InputStream content = null;
		List<BuyBookVo> buyBookList = new ArrayList<>();
		
		try {
			String kwd = URLEncoder.encode(title, "UTF-8");
			
			String clientId = "0Eb4z11jHdc4qGUmtn1k";
			String clientSecret = "bIKEMQ1hla";
			String url = "https://openapi.naver.com/v1/search/shop.xml?query=" + kwd + "&sort=asc&display=100";

			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet(url);

			request.addHeader("X-Naver-Client-Id", clientId);
			request.addHeader("X-Naver-Client-Secret", clientSecret);
			HttpResponse response = client.execute(request);
			
			HttpEntity entity = response.getEntity();
			content = entity.getContent();	// InputStream

			NaverParser naverAPI = new NaverParser();
			buyBookList = naverAPI.parse(content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return buyBookList;
	}
	
	public void updateQuizAccept(QuizVo vo) {
		quizDao.updateQuizAccept(vo);
	}
}