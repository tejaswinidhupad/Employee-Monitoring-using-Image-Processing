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
/* 	        $(".sideM").removeClass('active');
	        $(".itemM").addClass('active');
	        getHotelItemList(); */
	    	$('.datep').datepicker({
	    		format : 'dd-mm-yyyy',
	             autoclose:true
	     	});
	        
	    	$( '.ratebox' ).raterater( { 
                submitFunction: 'rateAlert',
                allowChange: true,
                starWidth: 20,
                spaceWidth: 10,
                numStars: 5
            } );
	        
	    });
	    
	    function getItem(itemId){
	    	$.ajax({
    		   url: 'getHotelItem.htm',
    		   data: {itemId:itemId},
    		   type: 'GET',
    		   dataType: 'json',
    		   error: function() {
    		      $('#info').html('<p>An error has occurred</p>');
    		   },
    		   success: function(data) {
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
<%
String eid=session.getAttribute("eid").toString();
DatabaseConnection db=new DatabaseConnection();
ResultSet rs=db.selectQuery("select rank from employee where eid='"+eid+"'");
String rank="";

try{
if(rs.next()){
	rank=rs.getString("rank");
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
<div id="wrapper">
	<jsp:include page="Header1.jsp"></jsp:include>
    <div id="page-wrapper">
    <div class="container-fluid">
<!--     	<div class="panel panel-default col-sm-12">
        	<div class="panel-heading">Login</div>-->
          	<div class="panel-body" > 
          	          	 Rating :	<div class="ratebox" data-id="1" data-rating="<%=rank%>"></div>
           	        <img src="fonts/slide.jpg" width="100%" height="150%"/>
          	</div>
    	</div>
	</div>
	<!-- </div>
	</div> -->
</body>
</html>