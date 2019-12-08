
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Alley Signup & Signin Form Responsive Widget Template  :: w3layouts</title>
<link href="css/style.css" rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Alley Signup & Signin Form Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements" ./="">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<script src="js/jquery.min.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
				<script type="text/javascript">
					$(document).ready(function () {
						$('#horizontalTab').easyResponsiveTabs({
							type: 'default', //Types: default, vertical, accordion           
							width: 'auto', //auto or any width like 600px
							fit: true   // 100% fit in a container
						});
					});
				   </script>
</head>
<body>
 
 

<!---728x90--->
 
	<h1> Employee Management	 </h1>
<!---728x90--->
 
<div class="main-content">
	<div class="sap_tabs">	
		 
		<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
		 
			  <ul>
			  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>User Credential</span></li>
<!-- 				  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Sign in</span></li>
 -->				  
			  </ul>		
			  <!---->

			<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
				<div class="facts">
					<div class="register">
						<form action="LoginServlet"  method="post">										
							<input placeholder="Email Address" name="username" class="mail" type="text" required>									
							<input placeholder="Password" class="lock" name="password" type="password" required>										
							<div class="sign-up">
								<input type="submit" value="Sign in">
							</div>
							
							
							<br/> <br/>
							
							
							<%
							
							    if(session.getAttribute("status") != null)
							    {
							
							%>
							
							<font color="white" size="5"><%= session.getAttribute("status").toString() %></font>
							
							
							<%
							
							
							    }
							%>
							
						</form>
					</div>
				</div> 
			</div>	

			<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
			
			<div class="facts">
					<!--login1-->
					<div class="register">
						<form>	
							<input placeholder="Name" name="name" id="name" type="text" required pattern="[a-zA-Z]+\s[a-zA-Z]+\s[a-zA-Z]+">
							<input placeholder="Email Address" name="email" id="email" type="email" required>									
							<input placeholder="Password" type="password" name="password1" id="password1" required title="Atleast 1 Capital letter, 1 special symbol and 1 number and no spaces" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$">	
							<input placeholder="Confirm Password" type="password" name="conPassword" id="conPassword" required title="Atleast 1 Capital letter, 1 special symbol and 1 number and no spaces" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$">
								<div class="sign-up">
									<input type="submit" value="Create Account">
								</div>
						</form>
					</div>
				</div>
			
				
			</div> 			        					            	      
			 	
		</div>	
		
	</div>
</div>
<!---728x90--->
<div style="text-align: center;"><script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-9153409599391170" data-ad-slot="6850850687"></ins>
<script>
 </script></div>
	 <!--start-copyright-->
   		<div class="copy-right">
   			 
		</div>
	<!--//end-copyright-->
	
	

    
    
 
</body>
</html>