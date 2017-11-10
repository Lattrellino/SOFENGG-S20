var currDay, currMonth, currYear, date;

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

function getCurrentDate() {
    currDay = date.getDate();
    currMonth = date.getMonth();
    currFullYear = date.getFullYear();
//    currYear = date.getYear();
//    console.log(day + "/" + month + "/" + year);
}

function loadCalendar(){
    var divMonth = document.getElementById("month-name");
    var ulDays = document.getElementById("days");
    var spanYear = document.getElementById("year");
    var tempListItem;

    var currMonthDays = new Date(currFullYear, currMonth, 0).getDate();
    var firstDay = new Date(currFullYear, currMonth, 1).getDay();

    divMonth.innerHTML = months[currMonth];
    spanYear.innerHTML = currFullYear;
    
    
    console.log(currMonth+1 + " / " + currFullYear + " (" + firstDay + ") ");

    for(var firstDayCounter = 0; firstDayCounter < firstDay; firstDayCounter++){
        tempListItem = document.createElement("li");
        ulDays.appendChild(tempListItem);
    }

    for(var dayCounter = 1; dayCounter <= currMonthDays; dayCounter++){
        
        tempListItem = document.createElement("li");
        tempListItem.innerHTML = dayCounter;
        
        if(dayCounter == currDay){
            tempListItem.style.backgroundColor = "skyblue";
            tempListItem.style.color = "aliceblue";
        }

        ulDays.appendChild(tempListItem);
    }

}

function getSpecificDate(month, year, date){
    return new Date(year, month, date).getDate();    
}

$(document).ready(function(){
    date = new Date();
    getCurrentDate();
    loadCalendar();

    $("#prev-month").click(function(){
        console.log("prev month");

        if(currMonth-1 >=  0 && currMonth-1 < 12){
            currMonth--;
        } else {
            currMonth = 11;
            currFullYear--;
        }


        if(currMonth-1 != null){
            var ulDays = document.getElementById("days");

            while(ulDays.firstChild != null){
                ulDays.removeChild(ulDays.firstChild);
            }
        } else {

            console.log(currYear + " full year: " + currFullYear--);
            var ulDays = document.getElementById("days");

            while(ulDays.firstChild != null){
                ulDays.removeChild(ulDays.firstChild);
            }
        } 

        loadCalendar();
    });

    $("#next-month").on("click", function(){
        console.log("next month");
        
        if(currMonth+1 < 12){
            currMonth++;
        } else {
            currMonth = 0;
            currFullYear++;
        }

        var ulDays = document.getElementById("days");

        while(ulDays.firstChild != null){
            ulDays.removeChild(ulDays.firstChild);
        }

        loadCalendar();
    });
});