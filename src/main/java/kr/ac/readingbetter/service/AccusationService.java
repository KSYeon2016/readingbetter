package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.AccusationDao;
import kr.ac.readingbetter.vo.AccusationVo;

@Service
public class AccusationService {

	@Autowired
	private AccusationDao accusationDao;
	
	public List<AccusationVo> getList() {
		List<AccusationVo> list = accusationDao.getList();
		return list;
	}

	public AccusationVo getByNo(Long no) {
		AccusationVo adminAccusation = accusationDao.getByNo(no);
		return adminAccusation;
	}

	public void update(AccusationVo vo) {
		accusationDao.update(vo);
	}

	public void insert(AccusationVo vo) {
		accusationDao.insert(vo);
	}
}