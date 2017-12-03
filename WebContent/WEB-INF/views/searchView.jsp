<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  


  <!-- Include Required Prerequisites -->
  <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
  <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
   
  <!-- Include Date Range Picker -->
  <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript">
$(function() {
    $('input[name="depart"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
        showDropdowns: true
    }); 
    $('input[name="depart"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY'));
    });
});
$(function() {
    $('input[name="return"]').daterangepicker({
    	autoUpdateInput: false,
    	singleDatePicker: true,
        showDropdowns: true

    });
    $('input[name="return"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('MM/DD/YYYY'));
    });
});
</script>
</head>
<div style="padding: 5px;">
<form method="POST" action="${pageContext.request.contextPath}/search">
<table >
	<tr><td><center><input type="text" name="from" placeholder="From where?"></center></td>
	<td><center><input type="text" name="to" placeholder="To where?"></center></td></tr>
	<tr><td><center><input placeholder="Departure Date" name ="depart" id="datepicker"/></center></td>
	<td><center><input placeholder="Return Date" name ="return" id="datepicker"/></center></td></tr>
	<tr><td><center>Number of Adults: <input size= 2 value=1 name="adults" type="number"></center></td>
	<td><center>Number of Children: <input size = 2 value=0 name="adults" type="number"></center></td></tr>
	<tr><td><center><input type="checkbox" name="flex"> Flexible date?<br></center></td></tr>
	</table>
	<input type="submit" value="Search">

</form>
</div>