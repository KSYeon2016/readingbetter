package kr.ac.readingbetter.vo;

public class GifticonVo {
	
	private Long no;
	private String cover;
	private String title;
	private Long memberNo;
	private String getDate;
	private Integer pageNo;
	private Integer limit;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}

	public String getGetDate() {
		return getDate;
	}

	public void setGetDate(String getDate) {
		this.getDate = getDate;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "GifticonVo [no=" + no + ", cover=" + cover + ", title=" + title + ", memberNo=" + memberNo
				+ ", getDate=" + getDate + ", pageNo=" + pageNo + ", limit=" + limit + "]";
	}

}