package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AdminWishbookDao;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.PublisherVo;
import kr.ac.readingbetter.vo.WishbookVo;

@Service
public class AdminWishbookService {
	@Autowired
	private AdminWishbookDao adminWishbookDao;
	
	public List<WishbookVo> getList(){
		List<WishbookVo> list = adminWishbookDao.getList();
		return list;
	}
	
	public WishbookVo getView(WishbookVo vo){
		vo = adminWishbookDao.getView(vo);
		return vo;
	}
	
	public List<PublisherVo> findPublisher(PublisherVo vo){
		List<PublisherVo> list = adminWishbookDao.findPublisher(vo);
		return list;
	}
	
	public List<BookVo> findBook(BookVo vo){
		List<BookVo> list = adminWishbookDao.findBook(vo);
		return list;
	}
	
	public List<PublisherVo> selectPublisher(WishbookVo vo){
		List<PublisherVo> list = adminWishbookDao.selectPublisher(vo);
		return list;
	}
	
	public void insertPublisher(WishbookVo vo){
		adminWishbookDao.insertPublisher(vo);
	}
	
	public void insertBook(WishbookVo vo){
		adminWishbookDao.insertBook(vo);
	}
	
	public void updateWishbookAcceptToOne(WishbookVo vo){
		adminWishbookDao.updateWishbookAcceptToOne(vo);
	}
	
	public void updateWishbookAcceptToTwo(WishbookVo vo){
		adminWishbookDao.updateWishbookAcceptToTwo(vo);
	}
}
