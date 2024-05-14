<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <title>회원가입</title>
    <meta name="description" content="" />
    <!-- CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/demo.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/js/helpers.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/config.js"></script>
    <script src="<%=request.getContextPath() %>/resources/jquery/jquery.min.js"></script>
    <style>
    	.col-md-6{margin: 0 auto;}
    	.mt-2{margin-left: 30%; padding-top:20px;}
    	form span{display:block;}
    </style>
    <script>
    var id_check = false;
	var pw_check = false;
	var pwRe_check = false;
	var name_check = false;
	var nickNm_check = false;
	var birth_check = false;
	var phone_check = false;
	var gender_check = false;
	var email_check = false;
   
	function validation(){
		
		if(id_check && pw_check && pwRe_check && name_check && nickNm_check && 
				birth_check && phone_check && gender_check && email_check){
			
				document.frm.submit();
		}else{
			alert("입력양식을 모두 입력해주세요");
		}
	}
	
	//아이디(중복확인)
	function checkId(obj){
		let regId = /^[a-z][a-z0-9]{3,20}$/g;
		let regRs = regId.test(obj.value);
		let midSpan = document.getElementById("midSpan");
			
		$.ajax({
			url : "checkId",
			type : "post",
			data : {id : $("#mid").val()},
			success : function(data){
				let result = data.trim();
				
				if(obj.value == "" || obj.value === null || obj.value === undefined){
					midSpan.innerHTML = '아이디를 입력해주세요.';
					midSpan.style.color = 'red';
					id_check = false;
				}else if(!regRs){
					midSpan.innerHTML = '4자 이상, 20이하의 영문(소문자) 및 숫자만 사용가능합니다.';
					midSpan.style.color = 'red';
					id_check = false;
				}else if(result == 1){
					midSpan.innerHTML = '이미 존재하는 아이디입니다.';
					midSpan.style.color = 'red';
					id_check = false;
				}else{
					midSpan.innerHTML = '사용 가능한 아이디입니다.';
					midSpan.style.color = 'green';
					id_check = true;
				}
			},error:function(){
				console.log("error");
				id_check = false;
			}
		});
	}
	
	//비밀번호
	function checkPw(obj){
		let regId = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/g;
		let regRs = regId.test(obj.value); 
		let mpwSpan = document.getElementById("mpwSpan"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mpwSpan.innerHTML = '비밀번호를 입력해주세요';
			mpwSpan.style.color = 'red';
			pw_check = false;
		}else if(!regRs){
			mpwSpan.innerHTML ='비밀번호는 8자 이상 영문 소문자, 영문 대문자, 숫자, 특수문자를 사용해야합니다.<br>특수문자는 !,@,#,$,%,^,&,* 만 가능합니다.';
			mpwSpan.style.color = 'red';
			pw_check = false;
		}else{
			mpwSpan.innerHTML = '사용가능합니다.';
			mpwSpan.style.color = 'green';
			pw_check = true;
		}
	}
	//비밀번호 확인
	function checkPwRe(){
		let mpw = document.getElementById("mpw");
		let mpwRe = document.getElementById("mpwRe");
		let confirmPw = mpw.value == mpwRe.value;
		let mpwReSpan = document.getElementById("mpwReSpan"); 
		if(mpwRe.value == "" || mpwRe.value === null || mpwRe.value === undefined){
			mpwReSpan.innerHTML = '비밀번호를 입력해주세요';
			mpwReSpan.style.color = 'red';
			pwRe_check = false;
		}else if(!confirmPw){
			mpwReSpan.innerHTML = '비밀번호가 같지 않습니다.';
			mpwReSpan.style.color = 'red';
			pwRe_check = false;
		}else{
			mpwReSpan.innerHTML = '비밀번호가 같습니다.';
			mpwReSpan.style.color = 'green';
			pwRe_check = true;
		}
	}
	
	//닉네임(중복확인)
	function checkNickNm(obj){
		let regId = /^[a-zA-Z가-힣][a-zA-Z가-힣0-9]{3,14}$/g;
		let regRs = regId.test(obj.value); 
		let mnickNmSpan = document.getElementById("mnickNmSpan"); 
			
		$.ajax({
			url : "checkNickNm",
			type : "post",
			data : {nick : $("#mnickNm").val()},
			success : function(data){
			let result = data.trim();
			
			if(obj.value == "" || obj.value === null || obj.value === undefined){
				mnickNmSpan.innerHTML = '닉네임을 입력해주세요.';
				mnickNmSpan.style.color = 'red';
				nickNm_check = false;
			}else if(!regRs){
				mnickNmSpan.innerHTML = '4자 이상 한글, 영문, 숫자만 사용가능합니다.';
				mnickNmSpan.style.color = 'red';
				nickNm_check = false;

			}else if(result == 1){
				mnickNmSpan.innerHTML = '이미 존재하는 닉네임입니다.';
				mnickNmSpan.style.color = 'red';
				nickNm_check = false;
			}else{
				mnickNmSpan.innerHTML = '사용가능합니다.';
				mnickNmSpan.style.color = 'green';
				nickNm_check = true;
			}
		},error:function(){
			console.log("error");
			nickNm_check = false;
		}
			
		});
	}
	
	//이름
	function checkName(obj){
		let regId = /^[가-힣]{2,8}$/;
		let regRs = regId.test(obj.value); 
		let mnameSpan = document.getElementById("mnameSpan"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mnameSpan.innerHTML = '이름을 입력해주세요';
			mnameSpan.style.color = 'red';
			name_check = false;
		}else if(!regRs){
			mnameSpan.innerHTML = '한글만 사용가능합니다.';
			mnameSpan.style.color = 'red';
			name_check = false;
		}else{
			mnameSpan.innerHTML = '사용가능합니다.';
			mnameSpan.style.color = 'green';
			name_check = true;
		}
	}
	
	//생년월일
	function checkBirth(obj){
		let regId = /^(19|20)\d\d(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
		let regRs = regId.test(obj.value); 
		let mbirthSpan = document.getElementById("mbirthSpan"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mbirthSpan.innerHTML = '생년월일 8자리를 입력해주세요.';
			mbirthSpan.style.color = 'red';
			birth_check =  false;
		}else if(!regRs){
			mbirthSpan.innerHTML = '생년월일 8자리를 숫자로 입력해주세요.';
			mbirthSpan.style.color = 'red';
			birth_check = false;
		}else{
			mbirthSpan.innerHTML = '사용가능합니다.';
			mbirthSpan.style.color = 'green';
			birth_check = true;
		}
	}
	
	//휴대폰번호
	function checkPhone(obj){
		let regId = /^\d{10,11}$/g;
		let regRs = regId.test(obj.value); 
		let mphoneSpan = document.getElementById("mphoneSpan"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mphoneSpan.innerHTML = '휴대폰번호번호를 입력해주세요.';
			mphoneSpan.style.color = 'red';
			phone_check = false;
		}else if(!regRs){
			mphoneSpan.innerHTML = '10~11자리 숫자를 입력해주세요.';
			mphoneSpan.style.color = 'red';
			phone_check = false;
		}else{
			mphoneSpan.innerHTML = '사용가능합니다.';
			mphoneSpan.style.color = 'green';
			phone_check = true;
		}
	}
	
	//성별
	function checkGender(obj){
		let mgender = document.frm.mgender;
		let mgenderSpan = document.getElementById("mgenderSpan"); 
		if(mgender.value == "" || mgender.value === null || mgender.value === undefined){
			mgenderSpan.innerHTML = '성별을 선택해주세요.';
			mgenderSpan.style.color = 'red';
			gender_check = false;
		}else{
			mgenderSpan.innerHTML = '';
			gender_check = true; 
		}
	}
	
	//이메일(중복확인)
	function checkEmail(obj){
		let regEmail = /^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		let regRs = regEmail.test(obj.value);
		let memailSpan = document.getElementById("memailSpan");
			
		$.ajax({
			url : "checkEmail",
			type : "post",
			data : {email : $("#memail").val()},
			success : function(data){
				let result = data.trim();
				
				if(obj.value == "" || obj.value === null || obj.value === undefined){
					memailSpan.innerHTML = '이메일을 입력해주세요.';
					memailSpan.style.color = 'red';
					email_check = false;
				}else if(!regRs){
					memailSpan.innerHTML = '이메일 형식에 맞춰 입력해주세요.';
					memailSpan.style.color = 'red';
					email_check  = false;
				}else if(result == 1){
					memailSpan.innerHTML = '이미 존재하는 이메일입니다.';
					memailSpan.style.color = 'red';
					email_check  = false;
				}else{
					memailSpan.innerHTML = '사용 가능한 이메일입니다.';
					memailSpan.style.color = 'green';
					email_check  = true;
				}
			},error:function(){
				console.log("error");
				email_check  = false;
			}
		});
	}
	
    </script>
  </head>
  <body>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
             <!-- Logo -->
              <div class="app-brand justify-content-center toplogo">
                <a href="<%=request.getContextPath() %>/" class="app-brand-link gap-2">
                  <span class="app-brand-text demo text-body fw-bolder">dflix</span>
                </a>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="card mb-8">
                    <h5 class="card-header center fw-semibold d-block">회원가입</h5>
                    
                    <!-- 회원가입 상세 -->
                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" name="frm" class="joinform" action="joinOk" method="POST" onsubmit="return false;">
                        <div class="row">
                          <div class="mb-3 col-md-10">
                            <label for="mid" class="form-label block text-light fw-semibold">
                            	아이디
                            </label>
                            <input
                              class="form-control reinput"
                              type="text"
                              id="mid"
                              name="mid"
                              oninput="checkId(this);"
                              autofocus
                            />
                            <span id="midSpan"></span>
                          </div>
                         
                          <div class="mb-3 col-md-8">
                            <label for="mname" class="form-label  block text-light fw-semibold">이름</label>
                            <input 
                            	class="form-control" 
                            	type="text" 
                            	name="mname" 
                            	id="mname"
                           		oninput="checkName(this);" 	 
                           />
                           <span id="mnameSpan"></span>
                          </div>
                          
                          <div class="mb-3 col-md-8">
                            <label for="mpw" class="form-label block text-light fw-semibold">비밀번호</label>
                            <input
                              type="password"
                              class="form-control"
                              id="mpw"
                              name="mpw"
                              oninput="checkPw(this);checkPwRe();"
                            />
                            <span id="mpwSpan"></span>
                          </div>
                          <div class="mb-3 col-md-8">
                            <label for="mpwRe" class="form-label block text-light fw-semibold">비밀번호 확인</label>
                            <input
                              type="password"
                              class="form-control"
                              id="mpwRe"
                              name="mpwRe"
                              oninput="checkPwRe();"
                            />
                            <span id="mpwReSpan"></span>
                          </div>
                          
						<div class="mb-3 col-md-10">
                            <label for="mnickNm" class="form-label block text-light fw-semibold">닉네임</label>
                            <input 
                            	class="form-control reinput" 
                            	type="text" 
                            	name="mnickNm" 
                            	id="mnickNm"
                            	oninput="checkNickNm(this);" 
                            />
                            <span id="mnickNmSpan"></span>
                          </div>
                          
                          <div class="mb-3 col-md-10">
                            <label for="memail" class="form-label block text-light fw-semibold">E-mail</label>
                            <input
                              class="form-control reinput"
                              type="email"
                              id="memail"
                              name="memail"
                              oninput="checkEmail(this);"
                            />
                            <span id="memailSpan"></span>
                          </div>
                          
                          <div class="mb-3 col-md-8">
                            <label class="form-label block text-light fw-semibold" for="mphone">휴대폰번호</label>
                            <div class="input-group input-group-merge">
                              <input
                                type="text"
                                id="mphone"
                                name="mphone"
                                class="form-control"
                                oninput="checkPhone(this);"
                              />
                            </div>
                            <span id="mphoneSpan"></span>
                          </div>
                          
                          <div class="mb-3 col-md-8">
                            <label class="form-label block text-light fw-semibold" for="mbirth">생년월일</label>
                            <div class="input-group input-group-merge">
                              <input
                                type="text"
                                id="mbirth"
                                name="mbirth"
                                class="form-control"
                                placeholder="8글자로 쓰세요"
                                oninput="checkBirth(this);"
                              />
                            </div>
                            <span id="mbirthSpan"></span>
                          </div>
                       
                        <div class="mb-3 col-md-8">
                          <small class="text-light fw-semibold d-block">성별</small>
                          <div class="form-check form-check-inline mt-3">
                            <input
                              class="form-check-input"
                              type="radio"
                              name="mgender"
                              id="mgender_m"
                              value="m"
                              onclick="checkGender(this)"
                            />
                            <label class="form-check-label" for="mgender_m">남</label>
                          </div>
                          <div class="form-check form-check-inline">
                            <input
                              class="form-check-input"
                              type="radio"
                              name="mgender"
                              id="mgender_f"
                              value="f"
                              onclick="checkGender(this)"
                            />
                            <label class="form-check-label" for="mgender_f">여</label>
                          </div>
                          <span id="mgenderSpan"></span>
                        </div>
                        
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2" onclick="validation();">회원가입</button>
                          <button type="reset" class="btn btn-outline-secondary">리셋</button>
                        </div>
                       	</div>
                      </form>
                  </div>

                </div>
              </div>
            </div>
            <!-- / Content -->
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->

    <!-- JS -->
    <script src="<%=request.getContextPath() %>/resources/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/resources/popper/popper.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/resources/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/menu.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/pages-account-settings-account.js"></script>

  </body>
</html>
