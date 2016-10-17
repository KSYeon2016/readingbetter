package kr.ac.readingbetter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.readingbetter.vo.GifticonVo;

@Repository
public class GifticonDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void gifticonInsert(GifticonVo vo) {
		sqlSession.insert("gifticon.insertgifticon", vo);
	}
	
	public List<GifticonVo> ListId(GifticonVo vo) {
		List<GifticonVo> list = sqlSession.selectList("gifticon.listid", vo);
		return list;
	}
	
	public List<GifticonVo> ListPage(GifticonVo vo) {
		List<GifticonVo> list = sqlSession.selectList("gifticon.listpage", vo);
		return list;
	}

}