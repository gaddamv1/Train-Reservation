<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Rev by Cust</title>
</head>
<body>


Pick a Transit Line
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










</body>
</html>