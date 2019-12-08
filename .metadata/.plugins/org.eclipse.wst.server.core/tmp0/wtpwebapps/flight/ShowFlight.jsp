<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>PSCFA</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="looks.css" />
</head>
<body>
	<div id="main">
		<div id="content">

			<h2>
				<span class="description">"Book a Flight in Four Simple
					Steps"</span>
			</h2>
			<div class="clear"></div>
			<div class="article">
				<h1 class="heading">
					<a>Select Flight</a>
				</h1>
				<div class="container">
					<form action="booking.jsp">
						Show Flight Result
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

							</tr>

							<tr>
								<td></td>
							</tr>

						</table>




						<button type="submit">Continue Booking</button>

					</form>
				</div>
			</div>
			<img src="images/gallery.png" class="img-center" alt="" />
		</div>
		<div id="menu">
			<ul>
				<li><a class="active">1. Search Flight</a></li>
				<li><a class="active">2. Select Flight</a></li>
				<li><a class="next">3. Enter Details</a></li>
				<li><a class="next">4. Book</a></li>
			</ul>
		</div>
		<div id="footer">AISSMS IOIT</div>
		<div class="clear"></div>
	</div>
	<div align=right>© 2017 Ajay Kumar</div>
</body>
</html>
