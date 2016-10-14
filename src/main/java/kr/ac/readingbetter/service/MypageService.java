package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.GifticonDao;
import kr.ac.readingbetter.dao.MemberDao;
import kr.ac.readingbetter.vo.GifticonVo;
import kr.ac.readingbetter.vo.MemberVo;

@Service
public class MypageService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private GifticonDao gifticonDao;

	// 회원 정보 업데이트
	public void updateMember(MemberVo vo) {
		if (!vo.getPw().equals("")) {
			memberDao.updateMemberWithPw(vo);
			return;
		}

		memberDao.updateMember(vo);
	}

	// 회원 정보 불러오기
	public MemberVo selectMyinfo(Long no) {
		MemberVo vo = memberDao.selectMyinfo(no);
		return vo;
	}

	// 기프티콘 리스트 가져오기
	public List<GifticonVo> ListId(GifticonVo vo) {
		List<GifticonVo> list = gifticonDao.ListId(vo);
		return list;
	}

	// 페이징
	public List<GifticonVo> ListPage(GifticonVo vo) {
		if (vo.getPageNo() == null) {
			vo.setPageNo(1);
		}
		List<GifticonVo> list = gifticonDao.ListPage(vo);
		return list;
	}

}