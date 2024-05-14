<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="ko" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="resources/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자 문의 목록</title>

<meta name="description" content="" />
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/demo.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/perfect-scrollbar.css" />

<!-- JS -->
<script src="<%=request.getContextPath()%>/resources/js/helpers.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/config.js"></script>








</head>

<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">


			<!-- 좌측 메뉴바 -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="<%=request.getContextPath() %>/" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2">dflix</span>
            </a>
            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- 관리자메인 -->
            <li class="menu-item">
              <a href="<%=request.getContextPath() %>/admin/theaters/theatersMgList" class="menu-link menu-toggle">
                	극장 관리
              </a>
            </li>
            <li class="menu-item ">
              <a href="<%=request.getContextPath() %>/admin/notice/noticeList" class="menu-link menu-toggle">
                	공지관리
              </a>
            </li>
            <li class="menu-item active">
              <a href="<%=request.getContextPath() %>/admin/inquiry/inquiryList" class="menu-link menu-toggle"">
                	문의관리
              </a>
            </li>
          </ul>
        </aside>

			<!-- 본문 컨테이너 -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- 본문 시작 -->
					<div class="container-xxl flex-grow-1 container-p-y">
					
						<h4 class="fw-bold py-3 mb-4">
							문의 게시판
						</h4>
						<!-- Basic Bootstrap Table -->
						<div class="row h-50">
							<div class="card">
								<div class="table-responsive text-nowrap">
									<table class="table">
										<thead>
											<tr>
												<th>${boardVO.btitle }</th>
												<th class="right">${boardVO.brdate }</th>
											</tr>
										</thead>
										<tbody class="table-border-bottom-0 ">
											<tr>
												<td colspan=2>${boardVO.bcontent }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--/ Basic Bootstrap Table -->
						<a href="inquiryList"><button class="right btn btn-primary mt-3">목록으로</button></a>

						<button class="btn btn-primary mt-3 " onclick="deleteConfirm()">삭제</button>
						
						
						
						<form action="inquiryDelete" method="post" name="inquiryDelete">
							<input type="hidden" name="bno" value="${boardVO.bno }">
						</form>
						
						<div style="margin-top:100px" class="row">
							<div class="table-responsive text-nowrap">
								<table class="table">
									<thead>
									</thead>
									<tbody>
										<tr>
											<c:if test="${not empty nextBoardVO.bno}">
												<td><a href="inquiryView?bno=${nextBoardVO.bno }">다음글 ▲ <span> ${nextBoardVO.btitle }</span></a></td>
											</c:if>
										</tr>
										<tr>
											<c:if test="${not empty preBoardVO.bno}">
												<td><a href="inquiryView?bno=${preBoardVO.bno }">이전글 ▼ <span> ${preBoardVO.btitle }</span></a></td>
											</c:if>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<h6 class="mt-2 mb-3 text-muted">관리자 답변</h6>
						<div class="row">
							<div class="navbar-nav">
								<div class="nav-item d-flex">
									<input type="text" class="form-control border-0 shadow-none w-75 mb-5 mr-5" id="replyContentInput"/>
									<button class="btn btn-primary mb-5" onclick="replyWriteFn()">답변 추가</button>

									

									<form action="replyWrite" method="post" name="replyAdd">
										<input type="hidden" name="replyContent" id="replyContentInput2">
										<input type="hidden" name="bno" value="${boardVO.bno }">
									</form>
								</div>
							</div>
						</div>
						
						<c:forEach var="item" items="${replyList }">
							<div class=" row navbar navbar-example navbar-expand-lg bg-light mb-3">
									<div>
										<b>${item.icmtContent }</b>
										<button class="btn btn-primary right m-1" onclick="replyDeleteFn(${item.icmtno})">삭제</button>
									</div>
							</div>
						</c:forEach>
						<form action="replyDelete" method="post" name="replyDel">
							<input type="hidden" name="icmtno" id="icmtno">
							<input type="hidden" name="bno" value="${boardVO.bno }">
						</form>
						
						<div class="h-25">
						</div>
						

					</div>
				</div>
			</div>
		</div>

		<!-- Overlay -->

	</div>
	<!-- / Layout wrapper -->
	
<script src="<%=request.getContextPath()%>/resources/js/inquiryView.js"></script>
</body>
</html>
