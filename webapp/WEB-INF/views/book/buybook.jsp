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
				<a href="/readingbetter/book/booklist">독서활동</a> > 책 구매
			</div>
			
			<p class="menu-title">책 구매</p>
		</div>
		
		<div id="list">
			<p><b>${param.title }</b> 상품 검색 결과입니다</p>
			<p><b>이미지</b>를 누르면 해당 상품 페이지로 이동합니다</p>
			
			<c:choose>
				<c:when test="${currentPage == maxPage }">
					<c:forEach begin='${(currentPage-1)*items }' end='${listLength - 1 }' step='1' var='i'>
						<table id="book-table">
							<colgroup>
								<col width="30%" />
								<col width="10%" />
								<col width="20%" />
								<col width="40%" />
							</colgroup>
							<tr>
								<td rowspan="4">
									<a href="${buyBookList[i].link }">
										<img class="img-thumbnail" src="${buyBookList[i].image }">
									</a>
								</td>
								<td colspan="3">${buyBookList[i].title }</td>
							</tr>
							<tr>
								<td class="table-right">가격</td>
								<td class="table-left">${buyBookList[i].lprice }</td>
								<td></td>
							</tr>
							<tr>
								<td class="table-right">쇼핑몰</td>
								<td class="table-left">${buyBookList[i].mallName }</td>
								<td></td>
							</tr>
							<tr>
								<td class="table-right"></td>
								<td class="table-left"></td>
								<td></td>
							</tr>
						</table>
						<br>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<c:forEach begin='${(currentPage-1)*items }' end='${(currentPage-1)*items + items -1 }' step='1' var='i'>
						<table id="book-table">
							<colgroup>
								<col width="30%" />
								<col width="10%" />
								<col width="20%" />
								<col width="40%" />
							</colgroup>
							<tr>
								<td rowspan="4">
									<a href="${buyBookList[i].link }">
										<img class="img-thumbnail" src="${buyBookList[i].image }">
									</a>
								</td>
								<td colspan="3">${buyBookList[i].title }</td>
							</tr>
							<tr>
								<td class="table-right">가격</td>
								<td class="table-left">${buyBookList[i].lprice }</td>
								<td></td>
							</tr>
							<tr>
								<td class="table-right">쇼핑몰</td>
								<td class="table-left">${buyBookList[i].mallName }</td>
								<td></td>
							</tr>
							<tr>
								<td class="table-right"></td>
								<td class="table-left"></td>
								<td></td>
							</tr>
						</table>
						<br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			<br>
			<!-- begin:paging -->
			<div class="pager">
				<ul>
					<c:if test="${beginPage>1 }">
						<li>
							<a href="/readingbetter/book/buybook?pageNo=${beginPage-1 }&title=${param.title }">◀</a>
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
									<a href="/readingbetter/book/buybook?pageNo=${i }&title=${param.title }">${i }</a>
									<input type="hidden" name="pageNo" value="${i}">
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						
					<c:if test='${endPage<maxPage }'>
						<li>
							<a href="/readingbetter/book/buybook?pageNo=${endPage+1 }&title=${param.title }">▶</a>
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