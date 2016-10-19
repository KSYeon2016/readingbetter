<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/readingbetter/assets/js/navi.js"></script>
<div>
	<p id="category"><img id="text" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/ranking.png"></p>
	<ul>
		<li><a href="/readingbetter/ranking/summary" class="summary">순위 한눈에 보기</a></li>
		<li><a href="/readingbetter/ranking/monthlytotal" class="monthlytotal">이번 달 전체 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlyschool" class="monthlyschool">이번 달 학교별 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=1" class="monthlygrade-grade-1">1학년 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=2" class="monthlygrade-grade-2">2학년 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=3" class="monthlygrade-grade-3">3학년 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=4" class="monthlygrade-grade-4">4학년 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=5" class="monthlygrade-grade-5">5학년 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=6" class="monthlygrade-grade-6">6학년 순위</a></li>
		<li><a href="/readingbetter/ranking/monthlygrade?grade=0" class="monthlygrade-grade-0">일반 회원 순위</a></li>
		<li><a href="/readingbetter/ranking/honor" class="honor">명예의 전당</a></li>
	</ul>
</div>