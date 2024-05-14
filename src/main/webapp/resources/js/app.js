$(function(){
	if (!sessionStorage.getItem("ssid") && !sessionStorage.getItem("tokn") && localStorage.getItem("AutoLoginKey")) {
		$.ajax({
			url: "/member/auto_login.do",
			type: "POST",
			data: {
				cgid: sessionStorage.getItem("cgid"),
				AutoLoginKey: localStorage.getItem("AutoLoginKey")
			},
			success: function (rst) {
				if (rst.RetCode == "success") {
					sessionStorage.setItem("ssid", rst.SessionID);
					sessionStorage.setItem("tokn", rst.SessionToken);
				} else {
					localStorage.setItem("AutoLoginKey", "");
				}
			}
		});
	}
		
	if ($.datepicker !== undefined) {
		$.datepicker.setDefaults({
			dateFormat: "yy-mm-dd", //날짜 포맷
			prevText: "이전 달",
			nextText: "다음 달",
			closeText: "닫기",
			currentText: "오늘",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			dayNames: ["일", "월", "화", "수", "목", "금", "토"],
			dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
			dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
			showMonthAfterYear: true, // true : 년 월	false : 월 년 순으로 보여줌
			yearSuffix: "년", //
			showButtonPanel: false, // 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
		});
	}
});

$(document).on("input", ".onlyNumber", function() {
	$(this).val($(this).val().replace(/[^0-9]/g, ""));
});

// 링크
function goLink(url, param) {
	var storage = [];
	if (sessionStorage.getItem("cgid")) {
		storage.push("cgid=" + sessionStorage.getItem("cgid"));
	}
	if (sessionStorage.getItem("ssid")) {
		storage.push("ssid=" + sessionStorage.getItem("ssid"));
	}
	if (sessionStorage.getItem("tokn")) {
		storage.push("tokn=" + sessionStorage.getItem("tokn"));
	}
	if (sessionStorage.getItem("hold")) {
		storage.push("hold=" + sessionStorage.getItem("hold"));
	}
	
	if (param === undefined || param == "") {
		window.location.href = url + "?" + storage.join("&");
	} else {
		window.location.href = url + "?" + storage.join("&") + "&" + param;	
	}
}
// 링크
function logout(url, param) {
	sessionStorage.setItem("ssid", "");
	sessionStorage.setItem("tokn", "");
	
	goLink(url, param);
}

// post
function goPost(url, param) {
	var nform = $('<form/>', {method: "post", action: url, target: "_self"});
	if (sessionStorage.getItem("cgid")) {
		nform.append($('<input/>', {type: 'hidden', name: 'cgid', value: sessionStorage.getItem("cgid")}));	
	}
	if (sessionStorage.getItem("ssid")) {
		nform.append($('<input/>', {type: 'hidden', name: 'ssid', value: sessionStorage.getItem("ssid")}));
	}
	if (sessionStorage.getItem("tokn")) {
		nform.append($('<input/>', {type: 'hidden', name: 'tokn', value: sessionStorage.getItem("tokn")}));
	}
	if (sessionStorage.getItem("hold")) {
		nform.append($('<input/>', {type: 'hidden', name: 'hold', value: sessionStorage.getItem("hold")}));
	}
	
	for (var key in param) {
		if (key != "cgid" && key != "ssid" && key != "tokn" && key != "hold") {
			nform.append($('<input/>', {type: 'hidden', name: key, value: param[key]}));
		}
	}
	nform.appendTo('body');
	nform.submit();
}

// submit 
function goSubmit(url, form) {
	$("#" + form).attr("action", url).submit();
}

// parseInt
function fnParseInt(val) {
	if (isNaN(parseInt(val))) {
		return 0;
	}
	return parseInt(val);
}

// parseString
function fnParseStr(val) {
	if (val === undefined || val === null) {
		return "";
	}
	return String(val);
}

function lpad(str, len , pad) {
	if (pad === undefined || pad == "") {
		pad = "0";
	}
		
	while (str.length < len) {
		str = pad + str;
	}
	return str;
}

// 영화 등급
function getRating(val) {
	var returnVal = "";
	if (val == "") {
		return returnVal;
	}
	
	if (val == "00") {
		returnVal = "all";
	} else if (val == "12" || val == "15") {
		returnVal = val;
	} else if (val == "18" || val == "19") {
		returnVal = "19";
	} else if (val == "98" || val == "99") {
		returnVal = "limit";
	} else {
		returnVal = "limit";
	}
	return returnVal;
}

// 영화 단축 등급명
function getRatingNm(val) {
	var returnVal = "";
	if (val == "") {
		return returnVal;
	}
	
	if (val == "00") {
		returnVal = "전체";
	} else if (val == "12" || val == "15") {
		returnVal = val;
	} else if (val == "18" || val == "19") {
		returnVal = "청불";
	} else if (val == "98" || val == "99") {
		returnVal = "제한";
	} else {
		returnVal = "미정";
	}
	return returnVal;
}

// 영화 전체 등급명
function getRatingTxt(val) {
	var returnVal = "";
	if (val == "") {
		return returnVal;
	}
	
	if (val == "00") {
		returnVal = "전체 관람가";
	} else if (val == "12" || val == "15") {
		returnVal = val + "세 이상 관람가";
	} else if (val == "18" || val == "19") {
		returnVal = "청소년 관람 불가";
	} else if (val == "98" || val == "99") {
		returnVal = "제한 상영가";
	} else {
		returnVal = "미정";
	}
	return returnVal;
}

// 페이지 상단으로이동
function pageTop(){
	$(window).scrollTop(0);
}

//로컬스토리지 설정    
function setLocalStorage( name, value ) {
	var todayDate = new Date();
	localStorage.setItem(name, todayDate.getDate());
}

//로컬스토리지 불러오기
function getLocalStorage( name ) {
	var todayDate = new Date();
	var obj = localStorage.getItem(name);
	if ( obj == null  || (obj != null && obj != todayDate.getDate()) ) {
		return "";
	} else {
	   	return "y";
	}
}

// Modal Alert
function mAlert(txt, cbk) {
	if (cbk !== undefined && cbk != "") {
		$("#mAlert .close-modal").on("click", function() {
			new Function(cbk)();
			$("#mAlert .close-modal").off("click");
		});
	}
	
	$("#mAlert .modal-txt").html(txt);
	$("#mAlert").modal();
}
function oAlert(txt, cbk) {
	if (cbk !== undefined && cbk != "") {
		$("#oAlert .close-modal").on("click", function() {
			new Function(cbk)();
			$("#oAlert .close-modal").off("click");
		});
	}
	
	$("#oAlert .modal-txt").html(txt);
	openModal("oAlert");
}

// 안드로이드 리시브
function jsMessage(txt) {
	new Function(txt)();
}