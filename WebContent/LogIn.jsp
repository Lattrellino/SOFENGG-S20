<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  ====================================================================    Style  ======================================================================================   -->



<link type = "text/css" rel = "stylesheet" href = "\style.css">
<style>
	body{
	
		background-color:#E0E0E0;
	}

	.container{
	
	}
	#background{
	position: relative;
  		opacity: 0.99;
	}
	
	#background{
		background:transparent url('background.png') no-repeat 0 0;
		background-size: 100% 100%;
		padding: 20px;
		height: 79%;
		width: 67%;
		position: absolute;
		margin-left: auto;
		margin-right: auto;
		left: 0;
		right: 0;
		 

	}
	

	
	#Text1{
		padding:20px;
		text-align:center;
		color: #003A00; 
		font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
		font-size: 60px;
		text-shadow: 2px 4px 3px rgba(0,0,0,0.3);

	}
	
	#Text2{
		padding:10px;
		text-align:center;
		color: #FFFFFF; 
		font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
		font-size: 25px;
		text-shadow: 2px 4px 3px rgba(0,0,0, 0.4);

	}

	.username{
	
			padding: 5px;
             position: relative;
             display: block;
             margin : 0 auto;
             width: 220px;
             height: 25px;
             
             margin-top: 15px;
             
             -webkit-border-radius: 5px;
				-moz-border-radius: 5px;
				border-radius: 5px;
					
	}
	
	#smallBox{
					padding: 5px;
             position:absolute;
             display: block;
			 margin-top:5%;
			 margin-left:33%;
			 height: 25%;
			 width:30%;

	}
	
	
	.passwordtf{
	
	
			padding: 5px;
             position: relative;
             display: block;
             margin : 0 auto;
             width: 220px;
             height: 25px;
             
             margin-top: 15px;
             
             -webkit-border-radius: 5px;
				-moz-border-radius: 5px;
				border-radius: 5px;
	}
	
	.button{
	
		padding: 5px;
             position:absolute;
             display: block;
			 margin-top:5%;
			 margin-left:33%;
			 height: 25%;
			 width:30%;
	
	
	
		 background-color: #4CAF50; /* Green */
  	  border: none;
    color: white;
   	 padding: 15px 32px;
  	  text-align: center;
  	  text-decoration: none;
   	 display: inline-block;
   	 font-size: 16px;
	}
	


</style>


<!--  ====================================================================    Title  ======================================================================================   -->
<title>--Admin--</title>

	
</head>
<body>
<!--  ====================================================================    Body  ======================================================================================   -->



	<div class = container>
															<!--    ==================         -->
		<div id = background>


				<div id = Text1>
						MLS PC Reservation System
				</div>
		
																	<!--    ==================         -->
																	
			
				
			
				<div id = Text2>
					Welcome to MyLaSalle PC  Reservation System for the learning Commons!
					 
				</div>
				<div id = Text2>
					To begins reserving a PC, please log in  by entering your details below:	
				</div>
				
				<div id = smallBox>
					<form action="/sofengg/LogInController" method="POST">
						<div>
							<input type = text class = username value = username name = "username"/>
						
						</div>
						<div>
							<input type = password class = passwordtf value = password name = "password"/>
						</div>  
						
						<div>
							
								<button class = button >Enter</button>
	
						</div>
					</form>
				</div>
				
		</div>

	</div>												
															




</body>
</html>