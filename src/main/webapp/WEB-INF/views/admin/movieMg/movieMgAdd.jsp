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
	              		<h4 class="fw-bold py-3 mb-4">
	              			<span class="text-muted fw-light">영화 관리 /</span> 영화 추가
	              		</h4>
	              		<div class="row">
		                	<div class="col-md-12">
		                  	<div class="card mb-4">
		                  	<h5 class="card-header">영화 포스터</h5>
		                    <!-- 영화추가 -->
		                    <div class="card-body">
		                      <div class="d-flex align-items-start align-items-sm-center gap-4">
		                        <img
		                          src="<%=request.getContextPath() %>/resources/images/kal_p.jpg"
		                          alt="user-avatar"
		                          class="d-block rounded movieaddimg"
		                          height="100"
		                          width="100"
		                          id="uploadedAvatar"
		                        />
		                        <div class="button-wrapper">
		                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
		                            <span class="d-none d-sm-block">포스터 업로드</span>
		                            <input
		                              type="file"
		                              id="upload"
		                              class="account-file-input"
		                              hidden
		                              accept="image/png, image/jpeg"
		                            />
		                          </label>
		                          <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
		                            <i class="bx bx-reset d-block d-sm-none"></i>
		                            <span class="d-none d-sm-block">Reset</span>
		                          </button>
		                        </div>
		                      </div>
		                    </div>
		                    <hr class="my-0" />
		                    <div class="card-body">
		                      <form id="formAccountSettings" method="POST" onsubmit="return false">
		                        <div class="row">
		                          <div class="mb-3 col-md-6">
		                            <label for="movieName" class="form-label">영화명</label>
		                            <input
		                              class="form-control"
		                              type="text"
		                              id="movieName"
		                              name="movieName"
		                              autofocus
		                            />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label class="form-label" for="genre">장르</label>
		                            <select id="genre" class="select2 form-select">
		                              <option value="">Select</option>
		                              <option value="action">액션</option>
		                              <option value="romance">로맨스</option>
		                              <option value="drama">드라마</option>
		                              <option value="animation">애니</option>
		                              <option value="thriller">스릴러</option>
		                              <option value="fantasy">판타지</option>
		                            </select>
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="director" class="form-label">감독</label>
		                            <input class="form-control" type="text" name="director" id="director" />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="acters" class="form-label">배우</label>
		                            <input class="form-control" type="text" name="acters" id="acters" />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="ratings" class="form-label">관람등급</label>
		                            <input class="form-control" type="text" name="ratings" id="ratings" />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="runningtime" class="form-label">상영시간</label>
		                            <input class="form-control" type="number" name="runningtime" id="runningtime" />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="nations" class="form-label">국가</label>
		                            <input class="form-control" type="text" name="nations" id="nations" />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="releasedate" class="form-label">상영일</label>
		                            <input class="form-control" type="text" name="releasedate" id="releasedate" />
		                          </div>
		                          <div class="mb-3 col-md-6">
		                            <label for="synopsis" class="form-label">줄거리</label>
		                            <textarea class="form-control" type="text" name="synopsis" id="synopsis"></textarea>
		                          </div>
		                         <div class="mb-3 row">
			                        <label for="html5-date-input" class="col-md-2 col-form-label">상영일</label>
			                        <div class="col-md-10">
			                          <input class="form-control" type="date" value="2021-06-18" id="html5-date-input" />
			                        </div>
			                      </div>

		                        </div>
		                        <div class="mt-2">
		                          <button type="submit" class="btn btn-primary me-2">저장</button>
		                          <button type="reset" class="btn btn-outline-secondary">취소</button>
		                        </div>
		                      </form>
		                    </div>
		                    <!-- /Account -->
		                  </div>
		                 
		                </div>
		              </div>
	
									
							</div>
						
							<!-- /본문끝 -->

							<%@ include file="../../include/footer/adminFooter.jsp"%>
						</div>
						<!-- Content wrapper -->

				</div>
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->

	
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
