<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
  lang="ko"
  class="light-style customizer-hide"
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
    <title>로그인</title>

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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/page-auth.css" />
    <!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/js/helpers.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->
    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              
              <div class="app-brand justify-content-center">
                <a href="<%=request.getContextPath() %>/" class="app-brand-link gap-2">
                  <span class="app-brand-text demo text-body fw-bolder">dflix</span>
                </a>
              </div>
              
              <form id="formAuthentication" class="mb-3" 
              		action="loginOk" 
              		method="POST">
                <div class="mb-3">
                  <label for="mid" class="form-label">아이디</label>
                  
                  <a href="findId" style="float:right;">
                      <small>아이디 찾기</small>
                  </a>
                  
                  <input
                    type="text"
                    class="form-control"
                    id="mid"
                    name="mid"
                    autofocus
                  />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">비밀번호</label>
                    
                    <a href="findPw">
                      <small>비밀번호 찾기</small>
                    </a>
                  </div>
                  
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="mpw"
                      class="form-control"
                      name="mpw"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <!-- <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> 아이디 기억하기 </label>
                  </div> -->
                </div>
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
                </div>
              </form>
              <p class="text-center">
                <span>아직 회원이 아니신가요?</span>
                <a href="join">
                  <span>회원가입</span>
                </a>
              </p>
            </div>
          </div>
          <!-- /Register -->
        </div>
      </div>
    </div>
    <!-- / Content -->
    <!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/perfect-scrollbar.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/menu.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>

  </body>
</html>
