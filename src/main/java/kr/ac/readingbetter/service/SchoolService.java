package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.SchoolDao;
import kr.ac.readingbetter.vo.SchoolVo;

@Service
public class SchoolService {

	@Autowired
	private SchoolDao schoolDao;

	public List<SchoolVo> getList(String kwd) {
		List<SchoolVo> list = schoolDao.getList(kwd);

		return list;
	}

	public void insertSchool(String title) {
		schoolDao.insertSchool(title);
	}

	public List<SchoolVo> selectSchoolTitle() {
		List<SchoolVo> list = schoolDao.selectSchoolTitle();
		
		return list;
	}
}