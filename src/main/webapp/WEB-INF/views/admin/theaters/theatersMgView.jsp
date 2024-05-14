<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html lang="ko" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="resources/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자 극장 목록</title>

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
            <li class="menu-item active">
              <a href="<%=request.getContextPath() %>/admin/theaters/theatersMgList" class="menu-link menu-toggle">
                	극장 관리
              </a>
            </li>
            <li class="menu-item">
              <a href="<%=request.getContextPath() %>/admin/notice/noticeList" class="menu-link menu-toggle">
                	공지관리
              </a>
            </li>
            <li class="menu-item">
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
							극장 시간표 관리
						</h4>
						
						날짜 선택: <input type="text" name="attendday" id="attendday"/>
						<div class="row mb-4">
							

						</div>
						
						<!-- Basic Bootstrap Table -->
						<div class="row"> 
						
						
							<div class="card">
								<div class="table-responsive text-nowrap">
									<table class="table">
										<thead>
											<tr>
											</tr>
										</thead>
										<tbody class="table-border-bottom-0">
											<c:forEach var="ScreenHallVO" items="${ScreenHallVOList}">
												<tr class="border-bottom">
													<th style="height:20em; width:15px">${ScreenHallVO.shallLocation }</th>
													<c:forEach var="screenVO" items="${ScreenHallVO.screenVO}">
														<td style="width:30px;">
															<span>${screenVO.sstartTime }~${screenVO.sendTime } / ${screenVO.cname }</span>
															<button class="left m-1 btn btn-primary" onclick="screenDeleteFn(${screenVO.sno})">삭제</button>
														</td>
													</c:forEach>
												</tr>
											</c:forEach>
										</tbody>

									</table>
									<form name="screenDeleteForm" action="screenDelete" method="post">
										<input type="hidden" name="sno" id="sno">
										<input type="hidden" name="tno" value="${param.tno }">
										<input type="hidden" name="attendday" id="attendday3">
									</form>
								</div>
							</div>
						</div>
							<button class="right m-1 btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#backDropModal">추가</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Overlay -->

	</div>
	<!-- / Layout wrapper -->

<!-- 모달 -->
	<div class="modal fade" id="backDropModal" data-bs-backdrop="static"
		tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog">
			<form class="modal-content" action="theatersMgViewInsert" method="post" name="modal">
				<input type="hidden" name="attendday2" id="attendday2">
				<input type="hidden" name="tno" value="${param.tno }">
				<div class="modal-header">
					<h5 class="modal-title" id="backDropModalTitle">시간표 저장</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col mb-3">
							<div class="form-label">상영관 번호</div>
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							
								<c:forEach var="ScreenHallVO" items="${ScreenHallVOList }" >
	                              <input type="radio" class="btn-check" name="shallno" id="구분${ScreenHallVO.shallno }" value="${ScreenHallVO.shallno }">
	                              <label class="btn btn-outline-primary" for="구분${ScreenHallVO.shallno }">${ScreenHallVO.shallLocation }</label>
                              	</c:forEach>	
                            
                            </div>
						</div>
					</div>
					<div class="row g-2">
						<div class="col mb-0">
							<div class="form-label">영화목록</div>
							<select id="selectTypeOpt" class="form-select color-dropdown" name="cno">
								<c:forEach var="item" items="${CinemaVOList }">
									<option value="${item.cno}">${item.cname} / 상영시간(분): ${item.cshowTime}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col mb-0">
							<label for="dobBackdrop" class="form-label">시간 작성</label> 
							<input type="time" id="dobBackdrop" class="form-control" name="sstartTime" value="12:00">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="modalFn()">저장</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 모달끝 -->


	
	

	<!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="<%=request.getContextPath()%>/resources/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/popper.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/perfect-scrollbar.js"></script>

    <script src="<%=request.getContextPath()%>/resources/js/menu.js"></script>
    <!-- endbuild -->


    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/theaterMgView.js"></script>
	<!-- 날짜 api -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<script>
	var attendday = <%=request.getParameter("attendday")%>;
		$(function() { 
			if(attendday == null || attendday == undefined || attendday == ""){
				let today = new Date();
				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				attendday = year + "" + month + "" + date;
			}
			$('input[name="attendday"]').on('apply.daterangepicker', function(ev, picker) {
			  	var url ="theatersMgView?tno="+<%=request.getParameter("tno")%>+"&attendday="+picker.startDate.format('YYYYMMDD');
			  	$(location).attr('href',url);
			});
			
			
		});
		document.getElementById("attendday").value = attendday;
		
	</script>

</body>
</html>