
let today = new Date();

let year = today.getFullYear(); // 년도

$(function() {
	$('input[name="attendday"]').daterangepicker({
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 2022,
		maxYear: 2027,
		locale: {
			format: 'YYYYMMDD'
			
		}
		
		
	});
	
	
});



function modalFn(){
	document.getElementById("attendday2").value = document.getElementById("attendday").value;
	document.forms['modal'].submit();
}


function screenDeleteFn(sno){
	if(confirm("삭제하시겠습니까?")){
		document.getElementById("sno").value = sno;
		document.getElementById("attendday3").value = document.getElementById("attendday").value;
		document.forms['screenDeleteForm'].submit();
	}
}

