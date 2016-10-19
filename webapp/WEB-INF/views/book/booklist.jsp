<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter</title>

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<!-- 개별 -->
<link href="/readingbetter/assets/css/book.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/booklist.js"></script>
<!-- /개별 -->

</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_book.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/book/booklist">독서활동</a> > 책목록
			</div>
			
			<p class="menu-title">책 목록</p>
		</div>
		
		<div id="list">
			<form id="search_form" action="" method="get">
				<input type="text" id="bkwd" name="bkwd" value="${bkwd }">
				<input id="btn-s" type="submit" value="찾기">
			</form>
			<br>
					
			<c:forEach var='vo' items='${listpage}' varStatus='s'>
				<table id="book-table">
					<colgroup>
						<col width="30%" />
						<col width="10%" />
						<col width="20%" />
						<col width="40%" />
					</colgroup>
					<tr>
						<td id="title" colspan="4">${vo.title }</td>
					</tr>
					<tr>
						<td rowspan="4"><img class="img-thumbnail" src="${vo.cover }"></td>
						<td class="table-right">작&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가:</td>
						<td class="table-left">${vo.authorName }</td>
						<td></td>
					</tr>
					<tr>
						<td class="table-right">출&nbsp;&nbsp;판&nbsp;&nbsp;사:</td>
						<td class="table-left">${vo.publisherTitle }</td>
						<td></td>
					</tr>
					<tr>
						<td class="table-right">추천&nbsp;학년:</td>
						<td class="table-left">${vo.recommend }</td>
						<c:choose>
							<c:when test="${not empty sessionScope.authUser}">
								<td rowspan="2">
									<a class="btn btn-default" href="/readingbetter/book/buybook?title=${vo.title }">책 구매</a>
									<a class="btn btn-default" href="/readingbetter/book/review/${vo.no}" role="button">리뷰보기</a>
									<a class="btn btn-default btn-solve" data-no="${vo.no }" role="button">문제풀기</a>
									<a class="btn btn-default" href="/readingbetter/book/makequizform/${vo.no}" role="button">문제내기</a>
								</td>
							</c:when>
							<c:otherwise>
								<td rowspan="2">
									<a class="btn btn-default" href="/readingbetter/book/buybook?title=${vo.title }">책 구매</a>
									<a class="btn btn-default" href="/readingbetter/book/review/${vo.no}" role="button">리뷰보기</a>
									<a class="btn btn-default disabled" role="button">문제풀기</a>
									<a class="btn btn-default disabled" role="button">문제내기</a></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
				<br>
			</c:forEach>
					
			<br>
			<!-- begin:paging -->
			<div class="pager">
				<ul>
					<c:if test="${beginPage>1 }">
						<li>
							<a href="/readingbetter/book/booklist?pageNo=${beginPage-1 }&bkwd=${bkwd}">◀</a>
							<input type="hidden" name="pageNo" value="${beginPage-1 }">
						</li>
					</c:if>

					<c:forEach begin='${beginPage }' end='${endPage }' step='1' var='i'>
						<c:choose>
							<c:when test='${currentPage == i }'>
								<li class="selected">${i }</li>
							</c:when>
						<c:otherwise>
							<li>
								<a href="/readingbetter/book/booklist?pageNo=${i }&bkwd=${bkwd}">${i }</a>
								<input type="hidden" name="pageNo" value="${i}">
							</li>
						</c:otherwise>
						</c:choose>
					</c:forEach>
						
					<c:if test='${endPage<total }'>
						<li>
							<a href="/readingbetter/book/booklist?pageNo=${endPage+1 }&bkwd=${bkwd}">▶</a>
							<input type="hidden" name="pageNo" value="${endPage+1}">
						</li>
					</c:if>
				</ul>
			</div>
			<!-- end:paging -->
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>