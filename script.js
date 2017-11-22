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
    console.log("am here");
    for(var firstDayCounter = 0; firstDayCounter < firstDay; firstDayCounter++){
        tempListItem = document.createElement("li");
        ulDays.appendChild(tempListItem);
    }

    for(var dayCounter = 1; dayCounter <= currMonthDays; dayCounter++){

        tempListItem = document.createElement("li");
        tempListItem.innerHTML = dayCounter;
        $(tempListItem).addClass("day");
        //add a hidden element to the day that we can access when we click on it
        var temp = months[currMonth] +"/" + dayCounter +"/" + currFullYear;
        $(tempListItem).append("<div class = 'hidden'>" + temp + "</div>");
        
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

    var currMin = date.getMinutes();
    var currHour = date.getHours();
    var time = "am";

    if(currMin < 10){
        currMin = "0" + currMin;
    }
    
    if(currHour > 12){ 
        currHour = (currHour+11)%12+1;
        time = "pm";
    } else {
        currHour = "0" + currHour;
    }
    
    if(currHour < 10 && currHour.charAt(0) != '0'){
        currHour = "0" + currHour;
    }

    liTime.innerHTML = currHour + ":" + currMin + time;

}

function refreshTimer(){

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
    
    $(document).on("click", ".day", function()
    {
    	var date = $(this).children(".hidden").text();
    	console.log(date);
    	$(document.getElementById("current-day")).removeAttr("#current-day");
    	$(this).attr("id", "current-day");
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