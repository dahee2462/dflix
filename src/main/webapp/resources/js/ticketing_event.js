document.addEventListener("DOMContentLoaded", function() {
	let movieItems = document.querySelectorAll('.movie-list-ul li');

	movieItems.forEach(function(movieItem) {
        movieItem.addEventListener('click', function() {
            // 선택한 영화 제목
            let ticketMovie = movieItem.querySelector('.text').innerHTML;
            let ticketMovieCode = movieItem.querySelector('.sreader').innerHTML;

            console.log(ticketMovie);
            console.log(ticketMovieCode);
            
            // 진행버튼에 movieTitle 추가
            let selectionMovieTitle = document.getElementById('selectionMovieTitle');
            selectionMovieTitle.innerHTML = ticketMovie;

            // class 변경(추가 / 제거)
            let previousSelectedItem = document.querySelector('.selected-movie');
            let textSpan = movieItem.querySelector('.text');
           
            if (previousSelectedItem) {
                previousSelectedItem.classList.remove('selected-movie');
                let textWhiteSpan = previousSelectedItem.querySelector('.white');
                
                if(textWhiteSpan){
                	textWhiteSpan.classList.remove('white');
            	}
            }
            textSpan.classList.add('white');
            movieItem.classList.add('selected-movie');
            // class 변경(추가 / 제거)

            if(tno > 0 && sday == ""){
                let previousSelectedDate = document.querySelector('.selected-date-day');
                let whiteSpans = previousSelectedDate ? previousSelectedDate.querySelectorAll('.white') : [];

                divTimelist = document.querySelector(".time-list");

                // 이전에 선택된 요소의 클래스와 하위 요소 클래스 제거
                if (previousSelectedDate) {
                    previousSelectedDate.classList.remove('selected-date-day');
                    whiteSpans.forEach(span => span.classList.remove('white'));
                }

                divTimelist.innerHTML = "날짜를 선택해주시기 바랍니다.";
            }else if(cno > 0 && tno > 0 && sday != ""){
                selDay(sday);
            }

            $.ajax({
                url: 'movieCode',
                type: 'POST',
                data: {movieCode: ticketMovieCode},
                success: function(data){
                    console.log("success");
                    console.log(data);
                        let html = "";
                        for (let i = 0; i < data.length; i++) {
                        html += '<img src="'+data[i].cposter+
                                '" alt="'+data[i].cname+'포스터" style="display: inline;">';
                        $(".movie_poster").html(html);
                        $("#cposter").val(data[i].cposter);
                        $("#cname").val(data[i].cname);

                        let divMovieRating = "";
                        divMovieRating += '<span class="data">'+data[i].cwatchGradeNm+'</span>';
                        $(".movie_rating").html(divMovieRating);

                        $("#cno").val(data[i].cno);
                        $("#cwatchGradeNm").val(data[i].cwatchGradeNm);
                        }
                },
                error: function(){
                    console.log("error");
                }
            });

            selCno(ticketMovieCode);
        });
    });
});

    
document.addEventListener("DOMContentLoaded", function() {
	let theaterItems = document.querySelectorAll('.theater-list-ul li');

	theaterItems.forEach(function(theaterItem) {
            theaterItem.addEventListener('click', function() {
                let ticketTheater = theaterItem.querySelector('.text').innerHTML;
                let ticketTheaterNo = theaterItem.querySelector('.sreader').innerHTML;

                console.log(ticketTheaterNo);
                
                let selectionTheater = document.getElementById('selectionTheater');
                selectionTheater.innerHTML = ticketTheater;
                
                // class 변경(추가 / 제거)
                let previousSelectedItem = document.querySelector('.selected-theater');
                let textSpan = theaterItem.querySelector('.text');
                
                if (previousSelectedItem) {
                    previousSelectedItem.classList.remove('selected-theater');
                    let textWhiteSpan = previousSelectedItem.querySelector('.white');
                    
	                if(textWhiteSpan){
                        textWhiteSpan.classList.remove('white');
	            	}
                }
                
                textSpan.classList.add('white');
                theaterItem.classList.add('selected-theater');
                // class 변경(추가 / 제거)

                let inputTname = document.getElementById("tname");
                let inputTno = document.getElementById("tno");
                inputTname.value = ticketTheater;
                inputTno.value = ticketTheaterNo;

                if(sday == ""){
                    let previousSelectedDate = document.querySelector('.selected-date-day');
                    let whiteSpans = previousSelectedDate ? previousSelectedDate.querySelectorAll('.white') : [];

                    // 이전에 선택된 요소의 클래스와 하위 요소 클래스 제거
                    if (previousSelectedDate) {
                        previousSelectedDate.classList.remove('selected-date-day');
                        whiteSpans.forEach(span => span.classList.remove('white'));
                    }
                }

                
                $.ajax({
                    url: 'tiketTheaterNo',
                    type: 'POST',
                    data: {tnoParam: ticketTheaterNo},
                    success: function(data){
                        console.log(data);
                        let html = "";
                        if(cno > 0 ){
                            for (let i = 0; i < data.length; i++) {
                                html += '<div class="time-theater">';
                                html += '<span class="title">';
                                html += '<span class="name">' + data[i].shallType + '</span>';
                                html += '<span class="floor">' + data[i].shallLocation + '</span>';
                                html += '<span class="seatcount">(총' + data[i].shallSeat + '석)</span>';
                                html += '</span>';
                                html += '</div>';

                                
                            }
                            $(".time-list").html(html);    
                        }else if(cno == 0 && sday != ""){
                            divTimelist = document.querySelector(".time-list");

                            divTimelist.innerHTML = "영화를 선택해주시기 바랍니다.";
                        }else{
                            divTimelist = document.querySelector(".time-list");

                            divTimelist.innerHTML = "영화, 날짜를 선택해주시기 바랍니다.";
                        }

                    },
                    error: function(){
                        console.log("error");
                    }
                });
            

                selTno(ticketTheaterNo);
            });
        });
    });

