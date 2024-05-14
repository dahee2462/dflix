<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" 
	data-assets-path="resources/" data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>영화관리</title>
<meta name="description" content="" />
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/templatemo-villa-agency.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/demo.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/perfect-scrollbar.css" />

<!-- 차트css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/apex-charts.css" />

<!-- JS -->
<script src="<%=request.getContextPath()%>/resources/js/helpers.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/config.js"></script>
</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<%@ include file="../../include/nav/adminNav.jsp"%>
			<!-- 본문 컨테이너 -->
			<div class="layout-page">
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- 본문 -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="section properties">
							<div class="container">
								<div class="main-button addbtn"><a href="movieMgAdd">추가하기</a></div>
								<div class="row properties-box">
									
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6">
										<div class="item">
											<img src="<%=request.getContextPath()%>/resources/images/pamyo_p.jpg" alt="포스터"> 
											<h6>15</h6>
											<h4>파묘</h4>
											<ul>
												<li>상영시간: <span>134분</span></li>
											</ul>
											<div class="main-button">
												<a href="movieMgView">상세보기</a> 
											</div>
										</div>
									</div>
								</div>
								
								<!-- 페이징 -->
								<div class="row">
									<div class="col-lg-12">
										<ul class="pagination">
											<li><a href="#">1</a></li>
											<li><a class="is_active" href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">>></a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /본문끝 -->

							<%@ include file="../../include/footer/adminFooter.jsp"%>
						</div>
						<!-- Content wrapper -->
					</div>
				</div>
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
	</div>
	<!-- / Layout wrapper -->
	<!-- JS -->
	<script src="<%=request.getContextPath()%>/resources/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/isotope.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/owl-carousel.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/counter.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
</body>
</html>
