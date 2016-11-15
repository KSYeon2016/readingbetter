package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AuthorDao;
import kr.ac.readingbetter.dao.BookDao;
import kr.ac.readingbetter.dao.PublisherDao;
import kr.ac.readingbetter.vo.AuthorVo;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.PublisherVo;

@Service
public class AdminBookService {

	@Autowired
	private BookDao bookDao;

	@Autowired
	private AuthorDao authorDao;
	
	@Autowired
	private PublisherDao publisherDao;
	
	public List<BookVo> checkBook(String title) {
		List<BookVo> bookList = bookDao.findBookReplace(title);
		return bookList;
	}
	
	public List<BookVo> getList() {
		List<BookVo> list = bookDao.getList();
		return list;
	}
	
	public List<AuthorVo> getAuthorList(AuthorVo vo) {
		List<AuthorVo> list = authorDao.getList(vo);
		return list;
	}
	
	public List<PublisherVo> getPublisherList(PublisherVo vo) {
		List<PublisherVo> list = publisherDao.getList(vo);
		return list;
	}
	
	// 도서 관리 도서 추가
	public void insert(BookVo vo) {
		Long authorNo = authorDao.selectAuthor(vo.getAuthorName());
		
		if(authorNo == null){
			authorDao.insertAuthor(vo.getAuthorName());
		}
		
		Long publisherNo = publisherDao.selectPublisherForAddBook(vo.getPublisherTitle());

		if(publisherNo == null){
			publisherDao.insertPublisher(vo.getPublisherTitle());
		}
		
		bookDao.insert(vo);
	}
	
	// 도서 수정
	public void modify(BookVo vo){
		Long authorNo = authorDao.selectAuthor(vo.getAuthorName());
		
		if(authorNo == null){
			authorDao.insertAuthor(vo.getAuthorName());
		}
		
		Long publisherNo = publisherDao.selectPublisherForAddBook(vo.getPublisherTitle());

		if(publisherNo == null){
			publisherDao.insertPublisher(vo.getPublisherTitle());
		}
		
		bookDao.updateBook(vo);
	}
}