let inputTicketNo = document.querySelectorAll("#ticketNo");

inputTicketNo.forEach((element, index) => { // 수정: index를 명시적으로 선언
    let ticketNoValue = parseInt(element.value);

    let parentDiv = element.parentElement.parentElement; 
    let noSpan = parentDiv.querySelector(".no"); 
    let aTag = parentDiv.querySelector("a"); 

    if (ticketNoValue > 0) { 
        noSpan.innerText = "X"; 
        aTag.style.pointerEvents = "none"; 
        noSpan.style.backgroundColor = "black"; 
    }
});

document.addEventListener("DOMContentLoaded", function() {
    let resetButton = document.querySelector('.button-reset');
    
    resetButton.addEventListener('click', function() {
        location.reload();
    });
});
