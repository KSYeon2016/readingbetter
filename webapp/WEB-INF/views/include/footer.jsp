<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<div class="container-fluid">
	<div class="row">
		<div id="footer" class="col-lg-12">
			<div class="col-md-4">Copyright ⓒ by 취업하나</div>
			
			<div class="col-md-2">
				<a href="/readingbetter/main/manual">이용법</a>
			</div>
			
			<div class="col-md-2">
				<a href="/readingbetter/main/siteinfo">소개</a>
			</div>
			
			<div class="col-md-2">
				<a href="/readingbetter/main/sitemap">사이트맵</a>
			</div>
			
			<c:if test="${not empty sessionScope.authUser && authUser.position == 0}">
				<div class="col-md-2">
					<a href="/readingbetter/admin/main">관리자</a>
				</div>
			</c:if>
		</div>
	</div>
</div>