package kr.ac.readingbetter.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.GifticonDao;
import kr.ac.readingbetter.dao.MemberDao;
import kr.ac.readingbetter.dao.ShopDao;
import kr.ac.readingbetter.vo.GifticonVo;
import kr.ac.readingbetter.vo.MemberVo;
import kr.ac.readingbetter.vo.ShopVo;

@Service
public class ShopService {

	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender mailSender; // 메일 전송
	
	@Autowired
	 private GifticonDao gifticonDao;
	
	// 상품 리스트 출력
	public List<ShopVo> getList(ShopVo vo) {
		return shopDao.getList(vo);
	}
	
	//기프티콘 추가
	public void gifticonInsert(GifticonVo vo) {
		gifticonDao.gifticonInsert(vo);
	}

	// 상품 추가
	public void goodsInsert(ShopVo vo) {
		shopDao.goodsInsert(vo);
	}

	// 상품 삭제
	public void goodsDelete(Long no) {
		shopDao.goodsDelete(no);
	}

	public ShopVo getByNo(Long no) {
		ShopVo shop = shopDao.getByNo(no);
		return shop;
	}

	// 상품 구매 시 기프티콘 메일로 발송
	public void sendEmail(MemberVo vo, ShopVo shopVo) throws Exception {
		// 로그인한 회원 정보 불러오기
		vo = memberDao.selectMyinfo(vo.getNo());
		shopVo = shopDao.getByNo(shopVo.getNo());

		// 로그인한 회원의 이메일로 기프티콘 보냄
		MimeMessage message = mailSender.createMimeMessage();
		try {
			message.setSubject("ReadingBetter에서 구입하신 기프티콘을 보내드립니다", "UTF-8");
			String htmlContent = "<img style='height:200px; weight:200px' src=\"" + shopVo.getCover() + "\"><br>"
					+ "<div>구입하신 상품 <strong>" + shopVo.getTitle() + "</strong>의 기프티콘을 발송하였습니다.</div><br>"
					+ "<img style='height:200px; weight:200px' src=\"http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/barcode/barcode"
					+ shopVo.getNo() + ".jpg\">";
			message.setText(htmlContent, "UTF-8", "html");
			message.addRecipient(RecipientType.TO, new InternetAddress(vo.getEmail()));
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			return;
		} catch (MailException e) {
			e.printStackTrace();
			return;
		}
	}
	
	public void update(ShopVo vo){
		shopDao.update(vo);
	}
}