<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cust Rep Home Page</title>


<script type="text/javascript">
alert(reached);
function checkDate(){
	var tmp = document.forms["cuslist"]["theInput"].value;
	var pattern = /^([0-9]{4})-([0-9]{2})-([0-9]{2})$/;
	alert(reached);
	if (!pattern.test(tmp)) {
		alert("Enter a Proper Date");
		//document.getElementById("custList").disabled = false;
	}
	
}

</script>



</head>
<body>

<nav>
		<li>
			<ul>Hi <%= session.getAttribute("name") %></ul>
			<ul>SSN: <%= session.getAttribute("ssn") %></ul>
			<ul><a href="../index.jsp">Log out</a></ul>
		</li>
	</nav>
<br>
<br>
Edit Train Schedules:
<br>
<form method="post" action="editTS.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="edit" required/>Edit Information for train schedules
  <br>
  <input type="radio" name="command" value="delete" required/>Delete Information for train schedules
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters -->
  <br>
  <input id = "editTrain" type="submit" value="go"/>
</form>
<br>

OR

<br>
Produce List of Train Schedules:
<br>
	<form method="get" action="listTrainSchedule.jsp">
	
	
	<input type="radio" name="command" value="origin" required/>Origin
  <br>
  <input type="radio" name="command" value="destination" required/>Destination
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters -->
  <br>
		<select name="stat" size=1>
			<option value="1">Frost Mountain Rail Line</option>
			<option value="2">Midland Train Line</option>
			<option value="3">South Central Tracks</option>
			<option value="4">Arrow Point Tracks</option>
			<option value="5">Salt Lake Loop Line</option>
			<option value="6">Lotus Lake Line</option>
			<option value="7">Sunflower Rail Line</option>
			<option value="8">Marble Harbor Main Line</option>
		</select>&nbsp;
		<br> 
		
		<input type="submit" value="submit">
	</form>
	
	<br>

OR

<br>
Produce List of Customers with Reservation on given transit line and date
<br>
	<form name="cuslist" method="get" action="customerList.jsp" onSubmit="return checkDate();">
			<select name="tline" size=1>
			<option value="Green Corridor Line">Green Corridor Line</option>
			<option value="Blue Corridor Line">Blue Corridor Line</option>
			<option value="Red Corridor Line">Red Corridor Line</option>
			<option value="Orange Corridor Line">Orange Corridor Line</option>
			<option value="Purple Corridor Line">Purple Corridor Line</option>
			<option value="Brown Corridor Line">Brown Corridor Line</option>
			<option value="White Corridor Line">White Corridor Line</option>
			<option value="Gold Corridor Line">Gold Corridor Line</option>
			<option value="Black Corridor Line">Black Corridor Line</option>
			<option value="Yellow Corridor Line">Yellow Corridor Line</option>
		</select>&nbsp;
	<br>

	Date<input id="theInput" type="date" placeholder="yyyy-mm-dd" min="1997-01-01" max="2030-12-31" name="date" required>
<br>
	<input type="submit" id="custList" value="Go!">
	</form>
	
<br>
<br>

OR
<br>
<br>
Do Question/Answer stuff
	<form method="post" action="ReplyQuestion.jsp">
	<input type="submit" value="Go!">
	</form>














</body>
</html>