document.addEventListener("DOMContentLoaded", function() {
    let dateItems = document.querySelectorAll('.date-list-ul li.date-day');

    dateItems.forEach(function(dateItem) {
        dateItem.addEventListener('click', function() {
            let ticketKRDay = dateItem.querySelector('a span:nth-of-type(1)').innerHTML;
            let ticketDay = dateItem.querySelector('a span:nth-of-type(3)').innerHTML;
            let dateDay = document.getElementById('dateDay');

            let clickYear = ticketDay.substring(0, 4);
            let clickMonth = ticketDay.substring(4, 6);
            let clickDay = ticketDay.substring(6, 8);

            let formatteTicketDay = clickYear+'.'+clickMonth+'.'+clickDay;
            console.log(ticketKRDay);
            console.log(formatteTicketDay);

            let previousSelectedItem = document.querySelector('.selected-date-day');
            let whiteSpans = previousSelectedItem ? previousSelectedItem.querySelectorAll('.white') : [];

            // 이전에 선택된 요소의 클래스와 하위 요소 클래스 제거
            if (previousSelectedItem) {
                previousSelectedItem.classList.remove('selected-date-day');
                whiteSpans.forEach(span => span.classList.remove('white'));
            }

            // 클릭한 요소에 클래스 추가
            dateItem.classList.add('selected-date-day');
            dateDay.innerText = formatteTicketDay+"("+ticketKRDay+")";
            
            let inputDateDay = document.getElementById("inputDateDay");
            inputDateDay.value = formatteTicketDay+"("+ticketKRDay+")";
            
            // 클릭한 요소의 하위 요소에 클래스 추가
            let dayWeek = dateItem.querySelector('.dayWeek');
            let day = dateItem.querySelector('.day');
            let satDayWeek = dateItem.querySelector('.satDayWeek');
            let satDay = dateItem.querySelector('.satDay');
            let sunDayWeek = dateItem.querySelector('.sunDayWeek');
            let sunDay = dateItem.querySelector('.sunDay');

            if (dayWeek && day) {
                dayWeek.classList.add('white');
                day.classList.add('white');
            } else if (satDayWeek && satDay) {
                satDayWeek.classList.add('white');
                satDay.classList.add('white');
            } else if (sunDayWeek && sunDay) {
                sunDayWeek.classList.add('white');
                sunDay.classList.add('white');
            }

            let inputSday = document.getElementById("sday");
            inputSday.value = ticketDay;

            if(tno > 0 && cno == 0){
                divTimelist = document.querySelector(".time-list");

                divTimelist.innerHTML = "영화를 선택해주시기 바랍니다.";
            }
            
            selDay(ticketDay);
            
        });
    });
});

// 이벤트 초기화
document.addEventListener("DOMContentLoaded", function() {
    let resetButton = document.querySelector('.button-reset');
    
    resetButton.addEventListener('click', function() {
        location.reload();
    });
});


let today = new Date();
let getYear = today.getFullYear();
let getMonth = today.getMonth() + 1;
let getYesterDay = today.getDate() - 1;
let nowHour = today.getHours();
let nowMinute = today.getMinutes();
let hours = (nowHour < 10 ? "0" : "") + nowHour;
let minutes = (nowMinute < 10 ? "0" : "") + nowMinute;
let timeString = hours + ":" + minutes; // 현재시간

const yesterday = `${getYear}-`+
                  `${getMonth >= 10 ? getMonth : '0' + getMonth}-`+
                  `${getYesterDay >= 10 ? getYesterDay : '0' + getYesterDay}`;

let cno = 0; //영화번호 
let tno = 0;
let sday = "";


function selCno(value){
    cno = value;
}

function selTno(value){
    tno = value;
}

