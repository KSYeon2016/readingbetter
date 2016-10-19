<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>이번 달 학년 순위</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<link href="/readingbetter/assets/css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/gifticon.js"></script>
</head>
<body>
<input type="hidden" class="category" value="gifticon">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_mypage.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/mypage/info">내 정보</a> > 기프키콘
			</div>

			<p class="menu-title">나의 기프티콘 보기</p>
		</div>
		
		<div id="history">
			<table id="history-table" class="table table-striped">
				<tr>
					<th>번호</th>
					<th>상품명</th>
					<th>획득날짜</th>
					<th>기한</th>
				</tr>

				<c:forEach var='vo' items='${list}' varStatus='s'>
					<tr>
						<td>${vo.no }</td>
						<td>${vo.title }</td>
						<td>${vo.getDate }</td>
						<td>	
							<c:choose>
								<c:when test="${vo.limit ==30}">만료되었습니다.</c:when>
		                        <c:when test="${vo.limit<30}">${30-vo.limit }</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			
			<!-- begin:paging -->
			<div class="pager">
				<ul>
					<c:if test="${beginPage>1 }">
						<li>
							<a href="/readingbetter/mypage/gifticon?pageNo=${beginPage-1 }">◀</a>
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
									<a href="/readingbetter/mypage/gifticon?pageNo=${i }">${i }</a>
									<input type="hidden" name="pageNo" value="${i}">
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						
					<c:if test='${endPage<total }'>
						<li>
							<a href="/readingbetter/mypage/gifticon?pageNo=${endPage+1 }">▶</a>
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