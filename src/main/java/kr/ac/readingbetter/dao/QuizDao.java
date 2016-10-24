package kr.ac.readingbetter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.readingbetter.vo.QuizVo;

@Repository
public class QuizDao {

	@Autowired
	private SqlSession sqlSession;

	public List<QuizVo> getList() {
		List<QuizVo> list = sqlSession.selectList("quiz.list");
		return list;
	}

	public QuizVo quizView(Long no) {
		QuizVo vo = sqlSession.selectOne("quiz.getByNo", no);
		return vo;
	}

	public void quizUpdate(QuizVo vo) {
		sqlSession.update("quiz.update", vo);
	}

	public void quizAdd(QuizVo vo) {
		sqlSession.insert("quiz.insert", vo);
	}

	public List<QuizVo> selectQuiz(Long no) {
		List<QuizVo> list = sqlSession.selectList("quiz.selectQuiz", no);
		return list;
	}

	public QuizVo selectResult(QuizVo vo) {
		vo = sqlSession.selectOne("quiz.selectResult", vo);
		return vo;
	}
	
	public String selectAnswer(Long no){
		return sqlSession.selectOne("quiz.selectAnswer", no);
	}
	
	public void updateQuizAccept(QuizVo vo) {
		sqlSession.update("quiz.updateQuizAccept", vo);
	}
}