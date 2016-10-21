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
<script type="text/javascript" src="/readingbetter/assets/js/findform.js"></script>
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu"></div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 아이디 비밀번호 찾기
			</div>

			<p class="menu-title">아이디/비밀번호 찾기</p>
		</div>
		
		<div id="findjoin">
			<div id="radio-group">
				<form class="form-horizontal" action="" method="POST">
					<br>
					<p>아이디 찾기</p>
					<div class="form-group">
						<label class="col-sm-3 control-label">이름</label>
						<div class="col-sm-6">
							<input type="text" id="inputNameForId" class="form-control" placeholder="Name" value="김아무개">
						</div>
					</div>
						
					<div class="form-group">
						<label class="col-sm-3 control-label">이메일</label>
						<div class="col-sm-6">
							<input type="Email" id="inputEmailForId" class="form-control" placeholder="Email" value="kg00003@naver.com">
						</div>
					</div>

					<div class="form-group">
						<h4 id="yourId"></h4><Br>
						<a class="btn btn-default" role="button" id="findId">찾기</a>
					</div>
				</form>
			</div>

			<div id="radio-group">
				<form class="form-horizontal"  action="" method="POST">
					<br>
					<p>비밀 번호 찾기</p>
					<div class="form-group">
						<label for="inputID" class="col-sm-3 control-label">아이디</label>
						<div class="col-sm-6">
							<input type="text" id="inputIdForPw" class="form-control" id="inputID" placeholder="ID" value="aa11">
						</div>
					</div>
							
					<div class="form-group">
						<label for="inputName" class="col-sm-3 control-label">이름</label>
						<div class="col-sm-6">
							<input type="text" id="inputNameForPw" class="form-control" id="inputPassword" placeholder="Name" value="김아무개">
						</div>
					</div>
							
					<div class="form-group">
						<label for="inputEmail" class="col-sm-3 control-label">이메일</label>
						<div class="col-sm-6">
							<input type="Email" id="inputEmailForPw" class="form-control" id="inputEmail" placeholder="Email" value="kg00003@naver.com">
						</div>
					</div>

					<div class="form-group">
						<h4 id="yourPw"></h4><Br>
						<a class="btn btn-default" role="button" id="findPw">찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>