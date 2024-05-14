// 영화 예매율 순 정렬
function rankSelect() {
    let rankElement = document.getElementById("rank");
    let abcElement = document.getElementById("abc");
    
    if (abcElement.className === "abc-select background-on" && rankElement.className === "rank-select") {
        rankElement.className += " background-on";
        abcElement.className = "abc-select";
    }
}

// 영화 가나다 순 정렬
function abcSelect() {
let rankElement = document.getElementById("rank");
let abcElement = document.getElementById("abc");

if (rankElement.className === "rank-select background-on" && abcElement.className === "abc-select") {
    rankElement.className = "rank-select";
    abcElement.className += " background-on";
}
}

// 영화 등급 이미지 가져오기
document.addEventListener("DOMContentLoaded", function() {
let movieAges = document.querySelectorAll('.movieAge');

movieAges.forEach(function(movieAge) {
    let age = movieAge.textContent.trim();
    if (age === '전체관람가') {
        movieAge.style.backgroundImage = 'url(../resources/movieAge/all.png)';
    } else if(age === '18세관람가(청소년관람불가)'){
        movieAge.style.backgroundImage = 'url(../resources/movieAge/18.png)';
    } else if(age === '12세관람가'){
        movieAge.style.backgroundImage = 'url(../resources/movieAge/12.png)';
    } else if(age === '15세관람가'){
        movieAge.style.backgroundImage = 'url(../resources/movieAge/15.png)';
    }
});
});

// 영화관 날짜
let todayDate = new Date();

let currentYear = todayDate.getFullYear();
let currentMonth = todayDate.getMonth() + 1; // getMonth는 0부터 시작하므로 1을 더해줌
let currentDay = todayDate.getDate();
function currentDayKR(year, month, day) { // 날짜의 요일을 가져오는 함수
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    const date = new Date(year, month - 1, day);
return days[date.getDay()];
}

// 2주 후 날짜 계산
let futureDate = new Date(todayDate.getTime() + 14 * 24 * 60 * 60 * 1000);
let futureYear = futureDate.getFullYear();
let futureMonth = futureDate.getMonth() + 1;
let futureDay = futureDate.getDay();
function futureDayKR(year, month, day) { // 날짜의 요일을 가져오는 함수
    const days = ['일', '월', '화', '수', '목', '금', '토']; // [0, 1, 2, 3, 4, 5, 6]
    const date = new Date(year, month - 1, day);
return days[date.getDay()];
}

// HTML에 현재 날짜 정보 추가
// class="date-list-ul"인 ul태그 불러오기
const listItems = document.getElementsByClassName('date-list-ul')[0];

// 이전 월을 저장
let previousMonth = null;

// 2주 기간동안의 날짜 반복문
for(let i = todayDate.getTime(); i < futureDate.getTime(); i += 24 * 60 * 60 * 1000){
    const date = new Date(i);
    currentYear = date.getFullYear();
    currentMonth = date.getMonth() + 1;
    currentDay = date.getDate();
    const currentDayOfKR = currentDayKR(currentYear, currentMonth, currentDay);
    const hiddenYear = date.getFullYear();
    const hiddenMonth = date.getMonth() + 1;
    const hiddenDay = date.getDate();
    const currentHiddenDay = `${hiddenYear}`+
                              `${hiddenMonth >= 10 ? hiddenMonth : '0' + hiddenMonth}`+
                              `${hiddenDay >= 10 ? hiddenDay : '0' + hiddenDay}`;

    if(currentMonth !== previousMonth){
        previousMonth = currentMonth;

        const yearMonth = document.createElement('li');
        yearMonth.classList.add('date-yearMonth');
        listItems.appendChild(yearMonth);

        const divTag = document.createElement('div');
        yearMonth.appendChild(divTag);

        const yearSpan = document.createElement('span');
        yearSpan.classList.add('year');
        yearSpan.textContent = currentYear;
        divTag.appendChild(yearSpan);

        const monthSpan = document.createElement('span');
        monthSpan.textContent = currentMonth;
        monthSpan.classList.add('month');
        divTag.append(monthSpan);
    }

    const dateDay = document.createElement('li');
    dateDay.classList.add('date-day');
    listItems.append(dateDay);

    const aTag = document.createElement('a');
        aTag.href = "#";
        aTag.onclick = function() {
            return false;
        };
    dateDay.appendChild(aTag);

    
    const dayWeekSpan = document.createElement('span');
    if(currentDayOfKR == "토"){
        dayWeekSpan.classList.add('satDayWeek');    
    }else if(currentDayOfKR == "일"){
        dayWeekSpan.classList.add('sunDayWeek');
    }
    dayWeekSpan.classList.add('dayWeek');
    dayWeekSpan.textContent = currentDayOfKR;
    aTag.append(dayWeekSpan);

    const daySpan = document.createElement('span');
    if(currentDayOfKR == "토"){
        daySpan.classList.add('satDay');
    }else if(currentDayOfKR == "일"){
        daySpan.classList.add('sunDay');
    }
    daySpan.classList.add('day');
    daySpan.textContent = currentDay;
    aTag.append(daySpan);

    const sreaderSpan = document.createElement('span');
    sreaderSpan.classList.add('sreader');
    sreaderSpan.textContent = currentHiddenDay;
    aTag.append(sreaderSpan);
}