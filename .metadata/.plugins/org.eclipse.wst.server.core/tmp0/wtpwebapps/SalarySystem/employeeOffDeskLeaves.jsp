<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Leaves</title>
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
	    $(document).ready(function(){
/* 	        $(".sideM").removeClass('active');
	        $(".itemM").addClass('active');
	        getHotelItemList(); */
	    	$('.datepicker').datepicker({
	    		format : 'dd-mm-yyyy',
	             autoclose:true
	     	});
	    });
	    
	    function leaveResponse(lid,leaveRes){
	    	var date = $(".dt-"+lid).text();
	    	var eid = $(".eid-"+lid).text();
	    	var wh = $(".wh-"+lid).text();

	    	$.ajax({
    		   url: 'LeaveApproveservlet',
    		   data: {lid:lid,leaveRes:leaveRes,date:date,eid:eid,wh:wh},
    		   type: 'POST',
    		   dataType: 'json',
    		   error: function() {
    		      $('#info').html('<p>An error has occurred</p>');
    		   },
    		   success: function(data) {
    			   var result=data.Result;
     			   alert("result :: "+result);
     			   $(".status-"+lid).html(result);
    		   },
    		});
	    }
    </script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<form class="form-horizontal" method="post"
					action="addHotelItem.htm">
					<!-- <div class="form-group">
				    <label class="col-sm-2 control-label">Select Date</label>
				    <div class="col-sm-4">
				      <input class="form-control datepicker" type="text" name="date">
				    </div>
				    <div class="col-sm-4">
			      		<button type="submit" class="btn btn-success">Submit</button>
			    	</div>
			  	</div> -->
				</form>
				<hr>

				<table class="table table-bordered" id="table">

					<thead>
						<tr class="text-danger">
							<td colspan="8" class="text-center h3">Employees leave
								requests</td>
						</tr>
						<tr>
							<th>EMP ID</th>
							<th>EMP NAME</th>
							<th>POSITION</th>
							<th>DATE</th>
							<th>Reason</th>
							<th>Leave hours</th>
						 <th>Status</th>
							
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="tb">
						<%
							DatabaseConnection db = new DatabaseConnection();
							ResultSet rs = db
									.selectQuery("select off_desk_request.*,employee.name,employee.position from off_desk_request,employee where off_desk_request.status='"
											+ "pending"
											+ "' and employee.eid=off_desk_request.eid");
							
							
							try{
								
							
							while (rs.next()) {
								if (rs.getString("status").equals("pending")) {
						%>
						<tr>
							<td  class="eid-<%=rs.getInt("id")%>"><%=rs.getInt("eid")%></td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("position")%></td>
							<td class="dt-<%=rs.getInt("id")%>"><%=rs.getString("date")%></td>
							<td><%=rs.getString("reason")%></td>
							<td class="wh-<%=rs.getInt("id")%>"><%=rs.getString("time")%></td>
                            <td class="status-<%=rs.getInt("id")%>">pending</td>							
							<td><input type="button" onclick="leaveResponse('<%=rs.getInt("id")%>','1');" class="btn btn-sm btn-success" value="Approve">
								<input type="button" onclick="leaveResponse('<%=rs.getInt("id")%>','0');" class="btn btn-sm btn-danger" value="Disapprove"></td>
						</tr>
						<%
							}
							}
							
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							finally
							{
								
								if(rs != null)
									try {
										rs.close();
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								
								db.closeConnection();
								
								
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>