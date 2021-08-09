<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Res by Cust</title>
</head>
<body>
<nav>
		<li>
			<ul>Hi <%= session.getAttribute("name") %></ul>
			<ul>SSN: <%= session.getAttribute("ssn") %></ul>
			<ul><a href="../index.jsp">Log out</a></ul>
		</li>
	</nav>

List of reservations by customer name
<br>
	<form method="get" action="listResCustResults.jsp">
		<table>
			<tr>    
				<td>First Name</td><td><input type="text" name="tLinec"></td>
			</tr>
			<tr>
				<td>Last Name</td><td><input type="text" name="tLinec2"></td>
			</tr>
			
		</table>
		<input type="submit" value="Submit">
	</form>
<br>

List of reservations by transit line
<br>
	<form method="get" action="listResTransResults.jsp">
		<select name="tLineRes" size=1>
			<option value='Green Corridor Line'>Green Corridor Line</option>
			<option value='Blue Corridor Line'>Blue Corridor Line</option>
			<option value='Red Corridor Line'>Red Corridor Line</option>
			<option value='Orange Corridor Line'>Orange Corridor Line</option>
			<option value='Purple Corridor Line'>Purple Corridor Line</option>
			<option value='Brown Corridor Line'>Brown Corridor Line</option>
			<option value='White Corridor Line'>White Corridor Line</option>
			<option value='Gold Corridor Line'>Gold Corridor Line</option>
			<option value='Black Corridor Line'>Black Corridor Line</option>
			<option value='Yellow Corridor Line'>Yellow Corridor Line</option>

		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

List of revenue by customer name
<br>
	<form method="get" action="listRevCustResults.jsp">
		<table>
			<tr>    
				<td>First Name</td><td><input type="text" name="tLinecRev"></td>
			</tr>
			<tr>
				<td>Last Name</td><td><input type="text" name="tLinec2Rev"></td>
			</tr>
			
		</table>
		<input type="submit" value="Submit">
	</form>
<br>

List of revenue by transit line
<br>
	<form method="get" action="listRevTransResults.jsp">
		<select name="tLineRev" size=1>
			<option value='Green Corridor Line'>Green Corridor Line</option>
			<option value='Blue Corridor Line'>Blue Corridor Line</option>
			<option value='Red Corridor Line'>Red Corridor Line</option>
			<option value='Orange Corridor Line'>Orange Corridor Line</option>
			<option value='Purple Corridor Line'>Purple Corridor Line</option>
			<option value='Brown Corridor Line'>Brown Corridor Line</option>
			<option value='White Corridor Line'>White Corridor Line</option>
			<option value='Gold Corridor Line'>Gold Corridor Line</option>
			<option value='Black Corridor Line'>Black Corridor Line</option>
			<option value='Yellow Corridor Line'>Yellow Corridor Line</option>

		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Select a month for the monthly report
<br>
	<form method="get" action="monthlyReportResults.jsp">
		<select name="month" size=1>
			<option value='01'>January</option>
			<option value='02'>February</option>
			<option value='03'>March</option>
			<option value='04'>April</option>
			<option value='05'>May</option>
			<option value='06'>June</option>
			<option value='07'>July</option>
			<option value='08'>August</option>
			<option value='09'>September</option>
			<option value='10'>October</option>
			<option value='11'>November</option>
			<option value='12'>December</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Click to find best customer
<br>
	<form method="get" action="bestCusResults.jsp">
		&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Click to find top 5 active transit lines
<br>
	<form method="get" action="mostActive5LinesResults.jsp">
		&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>


Admin Delete
<br>
	<form method="get" action="aDel.jsp">
		<table>
			<tr>    
				<td>Customer Representative ID</td><td><input type="text" name="delID"></td>
			</tr>

			
		</table>
		<input type="submit" value="Submit">
	</form>
<br>

Admin Update
<br>
	<form method="get" action="aUpSup.jsp">
		&nbsp;<br> <input type="submit" value="Enter Update Menu">
	</form>
<br>
Admin Add
<br>
	<form method="get" action="aAddSup.jsp">
		&nbsp;<br> <input type="submit" value="Enter Add Menu">
	</form>
<br>

</body>
</html>