<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  


  <!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

 
<!-- Include Date Range Picker -->
  <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>
<div style="color:#444054;padding: 5px;">
<form method="POST" action="${pageContext.request.contextPath}/result">
   <input type="radio" id="radio1" name="radios" value="radio1" checked>
   <label for="radio1">One Way</label>
         
<input type="radio" id="radio2" name="radios" value="radio2">
   <label for="radio2"">Round Trip</label>
    
    <input type="radio" id="radio3" name="radios" value="radio3">
   <label for="radio3">Multi-City</label>
 
<<<<<<< HEAD
  <p style="color: red;">${depart}</p>

 <ul class="nav nav-tabs">
  
  <li class=""><a href="#home" data-toggle="tab" aria-expanded="true">One-Way</a></li>
  
  <li class="active"><a href="#profile" data-toggle="tab" aria-expanded="false">Round-Trip</a></li>
  
  <li class=""><a href="#multi-city">Multi-City</a></li>
</ul>
<div id="myTabContent" class="tab-content">

  <div class="tab-pane fade active in" id="home">

  <form "form-horizontal" method="POST" action="${pageContext.request.contextPath}/search">
	<input type="hidden" name="trip" value= "${search.ways}" />
 	<div class = "form-group">
 		<div class = "col-sm-5">
 			<input class="form-control" value= "${search.departLocation}" type="text" name="from" placeholder="From where?"/>
 		</div>
 		<div class = "col-sm-5">
 			<input class="form-control" value= "${search.arrivalLocation}" type="text" name="to" placeholder="To where?">
 			</div>
 	</div>
 	<div class = "form-group">
 		<div class ="col-sm-5">
 			<input class="form-control" placeholder="Departure Date" name ="depart" id="datepicker"/>
 		</div>
 		<div class = "col-sm-5">
 			<input class="form-control" placeholder="Arrival Date" name ="arrive" id="datepicker"/>		
 		</div>
 	</div>
 	<div class ="form-group">
 		<div class ="col-sm-5">
 			Number of Adults: <input class="form-control" size= 2 value=1 name="adults" type="number">
 		</div>
 		<div class = "col-sm-5">
 			Number of Children: <input class="form-control" size = 2 value=0 name="child" type="number">
 		</div>
 	</div>
 	<div class = "form-group">
 		<div class ="col-sm-5">
 			<input class="form-control" type="checkbox" name="flex" value="Y"> Flexible date?
 		</div>
 		<div class = "col-sm-5">
 			<input class="form-control" type="checkbox" name="nonstop" value = "Y"> Nonstop?
 		</div>  	
 	</div>
 	
 	<div class= "form-group">
 		<div class = "col-sm-10">
 		<input class="form-control" type="submit" value= "Submit" />
 		</div>
     
 	</div>
 	</form>	
 	
 </div>
 	
 	<div class="tab-pane fade" id="profile">
   <form "form-horizontal" method="POST" action="${pageContext.request.contextPath}/search">
	<input class="form-control" type="hidden" name="trip" value= "${search.ways}" />
  	<div class = "form-group">
  		<div class = "col-sm-5">
  			<input class="form-control" type="text" name="from" placeholder="From where?"/>
  		</div>
  		<div class = "col-sm-5">
  			<input class="form-control" type="text" name="to" placeholder="To where?">
  			</div>
  	</div>
  	<div class = "form-group">
  		<div class ="col-sm-5">
  			<input class="form-control" placeholder="Departure Date" name ="depart" id="datepicker"/>
  		</div>
  		<div class = "col-sm-5">
  			<input class="form-control" placeholder="Arrival Date" name ="arrive" id="datepicker"/>		
  		</div>
  	</div>
  	<div class ="form-group">
  		<div class ="col-sm-5">
  			Number of Adults: <input class="form-control" size= 2 value=1 name="adults" type="number">
  		</div>
  		<div class = "col-sm-5">
  			Number of Children: <input class="form-control" size = 2 value=0 name="adults" type="number">
  		</div>
  	</div>
  	<div class = "form-group">
  		<div class ="col-sm-5">
  			<input class="form-control" type="checkbox" name="flex"> Flexible date?
  		</div>
  		<div class = "col-sm-5">
  			<input class="form-control" type="checkbox" name="nonstop"> Nonstop?
  		</div>  	
  	</div>
  	
  	<div class= "form-group">
  		<div class = "col-sm-10">
  		<input class="form-control" type="submit" value= "Submit" />
  		</div>
      
  	</div>
  	</form>
  </div>
  
  <div class="tab-pane fade" id="multi-city">
