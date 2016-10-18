<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	pageContext.setAttribute( "newLine", "\n" );
%>
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
</head>
<body>
<input type="hidden" class="category" value="notice">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div id="noticeview">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/service/noticelist">고객센터</a> > 
				<a href="/readingbetter/service/noticelist">공지</a> > 글 보기
			</div>

			<p class="menu-title">공지</p>

			<div id="board">
				<table class="table table-bordered">
					<tr>
						<td class="active">제목</td>
						<td colspan=7>${vo.title }</td>
					</tr>
					<tr>
						<td class="active">작성자</td>
						<td>${vo.name }</td>
						<td class="active">조회수</td>
						<td>${vo.viewCount }</td>
						<td class="active">작성일</td>
						<td>${vo.regDate }</td>
					</tr>
					<tr>
						<td colspan=8 class="active"></td>
					</tr>
					<tr>
						<td class="board-content" id="notice-content" colspan=8 rowspan=5>${fn:replace(vo.content, newLine, "<br>") }</td>
					</tr>
				</table>
						
				<div id="button-set">							
					<a href="/readingbetter/service/noticelist" class="btn btn-default">목록</a>
				</div><br><br>

				<table class="tbl-ex">
					<tr>
						<th>댓글</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<c:if test='${not empty sessionScope.authUser}'>
							<th>신고</th>
							<th>삭제</th>
						</c:if>
					</tr>

					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<c:choose>
									<c:when test="${not empty sessionScope.authUser}">
										<td colspan=5>아직 등록된 댓글이 없습니다</td>
									</c:when>
									<c:otherwise>
										<td colspan=3>아직 등록된 댓글이 없습니다</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var='commentsVo' items='${list}'>
								<tr>
									<td id="review-content">${commentsVo.content }</td>
									<td>${commentsVo.id }</td>
									<td>${commentsVo.regDate }</td>
									<c:if test='${not empty sessionScope.authUser}'>
										<c:choose>
											<c:when test="${commentsVo.memberNo == authUser.no}">
												<td></td>
												<td><a href="/readingbetter/service/deleteComments/${commentsVo.no }">삭제</a></td>
											</c:when>																		
											<c:otherwise>
												<td>
													<a href="/readingbetter/service/commentsAccusation/${commentsVo.no }">
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
               				<li><a href="/readingbetter/service/noticeview/${vo.no }?commentsPage=${beginPage-1}">◀</a></li>
               			</c:if>

                  		<c:forEach begin='${beginPage}' end='${endPage}' step='1' var='i'>
                  			<c:choose>
                  				<c:when test='${currentPage == i}'>
                  					<li class="selected">${i}</li>
                  				</c:when>
                  				<c:otherwise>
                  					<li><a href="/readingbetter/service/noticeview/${vo.no }?commentsPage=${i}">${i}</a></li>
                  				</c:otherwise>
                  			</c:choose>
                  		</c:forEach>

                  		<c:if test='${endPage<totalPage}'>
                  			<li><a href="/readingbetter/service/noticeview/${vo.no }?commentsPage=${endPage+1}">▶</a></li>
                  		</c:if>               		
               		</ul>
            	</div>
            	<!-- end:paging -->
		            	
				<c:if test='${not empty sessionScope.authUser}'>
					<form class="form-inline"  method="post" action="../commentswrite">
						<div class="form-group">
							<input type="hidden" name="noticeNo" value="${vo.no }">
							<input type="hidden" name="memberNo" value="${authUser.no }">
							<input type="text" class="form-control input-sm" id="review" name="content">
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