<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- 좌측 메뉴바 -->
	<aside id="layout-menu"
		class="layout-menu menu-vertical menu bg-menu-theme">
		<div class="app-brand demo">
			<span class="app-brand-text demo menu-text fw-bolder ms-2">고객센터</span>
		</div>

		<div class="menu-inner-shadow"></div>

		<ul class="menu-inner py-1">

			<!-- 공지 게시판 -->
			<li class="menu-item">
				<a href="noticeList" class="menu-link menu-toggle">
					<div data-i18n="Layouts">공지 게시판</div>
				</a>
			</li>

			<!-- 문의 게시판 -->
			<li class="menu-item">
				<a href="inquiryList" class="menu-link menu-toggle">
					<div data-i18n="Layouts">문의 게시판</div>
				</a>
			</li>
			
		</ul>
	</aside>
</body>
</html>