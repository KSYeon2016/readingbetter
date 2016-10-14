package kr.ac.readingbetter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.readingbetter.vo.ShopVo;

@Repository
public class ShopDao {

	@Autowired
	private SqlSession sqlSession;

	public List<ShopVo> getList(ShopVo vo) {
		return sqlSession.selectList("shop.list", vo);
	}

	public void goodsInsert(ShopVo vo) {
		sqlSession.insert("shop.insert", vo);
	}

	public void goodsDelete(Long no) {
		sqlSession.delete("shop.delete", no);
	}

	public ShopVo getByNo(Long no) {
		ShopVo vo = sqlSession.selectOne("shop.getByNo", no);
		return vo;
	}
	
	public void update(ShopVo vo){
		sqlSession.update("shop.update", vo);
	}
}