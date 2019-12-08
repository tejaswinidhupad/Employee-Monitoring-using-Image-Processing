<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<div id="wrapper">
	<jsp:include page="Header.jsp"></jsp:include>
    <div id="page-wrapper">
    <div class="container-fluid">
<!--     	<div class="panel panel-default col-sm-12">
        	<div class="panel-heading">Login</div>
          	<div class="panel-body"> -->
          	<h3 class="alert alert-info text-center">ADD EMPLOYEE</h3>
          		<form class="form-horizontal col-sm-offset-2" method="post" action="AddEmployeeServlet" name="form1">
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Employee Name</label>
					    <div class="col-sm-6">
					      <input class="form-control" title="e.g. abb cad tar" type="text" onkeypress="return onlyAlphabets(event,this)" id="name" name="name" pattern="[a-zA-Z]+\s[a-zA-Z]+\s[a-zA-Z]+" required>
					    </div>
				  	</div>
				  	
				  	<div class="form-group">
				    	<label class="col-sm-2 control-label">Address</label>
				    	<div class="col-sm-6">
				      		<textarea class="form-control description" name="address" required></textarea>
				    	</div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Mobile Number</label>
					    <div class="col-sm-6">
					      <input class="form-control" pattern="[789][0-9]{9}" title="Start with 7/8/9 and only numbers" id="contact" name="contact" type="text" maxlength="10" required>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Position Name</label>
					    <div class="col-sm-6">
					    
					    <select class="form-control" id="position" name="position" class="form-control" required>
                           <option value="" selected>Select Post in Company</option>
                             <option value="Software Developer">Software Developer</option>
                            <option value="General Manager">General Manager</option>
                            <option value="Accountant">Accountant</option>
                            <option value="HR Manager">HR Manager</option>
                            <option value="CEO">CEO</option>
                            <option value="System Administrator">System Administrator</option>
                            <option value="Researcher">Researcher</option>
                            <option value="Worker">Worker</option>
                            <option value="Salesman">Salesman</option>
                            <option value="Business Development Executive">Business Development Executive</option>
                            <option value="Network Manager">Network Manager</option>
                       
                       </select>
					    
					      
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Email Address</label>
					    <div class="col-sm-6">
					      <input class="form-control" type="email" name="email" required>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Salary</label>
					    <div class="col-sm-6">
					      <input class="form-control" type="text" name="salary" pattern="[1-9]{1}[0-9]{1,5}" title="Only numbers and maximum length is 6" maxlength="6" required>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Date of Joining</label>
					    <div class="col-sm-6">
					      <input class="form-control datep" type="text" name="doj" required>
					    </div>
				  	</div>
				  	<div class="form-group">
				    	<div class="col-sm-offset-2 col-sm-10">
				      		<button type="submit" class="btn btn-success">Add</button>
				      		<% if(session.getAttribute("flag")!=null){
				      			out.print("<h3 class='alert alert-danger'>");
				    		out.print(session.getAttribute("flag"));
				    		session.setAttribute("flag",null);
				    		out.print("</h3>");
				    	} %>
				    	</div>
				     
				  	</div>
				</form>
          	</div>
    	</div>
	</div>
	<!-- </div>
	</div> -->
	
	
	
	


<script language="Javascript" type="text/javascript">

        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || (($("#name").val().length > 1) && charCode == 32))
                    return true;
                else
                	{
                	
                	
                	
                	
                    	return false;
                    
                    	
                    	
                	}
            }
            catch (err) {
                alert(err.Description);
            }
        }

    </script>


</body>
</html>