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

<link href="/readingbetter/assets/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" class="category" value="info">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_mypage.jsp' />
	</div>
	
	<div id="cont">
		<div id="info">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/mypage/info">내정보</a> > 내정보 보기
			</div>

			<p class="menu-title">내 정보 보기</p>

			<div id="radio-group">
				<form class="form-horizontal">
					<img id="img-mypage" class="img-circle" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/pikachu.png"><br>
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label">이름</label>
						<div class="col-sm-9">
							<p class="form-control-static">${memberVo.name }</p>
						</div>
					</div>
							
					<div class="form-group">
						<label class="col-sm-3 control-label">초등학교</label>
						<div class="col-sm-9">
							<p class="form-control-static">${memberVo.schoolName }</p>
						</div>
					</div>

					<c:if test="${memberVo.schoolName != '기타' }">
						<div class="form-group">
							<label class="col-sm-3 control-label">학년 반</label>
							<div class="col-sm-9">
								<p class="form-control-static">${memberVo.grade }학년 ${memberVo.classNo }반</p>
							</div>
						</div>
					</c:if>
				</form>
			</div>

			<div id="radio-group">
				<h4>연락처</h4>
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">본인 확인 이메일</label>
						<div class="col-sm-9">
							<p class="form-control-static">${memberVo.email }</p>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">휴대전화</label>
						<div class="col-sm-9">
							<p class="form-control-static">${memberVo.tel }</p>
						</div>
					</div>

					<a class="btn btn-default" href="/readingbetter/mypage/modifyform" role="button">수정하기</a>
				</form>
			</div>

			<table class="table table-striped" id="myscore-table">
				<tr>
					<td>캔디 수</td>
					<br>
					<td>종합 점수</td>
					<td>이번달 점수</td>
				</tr>
				<tr>
					<td>${scoresVo.point }</td>
					<br>
					<td>${scoresVo.totalScore }</td>
					<td>${scoresVo.score }</td>
				</tr>
			</table>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>