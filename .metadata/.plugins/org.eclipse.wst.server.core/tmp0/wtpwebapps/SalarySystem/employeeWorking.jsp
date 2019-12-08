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
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script>
	    function daysInMonth(month,year) {
	        return new Date(year, month, 0).getDate();
	    }
	   	 $(document).ready(function(){
/* 	        $(".sideM").removeClass('active');
	        $(".itemM").addClass('active');
	        getHotelItemList(); */
	    	$('.month').datepicker({
	    		 format: "mm-yyyy",
	    		 viewMode: "months", 
	             autoclose:true
	     	});
	        
	    	$('.month').change(function () {
	    	    var date = $('.month').val();
	    	    var month = date.split("-")[0];
	    	    var year = date.split("-")[1];
	    	    var s = daysInMonth(month,year);
	    	    //alert(s);
	    	    $('.workdays').val(s);
	    	});
	    });
	    
	    function  salaryResult(){
	    	
	    	$.ajax({
	    		   url: 'ShowSalary',
 	    		   type: 'POST',
	    		   dataType: 'json',
	    		   error: function() {
	    		      $('#info').html('<p>An error has occurred</p>');
	    		   },
	    		   success: function(data) {
	     			   var boiler = '';
	     			  if(data.length>0){
	                   for(var i=0;i<data.length;i++){
			                 boiler += '<tr>';
			                 boiler += '<td>'+data[i].eid+'</td>';
			                 boiler += '<td>'+data[i].month+'</td>';
			                 boiler += '<td>'+data[i].year+'</td>';
			                 boiler += '<td>'+data[i].workdays+'</td>';
		 	                 boiler += '<td>'+data[i].totalWorkingHours+'</td>';
			                 boiler += '<td>'+data[i].actualWorkHours+'</td>';
			                 boiler += '<td>'+data[i].actualSal+'</td>';
			                 boiler += '<td>'+data[i].grossSal+'</td>';
			                 boiler += '</tr>';
			              }
	                   }
	     			  else{
	     				 boiler += '<tr>';
	     				 boiler += '<td colspan=9>Salary for this month already calulated... <button type="button" class="btn btn-success" onclick="salaryResult();">Show Result</button></td>';
	     				 boiler += '</tr>';
	     			  }
	              $('.tbd1').html(boiler);
	          	 $('.modal').modal('show');
	     		   },
	    		});
	   
	    }
	    
	    function getSalary(eid){
 	    	var date = $('.month').val();
    	    var month = date.split("-")[0];
    	    var year = date.split("-")[1];
	    	 var year=$('.year').val();
	    	var workdays=$('.workdays').val();
	    	$.ajax({
    		   url: 'GetSalaryServlet',
    		   data: {eid:eid,month:month,year:year,workdays:workdays},
    		   type: 'POST',
    		   dataType: 'json',
    		   error: function() {
    		      $('#info').html('<p>An error has occurred</p>');
    		   },
    		   success: function(data) {
    			   
     			   var boiler = '';
     			   
     			   
     			  if(data.length>0){
                   for(var i=0;i<data.length;i++){
                 boiler += '<tr>';
                 boiler += '<td>'+data[i].eid+'</td>';
                 boiler += '<td>'+data[i].month+'</td>';
                 boiler += '<td>'+data[i].year+'</td>';
                 boiler += '<td>'+data[i].workdays+'</td>';
                 boiler += '<td>'+data[i].wastedHours+'</td>';
                 boiler += '<td>'+data[i].totalWorkingHours+'</td>';
                 boiler += '<td>'+data[i].actualWorkHours+'</td>';
                 boiler += '<td>'+data[i].actualSal+'</td>';
                 boiler += '<td>'+data[i].grossSal+'</td>';
                 boiler += '</tr>';
              }}
     			  else{
     				 boiler += '<tr>';
     				 boiler += '<td colspan=9>Salary for this month already calulated... <button type="button" class="btn btn-success" onclick="salaryResult();">Show Result</button></td>';
     				 boiler += '</tr>';
     			  }
              $('.tbd').html(boiler);
              $('.table-bordered').removeClass('hide');
    	 
     		   },
    		});
	    }
    </script>
</head>
<body>
<div id="wrapper">
	<jsp:include page="Header.jsp"></jsp:include>
    <div id="page-wrapper" style="background-color: #f0f0f0;">
    	<div class="container-fluid">
		  	<div class="form-group">
			    <label class="col-sm-3 control-label">Select Month</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control month">
			    </div>
			        <label class="col-sm-2 control-label">Select Year</label>
			    <div class="col-sm-3">
			      <select class="form-control year">
			      	<option value="2016">2016</option>
			      	<option value="2017">2017</option>
			      	<option value="2018">2018</option>
			      	<option value="2019">2019</option>
			      	<option value="2020">2020</option>
			      	<option value="2021">2021</option>
			      	<option value="2025">2025</option>
			      	<option value="2026">2026</option>
			      	<option value="2027">2027</option>
			      	<option value="2028">2028</option>
			      	<option value="2029">2029</option>
			      	<option value="2030">2030</option>
			      </select>
			    </div>  
		  	</div><br><br>
		  	<div class="form-group">
		  		<label class="col-sm-3 control-label">working days of the month</label>
			    <div class="col-sm-3">
			      <input type="number" class="form-control workdays" disabled="disabled">
			      	 
			    </div>
 			       <div class="col-sm-3">
			       <%DatabaseConnection db=new DatabaseConnection();
			       ResultSet rs=db.selectQuery("select * from employee");
			      int eid=0;
			      
			      try{
			    	  
			      
			      if(rs.next()){ eid=rs.getInt("eid");
                  session.setAttribute("eid", eid);
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
			      	 
			      </div>
			    <div class="col-sm-1">
		      		<button type="button" onclick='getSalary(<%=eid %>);' class="btn btn-sm btn-danger" class="btn btn-success">Submit</button>
		    	</div>
		  	</div>
			<hr>
			<table class="table table-bordered hide">
				<thead><tr><th>EMP ID</th>
				<th>MONTH</th>
				<th>YEAR</th>
				<th>WORK DAYS</th>
				<th>WASTED HOURS</th>
  				<th>TOTAL WORK HOURS</th>
 				<th>ACTUAL WORK HOURS</th>
			    <th>ACTUAL SALARY</th>
 				<th>FINAL SALARY</th></tr>
				
				</thead>
				<tbody class="tbd">
					<!-- <tr><td class="description1"></td>
						<td class="description2"></td>
						<td class="description3"></td>
						<td class="description4"></td>
						<td class="description5"></td>
						<td class="description6"></td>
						<td class="description7"></td>
						<td class="description8"></td>
						<td class="description9"></td></tr> -->
  				</tbody>
			</table>
         </div>
         
         <div class="modal  fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Salary Detail</h4>
		      </div>
		      <div class="modal-body">
		      <div class="table-responsive">
		        <table class="table table-bordered">
				<thead><tr><th>Emp Id</th>
				<th>Month</th>
				<th>Year</th>
				<th>Work Days</th>
				<th>Total Work Hours</th>
				<th>Actual Work Hours</th>
			    <th>Actual Salary</th>
 				<th>Final Salary</th></tr>
				
				</thead>
				<tbody class="tbd1">
					
  				</tbody>
			</table>
			</div>
		      </div>
		      
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
         
	</div>
</div>
</body>
</html>