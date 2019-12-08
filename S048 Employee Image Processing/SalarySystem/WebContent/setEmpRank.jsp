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
    <link href="raterater.css" rel="stylesheet">
	<script src="raterater.jquery.js"></script>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script>
	    $(document).ready(function(){
	    	getEmpDetails();
/* 	        $(".sideM").removeClass('active');
	        $(".itemM").addClass('active');
	        getHotelItemList(); */
	    	$('.datep').datepicker({
	    		format : 'dd-mm-yyyy',
	             autoclose:true
	     	});
	    });
	    
	    function rateAlert(id, rating)
	    {
	        var empId = id.split("-")[1];
	        //alert( 'Rating for '+empId+' is '+rating+' stars!' );
	        
	        $.ajax({
    		   url: 'test',
    		   type: 'GET',
    		   data:{empId:empId,rating:rating},
    		   dataType: 'json',
    		   error: function() {
    		      $('#info').html('<p>An error has occurred</p>');
    		   },
    		   success: function(data) {
    			   //alert(data.status);
    			   $('.s-'+empId).html(data.status);
    		   }
	        });  
	    }
	    
	    function getEmpDetails(){
	    	$.ajax({
    		   url: 'SetPerformance',
    		   type: 'GET',
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
			                 boiler += '<td>'+data[i].name+'</td>';
			                 boiler += '<td>'+data[i].position+'</td>';
			                 boiler += '<td><div class="ratebox" data-id="e-'+data[i].eid+'" data-rating="'+data[i].rank+'"></div></td>';
			                 boiler += '<td class="s-'+data[i].eid+'"></td>';
			                 boiler += '</tr>';
			              }
	                   $('.tbody').html(boiler);
	                   $( '.ratebox' ).raterater( { 
	                       submitFunction: 'rateAlert',
	                       allowChange: true,
	                       starWidth: 20,
	                       spaceWidth: 10,
	                       numStars: 5
	                   } );
	                   }
	     			  else{
	     				 boiler += '<tr>';
	     				 boiler += '</tr>';
	     				$('.tbody').html(boiler);
	     			  }
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
 
          	<h3 class="alert alert-info text-center">Set Employees Rating</h3>
           		<table class="table">
          		
          		<tr><th>EMP_ID</th>
          		<th>EMP_NAME</th>
          		<th>EMP_ROLE</th>
           		<th>SET_PERFORMANCE</th>
           		           		<th>STATUS</th>
           		
           	 
          		<tbody class="tbody"></tbody>
          		</table>
          		
          		
          	</div>
    	</div>
	</div>
	 
</body>
</html>