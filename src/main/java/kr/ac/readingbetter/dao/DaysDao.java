package kr.ac.readingbetter.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaysDao {
	@Autowired
	private SqlSession sqlSession;
	
	public Integer selectDays(){
		Integer result = sqlSession.selectOne("days.selectDays");
		
		return result;
	}
	
	public Integer selectMonth(){
		Integer result = sqlSession.selectOne("days.selectMonth");

		return result;
	}
	
	public void insertDays(){
		sqlSession.insert("days.insertDays");
	}
}
