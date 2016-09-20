package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AdminBookDao;
import kr.ac.readingbetter.vo.BookVo;

@Service
public class AdminBookService {

	@Autowired
	private AdminBookDao adminBookDao;

	public List<BookVo> getList() {
		List<BookVo> list = adminBookDao.getList();
		return list;
	}
}