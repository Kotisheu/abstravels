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


  <p style="color: red;">${depart}</p>

 <ul class="nav nav-tabs">
  
  <li class=""><a href="#one-way" data-toggle="tab" aria-expanded="true">One-Way</a></li>
  
  <li class="active"><a href="#round-trip" data-toggle="tab" aria-expanded="false">Round-Trip</a></li>
  
  <li class=""><a href="#multi-city" data-toggle="tab" aria-expanded="false">Multi-City</a></li>
</ul>
<div id="myTabContent" class="tab-content">

  <div class="tab-pane fade active in" id="one-way">

  <form "form-horizontal" method="POST" action="${pageContext.request.contextPath}/search">
	<input type="hidden" name="trip" value= "${search.ways}" />
 	<div class = "form-group">
 		<div class = "col-lg-6">
 			<input class="form-control" value= "${search.departLocation}" type="text" name="from" placeholder="From where?"/>
 		</div>
 		<div class = "col-lg-6">
 			<input class="form-control" value= "${search.arrivalLocation}" type="text" name="to" placeholder="To where?">
 			</div>
 	</div>
 	<div class = "form-group">
 		<div class ="col-lg-6">
 			<input class="form-control" placeholder="Departure Date" name ="departDate" id="datepicker"/>
 		</div>
 		<div class = "col-lg-6">
 			<input class="form-control" placeholder="Arrival Date" name ="arriveDate" id="datepicker"/>		
 		</div>
 	</div>
 	<div class ="form-group">
 		<label for="inputPassword3" class="col-lg-2 control-label">Number of Adults:</label>
 		<div class ="col-lg-1">
 			 <input class="form-control" size= 2 value=1 name="adults" type="number">
 		</div>
 			<label for="inputPassword3" class="col-lg-2 control-label">Number of Children:</label>
 		<div class ="col-lg-1">
 			<input class="form-control" size = 2 value=0 name="child" type="number">
 		</div>
 		<div class ="col-lg-1">
 			<input class="form-control" type="checkbox" name="flex" value="Y"> Flexible date?
 		</div>
 		<div class = "col-lg-1">
 			<input class="form-control" type="checkbox" name="nonstop" value = "Y"> Nonstop?
 		</div>  	
 	</div>
 	
 	<div class= "form-group">
 		<div class = "col-lg-12">
 		<input class="form-control" type="submit" value= "Submit" />
 		</div>
     
 	</div>
 	</form>	
 	
 </div>
 	
 	<div class="tab-pane fade" id="round-trip">
   <form "form-horizontal" method="POST" action="${pageContext.request.contextPath}/search">
	<input type="hidden" name="trip" value= "${search.ways}" />
 	<div class = "form-group">
 		<div class = "col-lg-6">
 			<input class="form-control" value= "${search.departLocation}" type="text" name="from" placeholder="From where?"/>
 		</div>
 		<div class = "col-lg-6">
 			<input class="form-control" value= "${search.arrivalLocation}" type="text" name="to" placeholder="To where?">
 			</div>
 	</div>
 	<div class = "form-group">
 		<div class ="col-lg-6">
 			<input class="form-control" placeholder="Departure Date" name ="departDate" id="datepicker"/>
 		</div>
 		<div class = "col-lg-6">
 			<input class="form-control" placeholder="Arrival Date" name ="arriveDate" id="datepicker"/>		
 		</div>
 	</div>
 	<div class ="form-group">
 		<label for="inputPassword3" class="col-lg-2 control-label">Number of Adults:</label>
 		<div class ="col-lg-1">
 			 <input class="form-control" size= 2 value=1 name="adults" type="number">
 		</div>
 			<label for="inputPassword3" class="col-lg-2 control-label">Number of Children:</label>
 		<div class ="col-lg-1">
 			<input class="form-control" size = 2 value=0 name="child" type="number">
 		</div>
 		<div class ="col-lg-1">
 			<input class="form-control" type="checkbox" name="flex" value="Y"> Flexible date?
 		</div>
 		<div class = "col-lg-1">
 			<input class="form-control" type="checkbox" name="nonstop" value = "Y"> Nonstop?
 		</div>  	
 	</div>
 	
 	<div class= "form-group">
 		<div class = "col-lg-12">
 		<input class="form-control" type="submit" value= "Submit" />
 		</div>
     
 	</div>
 	</form>	
  </div>
  
  <div class="tab-pane fade" id="multi-city">
<form "form-horizontal" method="POST" action="${pageContext.request.contextPath}/search">
	<input type="hidden" name="trip" value= "${search.ways}" />
 	<div class = "form-group">
 		<div class = "col-lg-6">
 			<input class="form-control" value= "${search.departLocation}" type="text" name="from" placeholder="From where?"/>
 		</div>
 		<div class = "col-lg-6">
 			<input class="form-control" value= "${search.arrivalLocation}" type="text" name="to" placeholder="To where?">
 			</div>
 	</div>
 	<div class = "form-group">
 		<div class ="col-lg-6">
 			<input class="form-control" placeholder="Departure Date" name ="departDate" id="datepicker"/>
 		</div>
 		<div class = "col-lg-6">
 			<input class="form-control" placeholder="Arrival Date" name ="arriveDate" id="datepicker"/>		
 		</div>
 	</div>
 	<div class ="form-group">
 		<label for="inputPassword3" class="col-lg-2 control-label">Number of Adults:</label>
 		<div class ="col-lg-1">
 			 <input class="form-control" size= 2 value=1 name="adults" type="number">
 		</div>
 			<label for="inputPassword3" class="col-lg-2 control-label">Number of Children:</label>
 		<div class ="col-lg-1">
 			<input class="form-control" size = 2 value=0 name="child" type="number">
 		</div>
 		<div class ="col-lg-1">
 			<input class="form-control" type="checkbox" name="flex" value="Y"> Flexible date?
 		</div>
 		<div class = "col-lg-1">
 			<input class="form-control" type="checkbox" name="nonstop" value = "Y"> Nonstop?
 		</div>  	
 	</div>
 	
 	<div class= "form-group">
 		<div class = "col-lg-12">
 		<input class="form-control" type="submit" value= "Submit" />
 		</div>
     
 	</div>
 	</form>	
  	 </div>
  	
  </div>
  
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
    $('input[name="departDate"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
        showDropdowns: true
    }); 
    $('input[name="departDate"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY'));
    });
});
$(function() {
    $('input[name="arriveDate"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
        showDropdowns: true

    });
    $('input[name="arriveDate"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY'));
    });
});


</script>