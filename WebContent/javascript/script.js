var currDay, currMonth, currYear, date;

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];


function getCurrentDate() {
    currDay = date.getDate();
    currMonth = date.getMonth();
    currFullYear = date.getFullYear();
}

function loadCalendar(){

    var divMonth = document.getElementById("month-name");
    var ulDays = document.getElementById("days");
    var spanYear = document.getElementById("year");
    var currDateText = document.getElementById("chosen-date");
    var tempListItem;

    var currMonthDays = new Date(currFullYear, currMonth, 0).getDate();
    var firstDay = new Date(currFullYear, currMonth, 1).getDay();

    var formPcNo, formDate, formTime, formUserId;
    divMonth.innerHTML = months[currMonth];
    spanYear.innerHTML = currFullYear;

    currDateText.innerHTML = months[currMonth] + " " + currDay + ", " + currFullYear;

    for(var firstDayCounter = 0; firstDayCounter < firstDay; firstDayCounter++){
        tempListItem = document.createElement("li");
        ulDays.appendChild(tempListItem);
    }

    for(var dayCounter = 1; dayCounter <= currMonthDays; dayCounter++){

        tempListItem = document.createElement("li");
        tempListItem.innerHTML = dayCounter;

        //add a hidden element to the day that we can access when we click on it
        var temp =  currFullYear + "/" + (currMonth + 1) + "/" + dayCounter;
        $(tempListItem).append("<div class = 'hidden'>" + temp + "</div>");

        if(dayCounter < date.getDate() && currMonth == date.getMonth()){
            $(tempListItem).addClass("unvailable-pc");
        } else if (currMonth != date.getMonth() && currYear < date.getYear()) {
            $(tempListItem).addClass("unavailable-pc");
        } else {
            $(tempListItem).attr("id", "day");
        }

        if(date.getDate() == dayCounter && currMonth == date.getMonth())
            $(tempListItem).attr("id", "current-day");

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
    } else if(currHour > 10){ 
        currHour = (currHour+11)%12+1;
        time = "pm";
    } else if(currHour < 10){
        currHour = "0" + currHour;

    } else {
        currHour = "0" + currHour;
    } 

    liTime.innerHTML = currHour + ":" + currMin + time;

}

function updateClock() {
    var now = new Date();
    
    var seconds = now.getSeconds();

  /*  if(seconds < 10)
        seconds = "0" + seconds;*/
    
    var time = now.getHours() + ':' + now.getMinutes() + ':' + seconds; 
    
//    console.log(time);
    document.getElementById('nav-time').innerHTML = time;   

}

setInterval(updateClock, 1000);

$(document).ready(function(){    
    date = new Date();

    initializeTopBar();
    getCurrentDate();
    loadCalendar();
    formDate = currYear + "" + currMonth + "" + currDay;
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

    function submitForm()
    {
        //String pcNo, String Date, String Time, String UserID
        //TODO <INPUT TYPE="hidden" NAME="pcNo" VALUE="value1">
        //<INPUT TYPE="hidden" NAME="date" VALUE="value2">
        //<INPUT TYPE="hidden" NAME="time" VALUE="value2">
        console.log(formPcNo + ":" + formDate + ":" + formTime);
        var form = document.getElementById("reserve-form");
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = "pc_no";
        input.value = formPcNo;
        form.appendChild(input);

        var input1 = document.createElement('input');
        input1.type = 'hidden';
        input1.name = "date";
        input1.value = formDate;
        form.appendChild(input1);

        var input2 = document.createElement('input');
        input2.type = 'hidden';
        input2.name = "time";
        input2.value = formTime;
        form.appendChild(input2);

        var input3 = document.createElement('input');
        input3.type = 'hidden';
        input3.name = "user_id";
        input3.value = 1;
        form.appendChild(input3);

        document.reserve-form.submit();
        console.log("plz work");
    }

    //var formPcNo, formDate, formTime, formUserId;
    //TODO make a form that gets the day and the time and submit when button is pressed and if a new day isnt selected, get the current day

    $(document).on("click", ".day", function(){
        var month = $(this).children(".hidden").text().split("/")[0];
        var day = $(this).children(".hidden").text().split("/")[1];
        var year = $(this).children(".hidden").text().split("/")[2];

        formDate = date;
        console.log(month + " / " + day+ " / " + year);
        $(document.getElementById("current-day")).attr("id", "current-day-inactive");
        $(document.getElementById("current-day")).removeAttr("id");
        $(this).attr("id", "current-day");
        $(document.getElementById("current-day")).innerHTML = months[month-1] + " " + day + ", " + year;


    }); 

    $(document).on("click", "#days li", function() {
        var date = $(this).children(".hidden").text();
        //    	formDate = date;

        var month = $(this).children(".hidden").text().split("/")[1];
        var day = $(this).children(".hidden").text().split("/")[2];
        var year = $(this).children(".hidden").text().split("/")[0];

        var chosenDateText = document.getElementById("chosen-date");

        console.log("DATE: " + date);

        $(document.getElementById("current-day")).attr("id", "current-day-inactive");

        $(document.getElementById("current-day")).removeAttr("id");
        $(this).attr("id", "current-day");

        chosenDateText.innerHTML = months[month-1] + " " + day + ", " + year;

    });

    $(document).on("click", ".available-pc", function(){
        var pcNo = $(this).children(".hidden").text().split("|")[0];
        var time = $(this).children(".hidden").text().split("|")[1];

        formPcNo = pcNo;
        formTime = time;
        //    	console.log(formPcNo + " + " + formTime);
        $(this).removeClass("available-pc");
        $(this).addClass("selected-pc");

        /* add div show booking details */

        var rightSidebar = $(".right-sidebar");

        var divDetails = document.createElement("div");
        $(divDetails).addClass("booking-details");

        var dateTimeDetails = document.createElement("p");
        dateTimeDetails.innerHTML = pcNo + time;
        divDetails.appendChild(dateTimeDetails);

        rightSidebar.append(divDetails);

        var reserveButton = document.createElement("div");
        reserveButton.innerHTML ="<FORM ACTION='Admin_Controller' METHOD='post'"+
            "name='reserve-form' id='reserve-form'></FORM>"+
            "<button id='submit_button'>Reserve</button>";

        var cancelButton = document.createElement("div");
        cancelButton.innerHTML = "<button id='cancel_button'>Cancel</cancel>";

        divDetails.appendChild(cancelButton);

        divDetails.append(reserveButton);  

    });

    $(document).on("click", "#cancel_button",function(){
        $(".booking-details").remove();
    });

    $(document).on("click", "#submit_button", function(){
        submitForm();
    });

    $("#next-month").on("click", function(){

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

    $(".details").hover(function(){
        var divLinks = document.createElement("div");
        var editText = document.createElement("span");
        var cancelText = document.createElement("span");

        editText.innerHTML = "Edit";
        cancelText.innerHTML = "Cancel";   

        divLinks.appendChild(editText);
        divLinks.appendChild(cancelText);

        $(divLinks).attr("class", "current-booking-links");
        $(".details").append(divLinks);   
    }
                        , function(){
        var temp = $(".details").children();
        $(".current-booking-links", this).remove();
    });

});