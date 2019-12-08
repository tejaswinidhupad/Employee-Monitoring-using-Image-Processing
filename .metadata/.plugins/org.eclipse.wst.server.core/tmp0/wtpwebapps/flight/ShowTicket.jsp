<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="looks.css" />
<script>
 

</script>
<title>ShowTicket</title>
</head>
<body  >
<div id="main">
 		<div id="content">

			<h2>
				<span class="description">"Book a Flight in Four Simple
					Steps"</span>
			</h2>
			<div class="clear"></div>
			<div class="article">
				<h1 class="heading">
					<a>Book</a>
				</h1>
				<body>
					<div class="container">

						<table class="itin">
							<tr class="caption">
								<th colspan="8"><strong>Pune to New Delhi</strong> &mdash;
									Sat, 02 Apr 2016<span class="float_right"></th>
							</tr>

							<tr>
								<th>Leaves</th>
								<th>Arrives</th>
								<th>Airline</th>
								<th>Flight #</th>
								<th>Class</th>

							</tr>

							<tr>
								<td>Pune<br /> Lohegaon&nbsp; (PNQ)<br /> 05:20 , 02 Apr
								</td>
								<td>New Delhi <br /> Indira Gandhi Airport&nbsp; (DEL)<br />
									<span class="weak">Terminal - 3</span><br> 07:30 , 02 Apr
								</td>
								<td>Jet Airways</td>
								<td>9W-364
								<td>Economy</td>
						</table>

						 <hr>
						<br>
						 

						<br> 

						<form  action="" method="POST" >
						    <h2>Ticket Number :<%= request.getParameter("TicketNo") %> </h2>
							<table style="width:100%">
  							<tr><td>
							Email:<%= request.getParameter("Email") %><br> 
							Mobile No:<%= request.getParameter("Mobile") %><br>
							No of person:<%= request.getParameter("NoPerson") %><br>
							
							<% String person="";
							if(1==Integer.parseInt(request.getParameter("NoPerson"))){
							    person="Person 1 : "+ request.getParameter("Name1");
								person+="<br>";
								}
							if(2==Integer.parseInt(request.getParameter("NoPerson"))){
							    person="Person 1 : "+ request.getParameter("Name1");
								person+="<br>";
								person+="Person 2 : "+ request.getParameter("Name2");
								person+="<br>";}
							if(3==Integer.parseInt(request.getParameter("NoPerson"))){
							    person="Person 1 : "+ request.getParameter("Name1");
								person+="<br>";
								person+="Person 2 : "+ request.getParameter("Name2");
								person+="<br>";
								person+="Person 3 : "+ request.getParameter("Name3");
								person+="<br>";}
							if(4==Integer.parseInt(request.getParameter("NoPerson"))){
							    person="Person 1 : "+ request.getParameter("Name1");
								person+="<br>";
								person+="Person 2 : "+ request.getParameter("Name2");
								person+="<br>";
								person+="Person 3 : "+ request.getParameter("Name3");
								person+="<br>";
								person+="Person 4 : "+ request.getParameter("Name4");
								person+="<br>";}
							if(5==Integer.parseInt(request.getParameter("NoPerson"))){
							    person="Person 1 : "+ request.getParameter("Name1");
								person+="<br>";
								person+="Person 2 : "+ request.getParameter("Name2");
								person+="<br>";
								person+="Person 3 : "+ request.getParameter("Name3");
								person+="<br>";
								person+="Person 4 : "+ request.getParameter("Name4");
								person+="<br>";
								person+="Person 5 : "+ request.getParameter("Name5");
								person+="<br>";}
								out.print(person);
 							 %> 
 							
 							</td><td>
							<img height="100" width="100" src="https://zxing.org/w/chart?cht=qr&chs=350x350&chld=L&choe=UTF-8&chl=<%= request.getParameter("TicketNo") %>" alt="" />
							</td>
  </tr>
</table>
							<button type="submit">Book</button>
						</form>
					</div>
			</div>
			<img src="images/gallery.png" class="img-center" alt="" />
		</div>
		<div id="menu">
			<ul>
				<li><a class="active">1. Search Flight</a></li>
				<li><a class="active">2. Select Flight</a></li>
				<li><a class="active">3. Enter Details</a></li>
				<li><a class="active">4. Book</a></li>
			</ul>
		</div>
		<div id="footer">AISSMS IOIT</div>
		<div class="clear"></div>
	</div>
	<div align=right>© 2017 Ajay Kumar</div>
</body>
</html>