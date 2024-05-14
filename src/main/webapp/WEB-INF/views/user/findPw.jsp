<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="light-style customizer-hide" dir="ltr"
	data-theme="theme-default" data-assets-path="resources/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>비밀번호 찾기</title>
<meta name="description" content="" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/demo.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/perfect-scrollbar.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/page-auth.css" />

<!-- JS -->
<script src="<%=request.getContextPath() %>/resources/js/helpers.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/config.js"></script>
<script src="<%=request.getContextPath() %>/resources/jquery/jquery.min.js"></script>
<style>
	.hit{color:#696cff; font-weight:bold;}
</style>
<script>
function updatePw(){
		
		let mid = document.frm.mid.value;
		let mname = document.frm.mname.value;
		let memail = document.frm.memail.value;
		
		let isSubmit = true;
		
		//아이디
		if (mid == "" || mid === undefined || mid === null) {
			isSubmit = false;
		}
		//이름
		if(mname == "" || mname === undefined || mname === null){
			isSubmit = false;
		}

		//이메일
		if (memail == "" || memail === undefined || memail === null) {
			isSubmit = false;
		
		}
		
		//타이머
		
		//제출
		if(isSubmit){
			document.frm.submit();
		} else{
			alert("입력값이 유효하지 않거나 인증이 되지 않았습니다.");
		}
	}
</script>
</head>
<body>
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner py-4">

				<div class="card">
					<div class="card-body">
						<div class="app-brand justify-content-center">
							<a href="<%=request.getContextPath() %>/" class="app-brand-link gap-2"> 
								<span class="app-brand-text demo text-body fw-bolder">dflix</span>
							</a>
						</div>

						<form id="formAuthentication" name="frm" class="mb-3" 
							action="updatePw" method="POST" onsubmit="return false;">
							<div class="mb-3">
								<span class="form-label">
									*입력양식을 모두 입력한 뒤 비밀번호 찾기 버튼 클릭시<br>
									 입력된 이메일주소로 <span class="hit">임시비밀번호</span>가 발송됩니다.
								</span>
							</div>
							<div class="mb-3">
								<label for="mid" class="form-label">아이디</label> 
								<input
									type="text" class="form-control" id="mid"
									name="mid" autofocus />
							</div>
							<div class="mb-3">
								<label for="mname" class="form-label">이름</label> 
								<input
									type="text" class="form-control" id="mname"
									name="mname" />
							</div>
							<div class="mb-3">
								<label for="memail" class="form-label">E-mail</label> 
								<input
									type="email" class="form-control" id="memail"
									name="memail" />
							</div>
							
							<div class="form-floating d-inline-block">
								<input class="btn" id="Timer" type="button" value="" readonly />
							</div>

							<button type="button" class="btn btn-primary d-grid w-100" 
									onclick="updatePw();">비밀번호 찾기</button>
						</form>
						
						<div class="text-center">
							<a href="login" class="d-flex align-items-center justify-content-center">
								로그인으로 돌아가기 </a> 
							<a href="findId" class="d-flex align-items-center justify-content-center">
								아이디 찾기 </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JS -->
	<script src="<%=request.getContextPath() %>/resources/jquery/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/popper.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/perfect-scrollbar.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/menu.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>
