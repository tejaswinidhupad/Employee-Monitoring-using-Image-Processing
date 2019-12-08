<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>PSCFA</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="looks.css" />
<script type="text/javascript" src="Minds.js"></script>

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
					<a>Enter Details</a>
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
						<hr>

						<br> Please Enter Details

						<form action="Booking" method="POST">
							<table>

								<tr>
									<td>Email:</td>
									<td><input type="text" name="Email" required></td>
								</tr>
								<tr>
									<td>Mobile No:</td>
									<td><input type="text" name="Mobile" required></td>
								</tr>
								<tr>
									<td>No of person:</td>
									<td><select id="NoOfPerson" name="NoOfPerson"
										onchange="showDiv(this)">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
									</select></td>
								</tr>
								<br>
							</table>
							<table align="right">
								<tr>
									<td><div id="one" style="display: block;">
											Person 1 : <br>
											<input type="text" placeholder="Name" name="Name1"><br>
											<input type="text" placeholder="Aadhar Card Number"
												name="aad_no1">

										</div></td>
								</tr>
								<tr>
									<td><div id="two" style="display: none;">
											Person 2 : <br>
											<input type="text" placeholder="Name" name="Name2"><br>
											<input type="text" placeholder="Aadhar Card Number"
												name="aad_no2">

										</div></td>
								</tr>
								<tr>
									<td><div id="three" style="display: none;">
											Person 3 : <br>
											<input type="text" placeholder="Name" name="Name2"><br>
											<input type="text" placeholder="Aadhar Card Number"
												name="aad_no3">

										</div></td>
								</tr>
								<tr>
									<td><div id="four" style="display: none;">
											Person 4 :<br> <input type="text" placeholder="Name"
												name="Name3"><br>
											<input type="text" placeholder="Aadhar Card Number"
												name="aad_no4">

										</div></td>
								</tr>
								<tr>
									<td><div id="five" style="display: none;">
											Person 5 :<br>
											<input type="text" placeholder="Name" name="Name4"><br>
											<input type="text" placeholder="Aadhar Card Number"
												name="aad_no5">

										</div></td>
								</tr>
							</table>
							<button type="submit">Submit</button>
						</form>
					</div>
			</div>
			<img src="images/gallery.png" class="img-center" alt="" />
		</div>
		<div id="menu">
			<ul>
				<li><a class="next">1. Search Flight</a></li>
				<li><a class="next">2. Select Flight</a></li>
				<li><a class="active">3. Enter Details</a></li>
				<li><a class="next">4. Book</a></li>
			</ul>
		</div>
		<div id="footer">Developed by Ajay Kumar</div>
		<div class="clear"></div>
	</div>
	<div align=right>� 2017 Ajay Kumar</div>
</body>
</html>