function selDay(ticketDay){
    sday = ticketDay;
    console.log(sday);
    
    if(cno > 0 && tno > 0 && sday > yesterday){
        console.log("cno : "+cno);
        console.log("tno : "+tno);
        console.log("sday : "+sday);

        $.ajax({
            url: 'selectScreen',
            type: 'POST',
            data: {cnoParam: cno, tnoParam: tno, sday: sday},
            success: function (data) {
                console.log("success");
                console.log(data);
                let html = "";
                let previousShallType = "";
                let previousShallLocation = "";
                if(data.length > 0){
                for (let i = 0; i < data.length; i++) {
                    let currentShallType = data[i].shallType;
                    let currentShallLocation = data[i].shallLocation;
                    let currentShallseat = data[i].shallSeat;

                    if (currentShallType !== previousShallType ||
                        currentShallLocation !== previousShallLocation ||
                        currentShallseat !== currentShallseat) {
                        
                        if (html !== "") {
                            // 이전에 생성된 내용이 있다면 ul 태그를 닫아야함.
                            html += '</ul>';
                            html += '</div>';
                        }

                        html += '<div class="time-theater">';
                        html += '<span class="title">';
                        html += '<span class="name" id="currentShallType">' + currentShallType + '</span>';
                        html += '<span class="floor" id="currentShallLocation">' + currentShallLocation + '</span>';
                        html += '<span class="seatcount">(총' + data[i].shallSeat + '석)</span>';
                        html += '</span>';
                        html += '<ul>';
                    }
                        html += '<li>';
                        html += '<a class="button" href="" onclick="return false;" title="">';
                        html += '<span class="time">';
                        html += '<span id="dataSstartTime">' + data[i].sstartTime + '</span>';
                        html += '<input type="hidden" id="inputSno" value="'+data[i].sno+'">';
                        html += '<input type="hidden" id="inputShallno" value="'+data[i].shallno+'">';
                        html += '<input type="hidden" id="inputSendTime" value="'+data[i].sendTime+'">';
                        html += '</span>';
                        html += '</a>';
                        html += '</li>';
                        
                        // 이전 값을 업데이트합니다.
                        previousShallType = currentShallType;
                        previousShallLocation = currentShallLocation;
                }

                // 마지막으로 열려있는 ul 태그를 닫습니다.
                if (html !== "") {
                    html += '</ul>';
                }
                html += '</div>';

                $(".time-list").html(html); // 화면에 표시
                
                let timeItems = document.querySelectorAll('.time');

                timeItems.forEach(function(timeItem) {
                    timeItem.addEventListener('click', function() {
                        let previousSelectedItem = document.querySelector('.selected-time-theater');
                        let textSpan = timeItem.querySelector('span');
                        

                        let dateTimeText = timeItem.querySelector('span').innerHTML;
                        let dateTime = document.getElementById('dateTime');
                        
                        if (previousSelectedItem) {
                            previousSelectedItem.classList.remove('selected-time-theater');
                            let textWhiteSpan = previousSelectedItem.querySelector('.white');
                            
                            if(textWhiteSpan){
                                textWhiteSpan.classList.remove('white');
                            }
                        }

                        timeItem.classList.add('selected-time-theater');
                        textSpan.classList.add('white');
                        dateTime.innerText = dateTimeText;

                        let startTimeElements = timeItem.querySelectorAll('.time-theater .time #dataSstartTime');
                        let parentTimeTheater = startTimeElements[0].closest('.time-theater');
                        let currentShallType = parentTimeTheater.querySelector('.title .name').textContent;
                        let currentShallLocation = parentTimeTheater.querySelector('.title .floor').textContent;

                        let selShallType = document.getElementById("selShallType");
                        let selShallLocation = document.getElementById("selShallLocation");
                        selShallType.innerText = currentShallType;
                        selShallLocation.innerText = currentShallLocation;

                        let clickShallno = timeItem.querySelector('#inputShallno').value;
                        let clickSno = timeItem.querySelector('#inputSno').value;
                        let clickSendTime = timeItem.querySelector('#inputSendTime').value;

                        let sstartTime = document.getElementById("sstartTime");
                        sstartTime.value = dateTimeText;

                        let sendTime = document.getElementById("sendTime");
                        sendTime.value = clickSendTime;
                        
                        let inputShallno = document.getElementById("shallno");
                        inputShallno.value = clickShallno;

                        let inputSno = document.getElementById("sno");
                        inputSno.value = clickSno;
                        
                        let inputShallType = document.getElementById("shallType");
                        inputShallType.value = currentShallType;
                        
                        let inputShallLocation = document.getElementById("shallLocation");
                        inputShallLocation.value = currentShallLocation;
                    });
                });
            }else{
                let divTimelist = document.querySelector(".time-list");

                divTimelist.innerHTML = "해당 날짜에 상영 영화는 없습니다."
                                        +"<br>"
                                        +"다른 날짜를 선택해주시기 바랍니다.";
            }
        
        },
            error: function () {
                console.log("error");
            }
        });
        
    }
}

