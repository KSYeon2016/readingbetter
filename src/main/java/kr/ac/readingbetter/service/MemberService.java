package kr.ac.readingbetter.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AttendDao;
import kr.ac.readingbetter.dao.HistoryDao;
import kr.ac.readingbetter.dao.MemberDao;
import kr.ac.readingbetter.dao.ScoresDao;
import kr.ac.readingbetter.vo.HistoryVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.ScoresVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MailSender mailSender; // 메일 전송
	
	@Autowired
	private AttendDao attendDao;
	
	@Autowired
	private ScoresDao scoresDao;
	
	@Autowired
	private HistoryDao historyDao;

	public List<MemberVo> getList(MemberVo vo) {
		List<MemberVo> list = memberDao.getList(vo);
		return list;
	}

	public void delete(MemberVo vo) {
		memberDao.delete(vo);
	}

	public MemberVo selectAuthUser(MemberVo vo) {
		vo = memberDao.selectAuthUser(vo);
		return vo;
	}

	public MemberVo checkId(String id) {
		MemberVo vo = memberDao.checkId(id);
		return vo;
	}

	public MemberVo checkEmail(String email) {
		MemberVo vo = memberDao.checkEmail(email);
		return vo;
	}

	public MemberVo selectMyinfo(Long no) {
		MemberVo vo = memberDao.selectMyinfo(no);
		return vo;
	}

	// 회원가입
	public void insertMember(MemberVo vo) {
		memberDao.insertMember(vo);
		
		// 회원가입 축하 이메일
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(vo.getEmail()); // 받는 사람 이메일
		message.setSubject("ReadingBetter에서 회원가입을 축하드립니다"); // 메일 제목
		message.setText(
				vo.getName() + 
				"님 회원가입을 축하드립니다!\n당신은 아이디 : " + 
				vo.getId() + 
				"로 가입하셨습니다!\n\n" + 
				"ReadingBetter의 다양한 서비스를 즐겨주세요!"); // 메일 내용
		mailSender.send(message);
	}

	// 아이디 찾기
	public MemberVo findId(MemberVo vo) {
		vo = memberDao.findId(vo);
		return vo;
	}

	// 비밀번호 찾기
	public MemberVo findPw(MemberVo vo) {
		vo = memberDao.findPw(vo);
		return vo;
	}

	// 임시 비밀번호로 변경후 이메일 전송
	public MemberVo sendEmail(MemberVo vo) throws Exception {
		// 임시 비밀번호 생성
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		int size = 5;

		String chars[] = "A,B,C,D,E,a,b,c,d,e,1,2,3,4,5,!,@,#,$,%".split(",");
		for (int i = 0; i < size; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}

		// 임시 비밀번호로 업데이트
		vo.setPw(buffer.toString());
		memberDao.updateTempPw(vo);

		// 입력된 이메일로 임시 비밀번호 전송
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(vo.getEmail()); // 받는 사람 이메일
		message.setSubject("ReadingBetter에서 임시 비밀번호를 보냅니다"); // 메일 제목
		message.setText("당신의 임시 비밀번호는 " + buffer.toString() 
			+ "입니다.\n로그인후 반드시 새 비밀번호를 변경해 주세요"); // 메일	 내용
		mailSender.send(message);
		return vo;
	}
	
	// 리셋 확인
	public int checkreset() {
		// 등록 확인 없으면
		Long checkReset = attendDao.checkreset();
		if (checkReset == 0L) {
			return 0;
		}
		// 있으면
		return 1;
	}
	
	// 출석체크
	public int attendAction(Long no){
		Integer bonus = 10;
		
		// 출석체크 확인
		Long checkAttend = attendDao.checkAttend(no);
		
		// 오늘 출석 기록이 없는 경우
		if(checkAttend == null){
			// 누적 출석 +1
			memberDao.updateAttCount(no);
			
			// 누적 출석일이 7의 배수면 보상
			Integer attCount = memberDao.selectAttCount(no);
			
			if((attCount % 7) == 0){
				HistoryVo historyVo = new HistoryVo();
				
				historyVo.setPoint(bonus);
				historyVo.setMemberNo(no);

				historyDao.insertAttBonus(historyVo);
				scoresDao.updateAttendBonus(historyVo);
			}
			
			// attend insert
			attendDao.insertAttend(no);
			
			return 0;
		}
		
		// 오늘 출석 기록이 있는 경우
		return 1;
	}
	
	public int selectAttCount(Long no){
		int attCount = memberDao.selectAttCount(no);
		return attCount;
	}
	
	public void updatePoint(ScoresVo vo){
		scoresDao.scoreUpdate(vo);
	}
}