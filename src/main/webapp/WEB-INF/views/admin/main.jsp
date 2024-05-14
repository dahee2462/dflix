<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html
  lang="ko"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="resources/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>관리자 메인</title>

    <meta name="description" content="" />
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/demo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/perfect-scrollbar.css" />

	<!-- 차트css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/apex-charts.css" />

    <!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/js/helpers.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/config.js"></script>
  </head>
  <body>
  
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
       <%@ include file="../include/nav/adminNav.jsp" %>

        <!-- 본문 컨테이너 -->
        <div class="layout-page">
          
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- 본문 -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <!-- Bordered Table -->
              <div class="card">
                <h5 class="card-header"></h5>
                <div class="card-body">
                  <div class="table-responsive text-nowrap">

                  </div>
                </div>
              </div>
              <!--/ Bordered Table -->

              </div>

            </div>
            <!-- /본문끝 -->
			<%@ include file="../include/footer/adminFooter.jsp" %>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      
    </div>
    <!-- / Layout wrapper -->

  </body>
</html>
