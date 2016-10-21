package kr.ac.readingbetter.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void insertAttend(Long no){
		sqlSession.insert("attend.insert", no);
	}
	
	public Long checkAttend(Long no){
		Long checkAttend = sqlSession.selectOne("attend.checkAttend", no);
		return checkAttend;
	}
	
	public Long checkreset(){
		Long checkAttend = sqlSession.selectOne("attend.checkreset");
		return checkAttend;
	}
}
