<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="./styles/styles.css">
		<meta charset="ISO-8859-1">
		<title>Login Screen</title>
	</head>
	<body class="main">
		<section class="main_left">
		</section>
		<section class="main_right">
			<form method="post" action="./Users/userScreen.jsp">
				<div class="flex_row">
					<label class="section" for="username">Username</label>
					<input type="text" name="username" required class="input">
				</div>
				<div class="flex_row">
					<label class="section" for="password">Password</label>
					<input type="password" name="password" required class="input">
				</div>
				<div class="flex_row">
					<label class="section" for="type">Type</label>
					<select name="type" required class="input">
						<option value='cust'>Customer</option>
						<option value='custrep'>Customer Representative</option>
						<option value='admin'>Admin</option>
					</select>
				</div>
				<br>
				<div class="flex_column justify_content">
					<input type="submit" value="Log in">
					<input type="button" onclick="location.href='/cs336Group35Video/Users/registerCus.jsp'" value="Register Customer">
					<input type="button" onclick="location.href='/cs336Group35Video/Users/registerCustRep.jsp'" value="Register Customer Representative">
					<input type="button" onclick="location.href='/cs336Group35Video/Users/registerAdm.jsp'" value="Register Admin">
				</div>
			</form>
		</section>
		
	</body>
</html> 