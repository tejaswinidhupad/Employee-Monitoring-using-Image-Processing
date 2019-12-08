<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
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
		$('.datep').datepicker({
			format : 'dd-mm-yyyy',
			autoclose : true
		});
	});

	
	function getItem(empId) {
		 $('.delemp').val(empId);
 		 $('.modal').modal('show');
	}
	
	function getItem1(itemId) {
		$.ajax({
			url : 'getHotelItem.htm',
			data : {
				itemId : itemId
			},
			type : 'GET',
			dataType : 'json',
			error : function() {
				$('#info').html('<p>An error has occurred</p>');
			},
			success : function(data) {
				$("input[name='itemName']").val(data.itemName);
				$(".description").val(data.description);
				$("input[name='price']").val(data.price);
				$(".hid_itemId").val(itemId);
				$(".btn-addItem").html("Update");
			},
		});
	}
</script>
</head>
<body>
 <div class="modal  fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Are you sure..</h4>
		      </div>
		      <div class="modal-body">
		      <div class="table-responsive">
				 <form action="deleteEmp" method="post">
				 <input type="hidden" class="delemp" name="empId">
				 <input type="submit" class="btn btn-danger" value="Yes">
				 </form>
			  </div>
		      </div>
		      
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
         
	<div id="wrapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!--     	<div class="panel panel-default col-sm-12">
        	<div class="panel-heading">Login</div>
          	<div class="panel-body"> -->
 				<table class="table table-bordered">
				<thead><tr><th>EMP ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Doj</th>
  				<th>Contact</th>
  				<th>Position</th>
 				<th>Salary</th>
			    <th>Delete</th>
				</thead>
				<tbody class="tbd">
				<%DatabaseConnection db=new DatabaseConnection();
				ResultSet rs=db.selectQuery("select * from employee");
				
				try{
				while(rs.next())
				{
				%>
					  <tr><td class="description1"><%=rs.getString("eid") %></td>
						<td class="description2"><%=rs.getString("name") %></td>
						<td class="description3"><%=rs.getString("email") %></td>
						<td class="description4"><%=rs.getString("doj") %></td>
						<td class="description5"><%=rs.getString("contact") %></td>
						<td class="description6"><%=rs.getString("salary") %></td>
						<td class="description7"><%=rs.getString("position") %></td>
						<td class="description8"><a  href="javascript:void(0);" onclick="getItem(<%=rs.getString("eid") %>)">delete</a></td>
 </tr> 
				<%} 
				
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
	<!-- </div>
	</div> -->
</body>
</html>