<form "form-horizontal" method="POST" action="${pageContext.request.contextPath}/search">
	<input class="form-control" type="hidden" name="trip" value= "${search.ways}" />
  	<div class = "form-group">
  		<div class = "col-sm-5">
  			<input class="form-control" type="text" name="from" placeholder="From where?"/>
  		</div>
  		<div class = "col-sm-5">
  			<input class="form-control" type="text" name="to" placeholder="To where?">
  			</div>
  	</div>
  	<div class = "form-group">
  		<div class ="col-sm-5">
  			<input class="form-control" placeholder="Departure Date" name ="depart" id="datepicker"/>
  		</div>
  		<div class = "col-sm-5">
  			<input class="form-control" placeholder="Arrival Date" name ="arrive" id="datepicker"/>		
  		</div>
  	</div>
  	<div class ="form-group">
  		<div class ="col-sm-5">
  			Number of Adults: <input class="form-control" size= 2 value=1 name="adults" type="number">
  		</div>
  		<div class = "col-sm-5">
  			Number of Children: <input class="form-control" size = 2 value=0 name="adults" type="number">
  		</div>
  	</div>
  	<div class = "form-group">
  		<div class ="col-sm-5">
  			<input class="form-control" type="checkbox" name="flex"> Flexible date?
  		</div>
  		<div class = "col-sm-5">
  			<input class="form-control" type="checkbox" name="nonstop"> Nonstop?
  		</div>  	
  	</div>
  	
  	<div class= "form-group">
  		<div class = "col-sm-10">
  		<input class="form-control" type="submit" value= "Submit" />
  		</div>
      
  	</div>
  	</form>
  	 </div>
  	
  </div>
  
  
 
 

=======
 <div id="oneway">
<table>
	<tr><td><center><input type="text" name="from[]" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to[]" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date" name="depart[]" id="datepicker"/></center></td></tr>
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults[]" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="child[]" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex[]"> Flexible date?<br></center></td></tr>
	<tr><td><center><input type="checkbox" name="nonstop[]"> Nonstop?<br></center></td></tr>
	</table>
</div>   
        
<div id="roundtrip"style="display:none";>
<table>
	<tr><td><center><input type="text" name="from[]" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to[]" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date" name="depart[]" id="datepicker"/></center></td>
	<td><center><input placeholder="Return Date" name="return[]" id="datepicker"/></center></td></tr>
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults[]" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="child[]" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex[]"> Flexible date?<br></center></td></tr>
	<tr><td><center><input type="checkbox" name="nonstop[]"> Nonstop?<br></center></td></tr>
	</table>
</div>

 <div id="multicity"style="display:none";>
<div id ="inner">
<table>
	<tr><td><center><input type="text" name="from[]" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to[]" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date" name="depart[]" id="datepicker"/></center></td></tr>
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults[]" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="child[]" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex[]"> Flexible date?<br></center></td></tr>
	<tr><td><center><input type="checkbox" name="nonstop[]"> Nonstop?<br></center></td></tr>
	</table>
	<br>
	</div>
	<div id="multiple"></div>
	<input type="button" value="Add Another City" onclick="addCity()">
</div> 
<br>
	<input type="submit" value="Search">
<br>
</form>
</div>
>>>>>>> master
<script>

var radios = document.getElementsByName("radios");

var oneway =  document.getElementById("oneway");

var roundtrip =  document.getElementById("roundtrip");

var multicity =  document.getElementById("multicity");

for(var i = 0; i < radios.length; i++) {
    radios[i].onclick = function() {
         val = this.value;
        if(val == 'radio1'){
        	oneway.style.display='block';
        	roundtrip.style.display='none';
        	multicity.style.display='none';
        }else if(val=='radio2'){
        	oneway.style.display='none';
        	roundtrip.style.display='block';
        	multicity.style.display='none';
        }
        else if(val=='radio3'){
        	oneway.style.display='none';
        	roundtrip.style.display='none';
        	multicity.style.display='block';
        }    
            
    }
}
function addCity(){
	
	var inside= document.getElementById("inner");
	var multi= document.getElementById("multiple");
	var clone = inside.cloneNode(true);
	multiple.appendChild(clone);
}
$(function() {
    $('input[name="depart[]"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
        showDropdowns: true
    }); 
    $('input[name="depart[]"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY'));
    });
});
$(function() {
    $('input[name="return[]"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
        showDropdowns: true

    });
    $('input[name="return[]"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY'));
    });
});


</script>