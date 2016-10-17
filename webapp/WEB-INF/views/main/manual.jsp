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

<link href="/readingbetter/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">
	<div id="cont">
		<div id="manual">
			<p class="menu-title">Reading Better 이용 방법</p>
			<p id="manual-content">
				<strong>회원가입 방법</strong><br><br>
				1. 회원가입 버튼을 클릭합니다<br>
				2. 회원정보 항목들을 안내에 따라 모두 입력하시고, <strong>"제출"</strong>을 클릭하면 회원가입이 완료 됩니다.<br>
				- 회원가입을 해야만 Reading Better를 이용이 가능합니다.<br><br><br>
				<strong>로그인 방법</strong><br><br>
				1. 회원가입을 완료한 경우 아이디와 비밀번호를	입력하고 "로그인" 버튼을 클릭하면 Reading Better에 로그인이 됩니다.<br>
				2. Reading Better의 독서퀴즈, 랭킹, 상점, 히스토리등의 서비스를 	이용하실 수 있습니다.<br><br><br>
				<strong>독서인증 퀴즈풀기</strong><br><br>
				1. Reading Better의 독서인증 퀴즈를 풀려면, 먼저 로그인을 하신 후 홈페이지 위쪽의 '독서 활동' 메뉴를 클릭하면 책 목록 페이지로 들어갑니다.
				책 목록 페이지에서는 "리뷰", "문제 풀기", "문제 내기" 화면으로 이동할 수 있는 버튼이 나타납니다<br>
				2. 원하는 책을 선택하고 문제풀기 버튼을 누르면 한책당 5문제를 푸실 수 있습니다.<br>
				3. 5문제를 풀면 결과 화면 페이지로 이동 됩니다.<br>
				4. 결과화면 페이지에서 "점수","캔디","인증 여부"를 확인 하실 수 있습니다. 점수가 80점 이상인 경우에만 인증이 성공되며 캔디는 <strong>3개</strong>가 지급됩니다.<br>
				5. 하단에 있는 3개의 몬스터볼 중 하나를 선택하면 카드가 나오게 되고, 그 카드의 점수만큼 전체 점수에 점수가 추가되어 올라갑니다.<br>
				6. 인증에 성공한 책은 다시 풀어도 캔디가 지급되지 않습니다.
			</p>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>