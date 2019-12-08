<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.DatabaseConnection"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Working Details</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap-datepicker.js"></script>
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script>
	$(document).ready(function() {
		/* 	        $(".sideM").removeClass('active');
		 $(".itemM").addClass('active');
		 getHotelItemList(); */
		$('.datepicker').datepicker({
			format : 'dd-mm-yyyy',
			autoclose : true
		});
	});

	function getSalary(eid) {
		var month = $('.month').val();
		var year = $('.year').val();
		var workdays = $('.workdays').val();
		$.ajax({
			url : 'GetSalaryServlet',
			data : {
				eid : eid,
				month : month,
				year : year,
				workdays : workdays
			},
			type : 'GET',
			dataType : 'json',
			error : function() {
				$('#info').html('<p>An error has occurred</p>');
			},
			success : function(data) {
				var result = data.salaryResult;

				var a = result.split(',')[0];
				var b = result.split(',')[1];
				var c = result.split(',')[2];
				var d = result.split(',')[3];
				var e = result.split(',')[4];
				var f = result.split(',')[5];

				$(".description1").html(a);
				$(".description2").html(b);
				$(".description3").html(c);
				$(".description4").html(d);
				$(".description5").html(e);
				$(".description6").html(f);
				$('.table-bordered').removeClass('hide');
			},
		});
	}
</script>
<script>
	$(document).ready(function() {
		$('.datep').datepicker({
			autoclose : true
		});
	});
</script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="bootstrap-datepicker.js"></script>

</head>
<body>
	<div id="wrapper">
		<jsp:include page="Header1.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
			<form action="OffDeskRequest" method="post">
				<div class="form-group">
					<label class="col-sm-3 control-label">Select Date</label>
					<div class="col-sm-4">
						<input type="text" placeholder="Select leave date" value="" name="date"
							class="datep form-control">
					</div>

				</div>
				<br> <br>
				<div class="form-group">
					<label class="col-sm-3 control-label">Enter Reason</label>
					<div class="col-sm-6">
						<input type="text" name="reason" class="form-control workdays">
					</div>
  				</div>
				<br><br>
                <div class="form-group">
					<label class="col-sm-3 control-label">Expected Time in Hrs</label>
					<div class="col-sm-4">
						<div class="col-sm-6">
						<input type="text" name="time" class="form-control workdays">
					</div>
					</div>


				</div>

			</div>
			<br> <br> <br> <br> <br>
			<div class="col-sm-offset-2">
				<button type="submit" class="btn btn-sm btn-danger"
					class="btn btn-success">Submit</button>
			</div>
            <br> <br> <br> <br> <br>
			<div class="col-sm-offset-2">
			<%if(session.getAttribute("status")!=null){
				out.print(session.getAttribute("status"));
				session.setAttribute("status",null);
			} %>
			</div>

</form>

		</div>
		<hr>
		<table class="table table-bordered hide">
			<thead>
				<tr>
					<th>EMP Work details</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="description1"></td>
				</tr>
				<tr>
					<td class="description2"></td>
				</tr>
				<tr>
					<td class="description3"></td>
				</tr>
				<tr>
					<td class="description4"></td>
				</tr>
				<tr>
					<td class="description5"></td>
				</tr>
				<tr>
					<td class="description6"></td>
				</tr>

			</tbody>
		</table>
	</div>
	</div>
	</div>
</body>
</html>