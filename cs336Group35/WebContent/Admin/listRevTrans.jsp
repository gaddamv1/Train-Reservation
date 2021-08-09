<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Rev by Trans</title>
</head>
<body>


Pick a Transit Line
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









</body>
</html>