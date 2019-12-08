<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Emotion Based Music Player</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/gsdk-base.css" rel="stylesheet" />

<link href="css/font-awesome.css" rel="stylesheet">
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<!--   plugins 	 -->
<script src="js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
<script src="js/wizard.js"></script>
<link href="css/3.0/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="js/3.0/bootstrap.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="resources/css/main.min.css">

<script src="resources/js/jaudio.js" type="text/javascript"></script>


<script>
	function getUrlVars() {
		var vars = {};
		var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
				function(m, key, value) {
					vars[key] = value;
				});
		return vars;
	}
</script>

<script>
	var count = 0;
	var target = document.getElementById('targetID');
	var ws = new WebSocket("ws://127.0.0.1:9999");
	ws.onopen = function() {
		console.log("Openened connection to websocket");
	};
	var previousStatus = "";
	var countTime = false;
	ws.onmessage = function(msg) {
		var target = document.getElementById("target");
		console.log('String message received: ' + msg.data);
		if (typeof msg.data === "string") {
			var str = msg.data;
			document.getElementById('Knownstatus2').innerHTML = " " + str;
			if (str === "true") {
				onStartTimer();
				countTime = true;
			} else {
				if (!countTime && str === "false") {
					onStopTimer();
					countTime = false;
				}
			}
			console.log('String message received: ' + msg.data);
		} else if (msg.data instanceof ArrayBuffer) {
			url = window.URL.createObjectURL(msg.data);
			target.onload = function() {
				window.URL.revokeObjectURL(url);
			};
			target.src = url;
			//console.log('ArrayBuffer received: ' + msg.data);
		} else if (msg.data instanceof Blob) {
			url = window.URL.createObjectURL(msg.data);
			target.onload = function() {
				window.URL.revokeObjectURL(url);
			};
			target.src = url;
			//console.log('Blob received: ' + msg.data);
		}
	};
	// Put event listeners into place
	window
			.addEventListener(
					"DOMContentLoaded",
					function() {
						// Grab elements, create settings, etc.
						var canvas = document.getElementById("canvas"), context = canvas
								.getContext("2d"), video = document
								.getElementById("video"), videoObj = {
							"video" : true
						}, errBack = function(error) {
							console.log("Video capture error: ", error.code);
						};
						// Put video listeners into place
						if (navigator.getUserMedia) { // Standard
							navigator.getUserMedia(videoObj, function(stream) {
								video.src = stream;
								video.play();
								timecapture();
							}, errBack);
						} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
							navigator.webkitGetUserMedia(videoObj, function(
									stream) {
								video.src = window.URL.createObjectURL(stream);
								video.play();
								timecapture();
							}, errBack);
						} else if (navigator.mozGetUserMedia) { // WebKit-prefixed
							navigator.mozGetUserMedia(videoObj,
									function(stream) {
										video.src = window.URL
												.createObjectURL(stream);
										video.play();
										timecapture();
									}, errBack);
						}

						function timecapture() {
							timer = setInterval(function() {
								context.drawImage(video, 0, 0, canvas.width,
										canvas.height);
								var data = canvas.toDataURL();
								newblob = dataURItoBlob(data);
								ws.send(newblob);
							}, 250);
						}
						;
					});
	function dataURItoBlob(dataURI) {
		// convert base64/URLEncoded data component to raw binary data held in a string
		var byteString;
		if (dataURI.split(',')[0].indexOf('base64') >= 0)
			byteString = atob(dataURI.split(',')[1]);
		else
			byteString = unescape(dataURI.split(',')[1]);
		// write the bytes of the string to a typed array
		var ia = new Uint8Array(byteString.length);
		for (var i = 0; i < byteString.length; i++) {
			ia[i] = byteString.charCodeAt(i);
		}

		return new Blob([ ia ], {
			type : "image/png"
		});
	}

	/* 	 setInterval(
	
	 function addToDatabase()
	 {
	 var request;  
	 var val=document.getElementById("hoursNext").innerHTML+":"+
	 document.getElementById("minutesNext").innerHTML+":"+
	 document.getElementById("secondsNext").innerHTML;
	 alert(" Total Time away From work : " + val);
	 //window.location="";            		
	
	 if(window.XMLHttpRequest){  
	 request=new XMLHttpRequest();  
	 }  
	 else if(window.ActiveXObject){  
	 request=new ActiveXObject("Microsoft.XMLHTTP");  
	 }  
	
	

	 request.onreadystatechange=function gotoLogin(){  
	 if(request.readyState==4){  
	
	
	 window.location="Login.jsp";
	
	
	 }
	 };   
	
	
	 request.open("GET","LogoutServlet?val="+val,true);  
	 request.send();  
	
	 }  ,5000); */
	/*// $(document).ready(function() {
	

	 var val = document.getElementById("hoursNext").innerHTML + ":"
	 + document.getElementById("minutesNext").innerHTML + ":"
	 + document.getElementById("secondsNext").innerHTML;
	 alert("ygjgj");
	 $.ajax({
	
	 url : 'WasteHoursServlet1',
	 type : 'GET',
	 data : {
	 val : val
	 },
	 dataType : 'json',
	 error : function() {
	 alert("dcsadsa33333333333333333333ajbmbmnb");
	 },
	
	 success : function(data) {
	 alert("dcsadsaajbmbmnb");
	 },
	 });

	 }); */
	 
	  
	setInterval(

	function addToDatabase() {
		var request;
		var val = document.getElementById("hoursNext").innerHTML + ":"
				+ document.getElementById("minutesNext").innerHTML + ":"
				+ document.getElementById("secondsNext").innerHTML;
		
			//alert(" Total Time away From work : " + val);
		
		
						
		//window.location="";            		

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		request.onreadystatechange = function gotoLogin() {
			if (request.readyState == 4) {

				window.location = "FaceMood.jsp";

			}
		};
		
		request.open("GET", "WasteHoursServlet1?val=" + val, true);
		request.send();

	}, 150000);
