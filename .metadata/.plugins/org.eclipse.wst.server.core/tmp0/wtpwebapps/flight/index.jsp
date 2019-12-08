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
					<a>Search Flight</a>
				</h1>
				<form action="ShowFlight.jsp">

					<table>
						<tr>
							<td>To:</td>
							<td>From:</td>
						</tr>
						<tr>
							<td><input type="text" name="input_to" value="Pune" required></td>
							<td><input type="text" name="input_from" value="New Delhi"
								required></td>
						</tr>
						<tr>
							<td>Depart on</td>
							<td></td>
						</tr>
						<tr>
							<td><input type="text" name="input_date"
								value="Sat, 02 Apr 2017" required></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td align="right"><button type="submit">Submit</button></td>
						</tr>
					</table>


					<form>
			</div>
			<img src="images/gallery.png" class="img-center" alt="" />
		</div>
		<div id="menu">
			<ul>
				<li><a class="active">1. Search Flight</a></li>
				<li><a class="next">2. Select Flight</a></li>
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
