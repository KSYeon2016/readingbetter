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

<link href="/readingbetter/assets/css/shop.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/shop.js"></script>
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_shop.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 상점
			</div>

			<p class="menu-title">상점</p>
		</div>
		
		<div id="shop">
			<p id="myPoint">내 캔디수 : ${scoresVo.point }</p>

			<div class="imggroup">
				<c:forEach var='vo' items='${getGoodsList}' varStatus='s'> 
					<div class="col-lg-3">
						<!-- Button trigger modal -->
						<button name=no value="${vo.no }" type="button" class="btn btn-default btn-confirm"  data-toggle="modal" data-target="#myModal">
							<img id="img-shop" class="img-thumbnail" src="${vo.cover }" />
						</button>
							
						<table class="table">
							<tr>
								<td>상품명</td><br>
								<td>${vo.title }</td>
							</tr>
							<tr>
								<td>개수</td><br>
								<td>${vo.price }</td>
							</tr>
						</table><br>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">결제확인</h4>
			</div>
			
			<div class="modal-body">
				<form class="form-inline">
					<div class="form-group">
						<p id="message-conform">
							<input type="hidden" name="no" id="no" value="">
							<input type="hidden" name="point" id="point" value="${scoresVo.point }">
							<strong id=title></strong>을 결제 하시겠습니까?<br>
							<strong id=price></strong>캔디
						</p>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" id="btn-buy">예</button>
			</div>
		</div>
	</div>
</div>