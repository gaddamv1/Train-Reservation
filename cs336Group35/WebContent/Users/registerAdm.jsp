<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../styles/styles.css">
		<meta charset="ISO-8859-1">
		<title>Register Admin</title>
	</head>
	<body class='main'>
		<section class='main_left'>
		</section>
		<section class='main_right'>
			<form method="post" action="./register3.jsp">
				<div class='flex_row'>
					<label class='section' for='ssn'>SSN</label>
					<input type="text" name='ssn' required class="input">
				</div>
				<div class='flex_row'>
					<label class='section' for='username'>Username</label>
					<input type="text" name='username' required class="input">
				</div>
				<div class='flex_row'>
					<label class='section' for='lastname'>Last Name</label>
					<input type="text" name='lastname' required class="input">
				</div>
				<div class='flex_row'>
					<label class='section' for='firstname'>First Name</label>
					<input type="text" name='firstname' required class="input">
				</div>
				<div class='flex_row'>
					<label class='section' for='password'>Password</label>
					<input type="password" name='password' required class="input">
				</div>
				<br>
				<div class="flex_column justify_content">
					<input type="button" onclick="location.href='/cs336Group35Video/index.jsp'" value="Log In">
					<input type="submit" value="Register">
				</div>
				
				
			</form>
		</section>
		
	</body>
</html> 