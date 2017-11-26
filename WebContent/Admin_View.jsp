<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
<!--  ====================================================================    Style  ======================================================================================   -->



<link type = "text/css" rel = "stylesheet" href = "\style.css">
<style>

	body{
	
	background-color:#E0E0E0;
	
	
	}
	
	.background{
	
			background:transparent url('Admin_background.png') no-repeat 0 0;
		background-size: 100% 100%;
		height: 79%;
		width: 67%;
		position: absolute;
		margin-left: auto;
		margin-right: auto;
		left: 0;
		right: 0;
	
	}
	
	#header{
		top:0%;
		height: 13%;
	}

	#Text{
		padding-top:30px;
		padding-down:30px;
		padding-left:5px;
		padding-right:5px;
		float: left;
		color: #FFFFFF; 
		font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
		font-size: 25px;
	}
	
	#line{
		padding-top:30px;
		padding-down:30px;
		float:left;
		color: #FFFFFF; 
		opacity: 0.3;
		font-size: 30px;
	}
	
	#time{
		padding-top:30px;
		padding-down:30px;
		padding-left:10px;
		padding-right:15px;
		float:right;
		color: #FFFFFF; 
		opacity: 0.5;
		font-size: 30px;
		font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	}
	
	#Text1{
		padding-top:30px;
		padding-down:30px;
		padding-left:5px;
		padding-right:10px;
		float:right;
		color: #008000; 
		font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
		font-size: 25px;
		text-shadow: 2px 4px 3px rgba(0,0,0,0.3);

	}
	
	
	.DashBoard{
		padding:20px;
		padding-top:15px;
		text-align:center;
		color: #FFFFFF; 
		font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
		font-size: 35px;
		text-shadow: 2px 4px 3px rgba(0,0,0,0.3);
	
	
	}



					.dropbtn {

						margin-left:25%;
					    background-color: #4CAF50;
					    color: white;
					    height:45px;
					    width:350px;
					    font-size: 16px;
					    border: none;
					    cursor: pointer;
					}
										
					.dropbtn:hover, .dropbtn:focus {
					    background-color: #3e8e41;
					}
					
					.dropdown {
					    position: relative;
					    display: inline-block;
					}
					
					.dropdown-content {
						margin-left:25%;
						float:right;
					    display: none;
					    position: absolute;
					    background-color: #f9f9f9;
					    min-width: 350px;
					    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
					    z-index: 1;
					}		
					
					.dropdown-content a {
						right:0;
					    color: black;
					    padding: 12px 16px;
					    text-decoration: none;
					    display: block;
					}
					
					.dropdown-content a:hover {
					
						background-color: #f1f1f1
					}
					
					.show {
						display:block;
					}
					
					
					
					
					
					
					
					
					


</style>

<!--  ====================================================================   Javascript for drop down======================================================================================   -->

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}









</script>


<!--  ====================================================================    Title  ======================================================================================   -->
<title>--Admin--</title>


</head>

<!--  ====================================================================    Body  ======================================================================================   -->
<body >

	<div class = background >
		<div id = header >
			<div id = Text>DashBoard</div>
			<div id = line>|</div>
			<div id = Text>Analytics</div>
			<div id = line>|</div>
			<div id = Text>Message</div>
			<div id = line>|</div>
			<div id = Text>Log Out</div>
			
			<div id = Text1>MLS PC Reservation System</div>
			
			<div id = time>10 : 00 : 00 pm</div>
		</div>
		
		<div class = DashBoard>DashBoard</div>
		
		
		<div>
			<div class="dropdown">
		 	 <button onclick="myFunction()" class="dropbtn">Select</button>
		 	 
		 	 
			  <div id="myDropdown" class="dropdown-content">
				  <a href="#">Link 1</a>
				  <a href="#">Link 2</a>
			 	 <a href="#">Link 3</a>
			  </div>
			</div>
			

		</div>
		
		
		
		
	</div>

</body>
</html>


<!--  ====================================================================    Note  ======================================================================================   -->
<!-- time will be 2 dropdown boxes , date current date until 2 days dropdown, pc drop down -->
	
