<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>ReadingBetter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/book.css" rel="stylesheet" type="text/css">
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_book.jsp' />
	</div>
	
	<div id="cont">
		<div id="review">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/book/booklist">독서활동</a> > 
				<a href="/readingbetter/book/booklist">책 목록</a> > 리뷰 보기
			</div>

			<p class="menu-title">리뷰</p>

			<div>
				<img id="img-book" class="img-thumbnail" src="${vo.cover }">
				<table class="table">
					<tr>
						<td>제목</td>
						<br>
						<td>${vo.title}</td>
					</tr>
					<tr>
						<td>출판사</td>
						<br>
						<td>${vo.publisherTitle }</td>
					</tr>
					<tr>
						<td>추천 학년</td>
						<br>
						<td>${vo.recommend}</td>
					</tr>
				</table>
			</div><br>

			<div id="board">
				<table class="tbl-ex">
					<c:choose>
						<c:when test="${not empty sessionScope.authUser}">
							<colgroup>
								<col width="30%" />
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
						</c:when>
						<c:otherwise>
							<colgroup>
								<col width="50%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
						</c:otherwise>
					</c:choose>
				
					<tr>
						<th>내용</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<c:if test = '${not empty sessionScope.authUser}'>
							<th>신고</th>
							<th>삭제</th>
						</c:if>
					</tr>

					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<c:choose>
									<c:when test="${not empty sessionScope.authUser}">
										<td colspan=5>아직 등록된 리뷰가 없습니다</td>
									</c:when>
									<c:otherwise>
										<td colspan=5>아직 등록된 리뷰가 없습니다</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:when>
						<c:otherwise>
	  						<c:forEach var='reviewVo' items='${list}' varStatus='s'>	
								<tr>
									<td>${reviewVo.review }</td>
									<td>${reviewVo.id }</td>
									<td>${reviewVo.regDate }</td>
									
									<c:if test = '${not empty sessionScope.authUser}'>
										<c:choose>
											<c:when test="${reviewVo.memberNo == authUser.no}">
												<td></td>
												<td><a href="/readingbetter/book/delete/${reviewVo.no }">삭제</a></td>
											</c:when>
											<c:otherwise>
												<td>
													<a href="/readingbetter/book/accusation/${reviewVo.no }">
														<img id="img-singo" src="/readingbetter/assets/images/singo.png">
													</a>
												</td>
												<td></td>
											</c:otherwise>
										</c:choose>
									</c:if>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

				<!-- begin:paging -->
            	<div class="pager">
            	<br>
               		<ul>
               			<c:if test='${beginPage>1}'>
               				<li><a href="/readingbetter/book/review/${vo.no }?reviewPage=${beginPage-1}">◀</a></li>
               			</c:if>

                  		<c:forEach begin='${beginPage}' end='${endPage}' step='1' var='i'>
                  			<c:choose>
                  				<c:when test='${currentPage == i}'>
                  					<li class="selected">${i}</li>
                  				</c:when>
                  				<c:otherwise>
                  					<li><a href="/readingbetter/book/review/${vo.no }?reviewPage=${i}">${i}</a></li>
                  				</c:otherwise>
                  			</c:choose>
                  		</c:forEach>

                  		<c:if test='${endPage<totalPage}'>
                  			<li><a href="/readingbetter/book/review/${vo.no }?reviewPage=${endPage+1}">▶</a></li>
                  		</c:if>               		
               		</ul>
            	</div>
            	<!-- end:paging -->
		            	
				<c:if test = '${not empty sessionScope.authUser}'>
					<form class="form-inline" method="post" action="../insert/${vo.no}" >
						<input type="hidden" name="bookNo" value="${vo.no}">	
						<div class="form-group">
							<label class="sr-only">review</label>
							<input  name="review" type="text" class="form-control input-sm" id="write-review">
							<button type="submit" class="btn btn-default">등록</button>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>