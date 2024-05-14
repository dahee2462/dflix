let selectedCount = 0;

let inputSeats = document.getElementById('seats');
let inputSseatNos = document.getElementById('sseatNos');
console.log("inputsseatnos::"+inputSseatNos)
let inputPersonNum = document.getElementById('personNum');

document.addEventListener("DOMContentLoaded", function() {
    let personNumbers = document.querySelectorAll('.personAdult li');
    let clickNumber = document.getElementById('personNumber');

    personNumbers.forEach(function(personNumberItem) {
        personNumberItem.addEventListener('click', function() {
            // 모든 요소의 클래스와 스타일 초기화
            personNumbers.forEach(function(item) {
                item.classList.remove('selected');
                let aTag = item.querySelector('a');
                if (aTag) {
                    aTag.style.color = ''; // 초기화
                }
            });

            selectedCount = parseInt(personNumberItem.getAttribute('data-count'));
            console.log("인원수::"+selectedCount);

            // 선택된 요소에 클래스 추가하고 스타일 변경
            personNumberItem.classList.add('selected');
            let aTag = personNumberItem.querySelector('a');
            if (aTag) {
                aTag.style.color = 'white';
            }

            clickNumber.innerText = selectedCount+"명";
            inputPersonNum.value = selectedCount;
        });
    });
});

// 좌석 정보를 담을 배열
let selectedSeats = [];
let selectedSeatNos = [];
let selectCno = $('#cno').val();
let selectSstartTime = $('#sstartTime').val();
let selectSno = $('#sno').val();

function updateSelectedCounts() {
    return selectedCount;
}

// 좌석 선택 핸들러 함수
function handleSeatSelection(seat, data) {
    let seatItem = seat.querySelector('.no');
    if (!seatItem) {
        console.error("Seat number element not found.");
        return;
    }
    let seatNo = seatItem.innerText;
    
    let rowElement = seat.closest('.row');
    if (!rowElement) {
        console.error("Row element not found.");
        return;
    }
    let seatCol = rowElement.querySelector('.label').innerText;

    let clickSeat = seatCol + seatNo;
    let clickSeatNo = seat.querySelector('.mod').innerText;

    // 이미 선택된 좌석인지 확인
    let isSelected = selectedSeats.includes(clickSeat);

    // 서버로부터 받은 데이터와 선택된 좌석의 번호를 비교하여 이미 예약된 좌석인지 확인
    let isReserved = data.some(function(seatData) {
        return seatData.sseatno === clickSeatNo;
    });

    // 선택된 좌석이 아니라면 선택 상태로 변경하고 선택된 좌석 배열에 추가
    if (!isReserved && !isSelected && selectedSeats.length < updateSelectedCounts()) {
        selectedSeats.push(clickSeat);
        seatItem.classList.add('selected-seat');
        selectedSeatNos.push(clickSeatNo);
        inputSeats.value = selectedSeats;
        inputSseatNos.value = selectedSeatNos;
    } else if (isSelected) {
        // 이미 선택된 좌석이라면 선택 상태를 해제하고 선택된 좌석 배열에서 제거
        let index = selectedSeats.indexOf(clickSeat);
        if (index !== -1) {
            selectedSeats.splice(index, 1);
            seatItem.classList.remove('selected-seat');
            selectedSeatNos.splice(selectedSeatNos.indexOf(clickSeatNo), 1);
            inputSeats.value = selectedSeats;
            inputSseatNos.value = selectedSeatNos;
        }
    } else {
        alert("이미 선택된 좌석이거나 선택된 인원 수와 일치하지 않습니다.");
    }
}

document.addEventListener("DOMContentLoaded", function() {
    // 좌석 선택을 위한 이벤트 리스너 추가
    let seats = document.querySelectorAll(".seat");
    seats.forEach(function(seat) {
        seat.addEventListener('click', function() {
            // 좌석을 클릭할 때 서버로부터 좌석 예약 정보를 가져옴
            $.ajax({
                url: 'reservationCheck',
                type: 'POST',
                data: { 
                    cnoParam: selectCno, 
                    sstartTimeParam: selectSstartTime,
                    snoParam: selectSno
                },
                success: function(data) {
                    // 좌석 선택 핸들러 함수 호출
                    handleSeatSelection(seat, data);
                },
                error: function() {
                    console.log("error");
                }
            });
        });
    });
});
