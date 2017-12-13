window.onload = function(){
    var chart = new CanvasJS.Chart("chartContainer", {
	   animationEnabled: true,
	   theme: "light2",
	   title:{
		  text: "Peak Hours"
	   },
	   axisY:{
           title: "No. of PCs reserved", 
           includeZero: false  
	   },
        axisX:{
            title: "Time"
        },
        data: [{        
            type: "line",
            color:"#087830",
            dataPoints: [
                {label: "07:00AM", y: 3},
                {label: "08:00AM", y: 0},
                {label: "09:00AM", y: 2},
                {label: "10:00AM", y: 5},
                {label: "11:00AM", y: 9},
                {label: "12:00PM", y: 4},
                {label: "01:00PM", y: 12},
                {label: "02:00PM", y: 9},
                {label: "03:00PM", y: 6},
                {label: "04:00PM", y: 4},
                {label: "05:00PM", y: 4},
                {label: "06:00PM", y: 15}, 
                {label: "07:00PM", y: 3}, 
                {label: "08:00PM", y: 6}, 
                {label: "09:00PM", y: 8}
            ]
        }]
    });
    chart.render();
}

function pkcFunction(){
    var chart = new CanvasJS.Chart("chartContainer", {
	   animationEnabled: true,
	   theme: "light2",
	   title:{
		  text: "Peak Hours"
	   },
	   axisY:{
           title: "No. of PCs reserved", 
           includeZero: false  
	   },
        axisX:{
            title: "Time"
        },
        data: [{        
            type: "line",
            color:"#087830",
            dataPoints: [
                {label: "07:00AM", y: 3},
                {label: "08:00AM", y: 0},
                {label: "09:00AM", y: 2},
                {label: "10:00AM", y: 5},
                {label: "11:00AM", y: 9},
                {label: "12:00PM", y: 4},
                {label: "01:00PM", y: 12},
                {label: "02:00PM", y: 9},
                {label: "03:00PM", y: 6},
                {label: "04:00PM", y: 4},
                {label: "05:00PM", y: 4},
                {label: "06:00PM", y: 15}, 
                {label: "07:00PM", y: 3}, 
                {label: "08:00PM", y: 6}, 
                {label: "09:00PM", y: 8}
            ]
        }]
    });
    chart.render();
}

function mrpcFunction(){
    var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Most Reserved PC"
	},
	axisY:{
        title: "No. of Times Reserved", 
		includeZero: false  
	},
    axisX:{
         title: "PC No."
    },
	data: [{        
		type: "column",
        color:"#087830",
		dataPoints: [
			{label: "1", y: 15},
			{label: "2", y: 12},
			{label: "3", y: 4},
			{label: "4", y: 8},
			{label: "5", y: 9},
			{label: "6", y: 4},
			{label: "7", y: 10},
			{label: "8", y: 6},
			{label: "9", y: 11},
			{label: "10", y: 16}
		]
	}]
});
    chart.render();
}

function mrlcFunction(){
    var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Most Reserved Floor Location"
	},
	axisY:{
        title: "No. of Times Reserved", 
		includeZero: false  
	},
    axisX:{
         title: "Floors"
    },
	data: [{        
		type: "column",
        color:"#087830",
		dataPoints: [
			{label: "7th floor", y: 15},
			{label: "8th floor", y: 12},
			{label: "9th floor", y: 13},
			{label: "10th floor", y: 19},
			{label: "11th floor", y: 17},
			{label: "12th floor", y: 15}
		]
	}]
});
    chart.render();
}

function rListFunction(){
    document.getElementById("chartContainer").innerHTML = 
        "<table class=\"rTable\" >" + 
        "<tr>" + 
        "<th>PC No.</td>" + 
        "<th>Floor</td>" +
        "<th>Reserve Time</td>" + 
        "<th>Reserve Date</td>" + 
        "</tr>" + 
        
        "<tr>" + 
        "<td>7</td>" + 
        "<td>8th</td>" +
        "<td>09:00:00</td>" + 
        "<td>13/12/2017</td>" + 
        "</tr>" + 
        
        "<tr>" + 
        "<td>8</td>" + 
        "<td>8th</td>" +
        "<td>13:00:00</td>" + 
        "<td>13/12/2017</td>" + 
        "</tr>" + 
        
        "<tr>" + 
        "<td>3</td>" + 
        "<td>10th</td>" +
        "<td>20:00:00</td>" + 
        "<td>10/12/2017</td>" + 
        "</tr>" + 
        
        "<tr>" + 
        "<td>4</td>" + 
        "<td>7th</td>" +
        "<td>17:00:00</td>" + 
        "<td>9/12/2017</td>" + 
        "</tr>" + 
        
        "<tr>" + 
        "<td>2</td>" + 
        "<td>9th</td>" +
        "<td>14:00:00</td>" + 
        "<td>7/12/2017</td>" + 
        "</tr>" + 
        
        "</table>"
}