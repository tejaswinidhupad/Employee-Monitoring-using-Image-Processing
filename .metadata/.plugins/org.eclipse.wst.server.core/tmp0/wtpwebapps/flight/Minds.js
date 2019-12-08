function showDiv(select){
   if(select.value==1){
    document.getElementById('one').style.display = "block";
    document.getElementById('two').style.display = "none";
    document.getElementById('three').style.display = "none";
    document.getElementById('four').style.display = "none";
    document.getElementById('five').style.display = "none";
   } 
   else if(select.value==2){
    document.getElementById('one').style.display = "block";
    document.getElementById('two').style.display = "block";
    document.getElementById('three').style.display = "none";
    document.getElementById('four').style.display = "none";
    document.getElementById('five').style.display = "none";


   }
   else if(select.value==3){
	    document.getElementById('one').style.display = "block";
	    document.getElementById('two').style.display = "block";
	    document.getElementById('three').style.display = "block";
	    document.getElementById('four').style.display = "none";
	    document.getElementById('five').style.display = "none";


	   }
   else if(select.value==4){
	    document.getElementById('one').style.display = "block";
	    document.getElementById('two').style.display = "block";
	    document.getElementById('three').style.display = "block";
	    document.getElementById('four').style.display = "block";
	    document.getElementById('five').style.display = "none";


	   }
   else if(select.value==5){
	    document.getElementById('one').style.display = "block";
	    document.getElementById('two').style.display = "block";
	    document.getElementById('three').style.display = "block";
	    document.getElementById('four').style.display = "block";
	    document.getElementById('five').style.display = "block";


	   }
}

