
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

