var currDay, currMonth, currYear, date;

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

var clicked;

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
    
    $("#view-date").val(currFullYear + "-" + currMonth + "-" + currDay);
    $("#view-form").submit();

    for(var dayCounter = 1; dayCounter <= currMonthDays; dayCounter++){

        tempListItem = document.createElement("li");
        tempListItem.innerHTML = dayCounter;

        //add a hidden element to the day that we can access when we click on it
        var temp =  currFullYear + "-" + (currMonth + 1) + "-" + dayCounter;
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
    }  else if(currHour < 10){
        currHour = "0" + currHour;
    } 
    
    if(currHour > 12)
        time = "pm";

    liTime.innerHTML = currHour + ":" + currMin + time;

}

function updateClock() {
    var now = new Date();

    var seconds = now.getSeconds();

    /*  if(seconds < 10)
        seconds = "0" + seconds;*/

    var time = now.getHours() + ':' + now.getMinutes() + ':' + seconds; 

    //    console.log(time);
    //    document.getElementById('nav-time').innerHTML = time;   

}

setInterval(updateClock, 1000);

$(document).ready(function(){    
    date = new Date();  

    var currentWindow = window.location.href;
    if(currentWindow.indexOf("reserve") > 0){
        initializeTopBar();
        getCurrentDate();
        loadCalendar();
        clicked = 0;
    }

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
        
        $("#view-button").submit();


    }); 

    $(document).on("click", "#days li", function() {
        clicked = 0; /* TODO: updates when may reserved pc na nung day na yun. so dapat bawal magclick si user */
        var date = $(this).children(".hidden").text();

        var month = $(this).children(".hidden").text().split("-")[1];
        var day = $(this).children(".hidden").text().split("-")[2];
        var year = $(this).children(".hidden").text().split("-")[0];

        var chosenDateText = document.getElementById("chosen-date");
        
        $(document.getElementById("current-day")).attr("id", "current-day-inactive");

        $(document.getElementById("current-day")).removeAttr("id");
        $(this).attr("id", "current-day");
        $(this).attr("value", year + "-" + months[month-1] + "-" + day);

        chosenDateText.innerHTML = months[month-1] + " " + day + ", " + year;
        
        $("#view-date").val(date);
        console.log( $("#view-date").val());

    });

    $(document).on("click", "#cancel_button",function(){
        $(".booking-details").remove();
        /* TODO: change color of cell if nagcancel */
    });

    $(document).on("click", "#submit_button", function(){
        //        submitForm();
        /* TODO: change color of cell to red */
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

    $("#details").hover(function(){
        var divLinks = document.createElement("div");
        var cancelText = document.createElement("span");

        cancelText.innerHTML = "Cancel";   

        divLinks.appendChild(cancelText);

        $(divLinks).attr("class", "current-booking-links");
        $("#details").append(divLinks);   
    } , function(){
        var temp = $(".details").children();
        $(".current-booking-links", this).remove();
    });

    $("#login").on("click", function(){
        event.preventDefault();

        var tfIdNum = document.getElementById("id-number");
        var tfPassword = document.getElementById("password");

        if (tfPassword.value == "" && tfIdNum.value == "") {
            console.log("error message");

            var messageDiv;

            messageDiv = document.createElement("div");

            messageDiv.innerHTML = "Missing inputs.";
            $(messageDiv).attr("class", "error-message");
            var container = $(".home-input");

            container.append(messageDiv);

        } else if(tfPassword.value != "" && tfIdNum.value != ""){
            console.log("submit form");
            $(".home-input").submit();
        }
    });

    $(document).on("click", ".available-pc", function(){
//        if(clicked < 2){
            var form = $(".pc-booking-info");
            var time = $(this).children(".time").val();
            var pcNo = $(this).parent().children(".pc-number").children(".pcnum").val();
            var date = $("#chosen-date").text();
            var floor = $("#place-dropdown :selected").text();

            var tfTime = $("#reserve-time").val($(this).children(".time").val());

            var tfPCNo = $("#reserve-pcno").val($(this).parent().children(".pc-number").children(".pcnum").val());

            console.log(time);
            console.log($(this).parent().children(".pc-number").children(".pcnum").val());
            console.log(floor);



//            clicked++;
//        }

    });
    
    $(document).on("change", "#place-dropdown", function(){
        $("#view-floor").val($("#place-dropdown :selected").val());
        console.log($("#view-floor").val());
        $("#view-form").submit();
    });
        
});