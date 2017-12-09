var chart;

$(document).ready(function(){
    chart = new CanvasJS.Chart("chartContainer", {
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
});
