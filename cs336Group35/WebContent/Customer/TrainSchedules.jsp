<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Browsing and Searching</title>
	</head>
<body>
	<nav>
		<li>
			<ul>Hi <%= session.getAttribute("name") %></ul>
			<ul><a href="../index.jsp">Log out</a></ul>
		</li>
	</nav>
	<br>
	<b>Make Reservation</b>
	<br>
	<br>
		<input type="button" onclick="location.href='/cs336Group35Video/Reservation/Reservation.jsp'" value="Make Reservation">
	<br>
	<br>
	<b>Browse the train schedules</b>
	<br>
	<br>
	<em>By Train</em>
	<br>
	<br>
		
		<form method="get" action="TrainStopsQuery.jsp">
			<label for="train">Train:</label>
			<select name="train" size=1>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>&nbsp;<br> <input type="submit" value="Search">
		</form>
	<br>
	<em>By Origin, Destination, and Departure</em>
	<br>
	<br>
		<form method="get" action="OriDestTimeQuery.jsp">
			<label for="origin">Origin:</label>
			<select name="origin" size=1>
				<option value="1">Frost Mountain Rail Line</option>
				<option value="2">Midland Train Line</option>
				<option value="3">South Central Tracks</option>
				<option value="4">Arrow Point Tracks</option>
				<option value="5">Salt Lake Loop Line</option>
				<option value="6">Lotus Lake Line</option>
				<option value="7">Sunflower Rail Line</option>
				<option value="8">Marble Harbor Main Line</option>
			</select>&nbsp;
		
			<label for="destination">Destination:</label>
			<select name="destination" size=1>
				<option value="1">Frost Mountain Rail Line</option>
				<option value="2">Midland Train Line</option>
				<option value="3">South Central Tracks</option>
				<option value="4">Arrow Point Tracks</option>
				<option value="5">Salt Lake Loop Line</option>
				<option value="6">Lotus Lake Line</option>
				<option value="7">Sunflower Rail Line</option>
				<option value="8">Marble Harbor Main Line</option>
			</select>&nbsp;<br>
		
		<br>
		<table>
		<tr>    
		<td>Departure</td><td><input type="text" name="departure"></td>
		</tr>
		</table>
		<input type="submit" value="Search">
		</form>
	<br>
	<br>
	<b>Sort the train schedules</b>
	<br>
	<br>
		<form method="get" action="TrainSchedulesQuery.jsp">
			<label for="sort_by">Sort By:</label>
			<select name="sort_by" size=1>
				<option value="arrival">Arrival time</option>
				<option value="departure">Departure time</option>
				<option value="fare">Fare</option>
			</select>&nbsp;<br> <input type="submit" value="Sort">
		</form>
	<br>
	
	<a href="customerQuestions.jsp">Add questions</a>

</body>
</html>