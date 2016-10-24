package kr.ac.readingbetter.vo;

public class QuizVo {
	private Long no;
	private String quiz;
	private String ex1;
	private String ex2;
	private String ex3;
	private String ex4;
	private String answer;
	private String accept;
	private Long bookNo;
	private String title;
	private String selected;
	private Long memberNo;	// 퀴즈 출제자 번호

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getQuiz() {
		return quiz;
	}

	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}

	public String getEx1() {
		return ex1;
	}

	public void setEx1(String ex1) {
		this.ex1 = ex1;
	}

	public String getEx2() {
		return ex2;
	}

	public void setEx2(String ex2) {
		this.ex2 = ex2;
	}

	public String getEx3() {
		return ex3;
	}

	public void setEx3(String ex3) {
		this.ex3 = ex3;
	}

	public String getEx4() {
		return ex4;
	}

	public void setEx4(String ex4) {
		this.ex4 = ex4;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public Long getBookNo() {
		return bookNo;
	}

	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}

	public Long getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "QuizVo [no=" + no + ", quiz=" + quiz + ", ex1=" + ex1 + ", ex2=" + ex2 + ", ex3=" + ex3 + ", ex4=" + ex4
				+ ", answer=" + answer + ", accept=" + accept + ", bookNo=" + bookNo + ", title=" + title
				+ ", selected=" + selected + ", memberNo=" + memberNo + "]";
	}
}