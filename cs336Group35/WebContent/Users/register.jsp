<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE ">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type='text/javascript'>function alertFunction(){ alert('Submitted Form Successfully')}</script>
		<title>Insert </title>
	</head>
	<body>
		<%
			try {
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = con.createStatement();
		
				//Get parameters from the HTML form at the index.jsp
				String username = request.getParameter("username");
				String lastname = request.getParameter("lastname");
				String firstname = request.getParameter("firstname");
				int age = Integer.valueOf(request.getParameter("age"));
				String email = request.getParameter("email");
				String password = request.getParameter("password");
		
				//Make an insert statement for the Sells table:
				String insert = "INSERT INTO customers(username,firstname,lastname,age,email,passwor)"
						+ " VALUES (?,?,?,?,?,?)";
				
				
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);
		
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, username);
				ps.setString(2, firstname);
				ps.setString(3, lastname);
				ps.setInt(4, age);
				ps.setString(5, email);
				ps.setString(6, password);
				ps.executeUpdate();
		
				
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				out.print("<scipt>alert('Successfully Register')</script>");
				response.sendRedirect("../index.jsp");
				
				
			} catch (Exception ex) {
				out.print(ex);
				out.print("Insert table customers failed");
			}
		%>
	</body>
</html>