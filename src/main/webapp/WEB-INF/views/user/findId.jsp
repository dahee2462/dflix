<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>아이디 찾기</title>
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
	<script src="<%=request.getContextPath() %>/resources/jquery/jquery.min.js"></script>
  	<script>
  		function searchId(){
  			
  			let mname = document.frm.mname.value;
  			let mbirth = document.frm.mbirth.value;
  			let mphone = document.frm.mphone.value;
  			
  			let isSubmit = true;
  			
  			//이름
  			if(mname == "" || mname === undefined || mname === null){
  				isSubmit = false;
  			}else{
  				let regId = /^[가-힣a-zA-Z]$/;
  				let regRs = regId.test(mname);
  				if (!regRs) {
  				} else {
  					isSubmit = false;
  				}
  			}
  			//생년월일
  			if (mbirth == "" || mbirth === undefined || mbirth === null) {
				isSubmit = false;
			} else {
				let regId = /^(19|20)\d\d(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
				let regRs = regId.test(mbirth);
				if (regRs) {
				} else {
					isSubmit = false;
				}
			}
  			//휴대폰번호
  			if (mphone == "" || mphone === undefined || mphone === null) {
				isSubmit = false;
			} else {
				let regId = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
				let regRs = regId.test(mphone);
				if (regRs) {
				} else {
					isSubmit = false;
				}
			}
  			
  			//제출
  			if(isSubmit){
  				
  				$.ajax({
  					url:"searchId",
  					type:"post",
  					data: {
  						mname: $("#mname").val(),
  						mbirth: $("#mbirth").val(),
  						mphone: $("#mphone").val(),
  					},
  					success:function(data){
  						let result = data.trim();
  						if(result == "" || result === undefined || result === null){
  							alert("일치하는 아이디가 없습니다.");
  						}else{
  							alert("일치하는 아이디는 '"+data+"'입니다.");
  						}
  					},error: function(){
  						
  					}
  				});
  			} else{
  				alert("입력값이 유효하지 않습니다.");
  			}
  		}
  	</script>
  </head>
  <body>
    <!-- Content -->
    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner py-4">
         
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="<%=request.getContextPath() %>/" class="app-brand-link gap-2">
                  <span class="app-brand-text demo text-body fw-bolder">dflix</span>
                </a>
              </div>
              
              <form name="frm" id="formAuthentication" class="mb-3" action="index" method="POST"
              	action="#" onsubmit="return false;">
                <div class="mb-3">
                  <label for="inputName" class="form-label">이름</label>
                  <input
                    type="text"
                    class="form-control"
                    id="mname"
                    name="mname"
                    autofocus
                  />
                </div>
                <div class="mb-3">
                  <label for="inputBirth" class="form-label">생년월일</label>
                  <input
                    type="text"
                    class="form-control"
                    id="mbirth"
                    name="mbirth"
                    autofocus
                  />
                </div>
                <div class="mb-3">
                  <label for="inputPhone" class="form-label">연락처</label>
                  <input
                    type="text"
                    class="form-control"
                    id="mphone"
                    name="mphone"
                    autofocus
                  />
                </div>
                <button type="button" class="btn btn-primary d-grid w-100" onclick="searchId();">아이디 찾기</button>
              </form>
              <div class="text-center">
                <a href="login" class="d-flex align-items-center justify-content-center">
                  	로그인으로 돌아가기
                </a>
              </div>
            </div>
          </div>
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
