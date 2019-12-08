<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="JSNew/jquery-1.12.4-jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css" />

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

<%

    HttpSession session1 = request.getSession(false);

    if(session1.getAttribute("username") == null)
    {
    	response.sendRedirect("Login.jsp");
    }

%>
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
					      <input class="form-control" title="Add full name: first_Name mid_name last_name" type="text" name="name" pattern="[a-zA-Z]+\s[a-zA-Z]+\s[a-zA-Z]+" onkeypress="return onlyAlphabets(event,this)" required>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-6">
					      <input class="form-control" type="password" name="password" title="Atleast 1 Capital letter, 1 special symbol and 1 number and no spaces" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" required>
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
					      <input class="form-control" pattern="[789][0-9]{9}" title="Start with 7/8/9" id="contact" name="contact" type="text" maxlength="10" onkeypress="return isNumber(event)" required>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-2 control-label">Position Name</label>
					    <div class="col-sm-6">
					    
					    <select class="form-control" id="position" name="position" class="form-control" required>
                           <option value="" selected>Select your Post in Company</option>
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
					      <input class="form-control" type="text" name="salary" required>
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
	
	
	<script type="text/javascript">

  $(document).ready( function(){
	  
	  
	  $("textarea").blur(function(){
		  
		  if($( this).val().trim() == "")
		  {
		  
		          alert("Please enter address");
		  
		  }
		  
	  });
	  
	  $("input").blur(function(){
			  
		  
		  if($(this).val().trim() == "")
			  {
			  
			          alert("Form field cannot be empty");
			  
			  }
		  else
			  {
			     
			        var name =  $(this).attr("name");
			        
			        if(name == "password")
			        	{
			        	
			                	if($(this).val().trim().length < 5)
			                		{
			                		       alert("Length of Password must be at least 5 characters");
			                		       
			                		       $(this).val('');
			                		       
			                		}
			                	else if(hasWhiteSpaceandTab($(this).val()))
			                	{
			                	     alert("Password cannot have white space character or tab character in it");
			                	     $(this).val('');
			                	}
			        	
			        	}
			        
			        else if(name == "email")
			        	{
			        	
			        	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
			        	
			        	if(!$(this).val().trim().match(mailformat))
			        		{
			        		 alert("You have entered an invalid email address!"); 
			        		 $(this).val('');
			        		}
			        	
			        	}
			        else if(name == "contact")
			        	{
			        	
			        	     if(!isInt($(this).val().trim()))
			        	    	 {
			        	    	     alert("Enter a whole number in Phone Number Field");
			        	    	     $(this).val('');
			        	    	 }
			        	     else if($(this).val().trim().length != 10)
			        	    	 {
			        	    	 alert("Length of Mobile Number must be 10 digits");
			        	    	 }
			        	    
			        	
			        	}
			        
			       
			        else if(name == "salary")
		        	{
		        	
		        	     if(isNaN($(this).val().trim()))
		        	    	 {
		        	    	     alert("Enter a number in Salary Field");
		        	    	     $(this).val('');
		        	    	 }
		        	    
		        	}
			       
		        	
			  
			  }
	  
	  
	  });
	  
	  
	 
	  
  });
  
  
  
  function hasWhiteSpaceandTab(s) {
	  return /\s/g.test(s);
	}
  
  function isInt(value) {
		return !isNaN(value) && parseInt(Number(value)) == value
				&& !isNaN(parseInt(value, 10));
	}
  
  
  
  
 
  
  </script>
  
  <script type="text/javascript">
  
  function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
  
  
  
  </script>
  
  
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
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || ($("[name='name']").val().trim().length > 1 && charCode == 32))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }

    </script>
  
  
  
</body>
</html>