</script>

</head>

<body style="background-color: ffffff" onload="setAllarm()">

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.htm">Salary System</a>



		</div>

		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">

			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">

					<li class="sideM"><a href="LogoutServlet"><i
							class="fa fa-fw fa-sign-out"></i> Log Out</a></li>
	</nav>
	<div class="image-container set-full-height"
		style="background-image: url('')">
		<!--   Big container   -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					 <div class="wizard-container">

						
							<div class="card wizard-card ct-wizard-orange  " id="wizard">
								<div class="wizard-header">
									<h3>
										<b><%=session.getAttribute("tt")%></b><br> <small>Work
											is worship.. So let's do it positively</small>
									</h3>
								</div>
								<ul>
									<li><div style="color: grey;">
											<a href="#userfsc" data-toggle="tab">Eye Detection system</a>
										</div></li>
								</ul>
								 <div class="tab-content">

									<div class="tab-pane" id="userfsc">


										<div class="row">

											<div class="col-sm-12">

												<div class="col-sm-12 col-sm-offset-4">
													<table>
														<tbody>
															<tr>
																<td width="200">
																	<div class="row">
																		<div class="well well-sm"
																			style="height: 260px; width: 340px">
																			<video id="video" width="320" height="240" autoplay
																				hidden></video>
																			<canvas id="canvas" width="320" height="240" hidden></canvas>
																			<img src="" alt="" id="target" width="320"
																				height="240" />
																		</div>
																	</div>

																</td>

															</tr>

															<tr>
																<td><label id="Knownstatus" class="panel-title">Biometric
																		Status: </label> <label id="Knownstatus2" class="panel-title"></label>
																	<span id="hoursNext" style="top: 0em;">00</span><span>:</span><span
																	id="minutesNext" style="top: -1em;">50</span><span>:</span><span
																	id="secondsNext" style="top: 0em;">00</span></td>
															</tr>
															<tr>

															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div> 


							</div> 
					</div>
				</div>



			</div>
		</div>
	</div>

	<script src="js/pomodoro-timer.js" type="text/javascript"></script>
</body>
</html>
