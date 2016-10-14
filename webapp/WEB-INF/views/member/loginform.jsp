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
<script type="text/javascript" src="/readingbetter/assets/js/loginform.js"></script>
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu"></div>
	
	<div id="cont">
		<div id="login">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 로그인
			</div>

			<p class="menu-title">로그인</p>
			<br>
				
			<div id="radio-group">
				<c:if test="${param.error != null }">
					<h6 style="color: red;">아이디 혹은 비밀번호가 틀립니다</h6>
				</c:if>
							
				<img id="img-login" class="img-circle" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/pikachu.png">

				<div class="form-group">
					<label for="inputId" class="col-sm-4 control-label">아이디</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="inputID" placeholder="ID" name="id">
					</div>
				</div>
				<br><br>

				<div class="form-group">
					<label for="inputPassword" class="col-sm-4 control-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="inputPassword" placeholder="Password" name="pw">
					</div>
				</div>
				<br><br>

				<button class="btn btn-default" id="btn-login" type="submit">로그인</button><br><br>
				<a href="/readingbetter/member/joinform">회원가입</a>
				<a href="/readingbetter/member/findform">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>