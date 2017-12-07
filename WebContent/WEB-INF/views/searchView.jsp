<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  


  <!-- Include Required Prerequisites -->
  <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
  <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
 
  <!-- Include Date Range Picker -->
  <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>
<div style="color:#444054;padding: 5px;">
<form method="POST" action="${pageContext.request.contextPath}/search">
   <input type="radio" id="radio1" name="radios" value="radio1" checked>
   <label for="radio1">One Way</label>
         
<input type="radio" id="radio2" name="radios" value="radio2">
   <label for="radio2"">Round Trip</label>
    
    <input type="radio" id="radio3" name="radios" value="radio3">
   <label for="radio3">Multi-City</label>
 
 <div id="oneway">
<table>
	<tr><td><center><input type="text" name="from[]" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to[]" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date MM/dd/yyyy" name="depart[]" id="datepicker"/></center></td></tr>
	<input type='hidden' value='00/00/0000' name="return[]">
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults[]" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="child[]" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex[]"> Flexible date?<br></center></td></tr>
	<input type='hidden' value='0' name="flex[]">
	<tr><td><center><input type="checkbox" name="nonstop[]" checked="true"> Nonstop?<br></center></td></tr>
	<input type='hidden' value='0' name="nonstop[]">
	</table>
</div>   
        
<div id="roundtrip" disabled style="display:none";>
<table>
	<tr><td><center><input type="text" name="from[]" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to[]" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date MM/dd/yyyy" name="depart[]" id="datepicker"/></center></td>
	<td><center><input placeholder="Return Date MM/dd/yyyy" name="return[]" id="datepicker"/></center></td></tr>
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults[]" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="child[]" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex[]"> Flexible date?<br></center></td></tr>
	<input type='hidden' value='0' name="flex[]">
	<tr><td><center><input type="checkbox" name="nonstop[]" checked="true"> Nonstop?<br></center></td></tr>
	<input type='hidden' value='0' name="nonstop[]">
	</table>
</div>

 <div id="multicity" disabled style="display:none";>
<div id ="inner">
<table>
	<tr><td><center><input type="text" name="from[]" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to[]" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date MM/dd/yyyy" name="depart[]" id="datepicker"/></center></td></tr>
	<input type='hidden' value='00/00/0000' name="return[]">
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults[]" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="child[]" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex[]"> Flexible date?<br></center></td></tr>
	<input type='hidden' value='0' name="flex[]">
	<tr><td><center><input type="checkbox" name="nonstop[]" checked="true"> Nonstop?<br></center></td></tr>
	<input type='hidden' value='0' name="nonstop[]">
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
        	oneway.disabled=false;
        	roundtrip.style.display='none';
        	roundtrip.disabled=true;
        	multicity.style.display='none';
        	multicity.disabled=true;
        }else if(val=='radio2'){
        	oneway.style.display='none';
        	oneway.disabled=true;
        	roundtrip.style.display='block';
        	roundtrip.disabled=false;
        	multicity.style.display='none';
        	multicity.diabled=true;
        }
        else if(val=='radio3'){
        	oneway.style.display='none';
        	oneway.disabled=true;
        	roundtrip.style.display='none';
        	roundtrip.disabled=true;
        	multicity.style.display='block';
        	multicity.disabled=false;
        }    
            
    }
}
function addCity(){
	
	var inside= document.getElementById("inner");
	var multi= document.getElementById("multiple");
	var clone = inside.cloneNode(true);
	multiple.appendChild(clone);
}
// $(function() {
//     $('input[name="depart[]"]').daterangepicker({
//     	autoUpdateInput: false,
//     	singleDatePicker: true,
//         showDropdowns: true
//     }); 
//     $('input[name="depart[]"]').on('apply.daterangepicker', function(ev, picker) {
//         $(this).val(picker.startDate.format('MM/DD/YYYY'));
//     });
// });
// $(function() {
//     $('input[name="return[]"]').daterangepicker({
//     	autoUpdateInput: false,
//     	singleDatePicker: true,
//         showDropdowns: true

//     });
//     $('input[name="return[]"]').on('apply.daterangepicker', function(ev, picker) {
//         $(this).val(picker.startDate.format('MM/DD/YYYY'));
//     });
// });


</script>