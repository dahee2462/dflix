<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <title>문의 작성</title>
    
    <!-- nav, footer CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-villa-agency.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    
    <!-- content CSS, JS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/demo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/perfect-scrollbar.css" />
    <script src="<%=request.getContextPath() %>/resources/js/helpers.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/config.js"></script>
  
  </head>
<body>
	<%@ include file="../include/nav/userNav.jsp"%>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<%@ include file="../include/nav/userBoardNav.jsp"%>
			<!-- 본문 컨테이너 -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- 본문 시작 -->
					<div class="container-xxl flex-grow-1 container-p-y">

						<h4 class="fw-bold py-3 mb-4">문의 게시판</h4>
						
						<!-- Basic Bootstrap Table -->
						<div class="row h-50">
							<div class="card">
								<div class="table-responsive text-nowrap">
									<form name="boardWrite" action="inquiryWrite" method="post">
										<table class="table">
											<thead>
												<tr>
													<th><input type="text" name="btitle" class="form-control border-0 shadow-none" placeholder="제목" aria-label="제목"></th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0 ">
												<tr>
													<td colspan=2><input type="text" name="bcontent" class="form-control border-0 shadow-none" placeholder="내용을 입력하세요." aria-label="내용을 입력하세요."></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</div>
						<!--/ Basic Bootstrap Table -->
						
						<button style="margin-top:50px" class="right btn btn-primary" onclick="document.forms['boardWrite'].submit();">작성</button>

							
						<!-- 본문 끝 -->
						<%@ include file="../include/footer/adminFooter.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

</body>
</html>