var currDay, currMonth, currYear, date;

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

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

    for(var firstDayCounter = 0; firstDayCounter < firstDay; firstDayCounter++){
        tempListItem = document.createElement("li");
        ulDays.appendChild(tempListItem);
    }

    for(var dayCounter = 1; dayCounter <= currMonthDays; dayCounter++){
        
        tempListItem = document.createElement("li");
        tempListItem.innerHTML = dayCounter;
        
        if(dayCounter == date.getDate() && currMonth == date.getMonth()){
            tempListItem.setAttribute("id", "current-day");
        }

        ulDays.appendChild(tempListItem);
    }

}

function initializeTopBar(){
    var liDate = document.getElementById("nav-date");
    liDate.innerHTML = months[date.getMonth()] + " " + date.getDate() + ", " + date.getFullYear();
    
    var liTime = document.getElementById("nav-time");
    
    if(date.getHours() > 12){
        liTime.innerHTML = (date.getHours()+11)%12+1 + ":" + date.getMinutes() + " pm";
    } else {
        liTime.innerHTML = date.getHours() + ": " + date.getMinutes() + " am";
    }
    
}

function refreshTimer(){
    /* some code refreshing the timer sa nav bar */
}

$(document).ready(function(){    
    date = new Date();
    
    initializeTopBar();
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
    
    $("#month-name").on("click", function(){
       /* insert code pag ni-click ni user yung month name, it zooms out and shows all months for that year */ 
    });
});