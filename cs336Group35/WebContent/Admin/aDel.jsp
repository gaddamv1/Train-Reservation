<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin delete</title>
</head>
<body>

	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String entity = request.getParameter("delID");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String po = "SELECT * FROM station.customerRepresentatives;";
			String str = "DELETE FROM customerRepresentatives WHERE ssn = "+ entity +";";
			String str2 = "DELETE FROM employees WHERE ssn = "+ entity +";";
			
			//Run the query against the database.
			//SELECT * FROM station.customerRepresentatives;
			//ResultSet result1 = stmt.executeQuery(po);
			//ResultSet result2 = stmt.executeQuery(str);
			//ResultSet result3 = stmt.executeQuery(str2);
			//ResultSet result = stmt.executeQuery(pn);
			stmt.executeUpdate(str);
			stmt.executeUpdate(str2);
			
			String pn = "SELECT * FROM station.customerRepresentatives;";
			ResultSet result = stmt.executeQuery(pn);
			
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Customer Representatives' SSN After");
			out.print("</td>");
			
			
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("ssn"));
				out.print("</td>");
				
				
				out.print("</tr>");

			}
			out.print("</table>");
				
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	//back to admin page button
	%>
	<br>
	<br>
	<br>
	<br>
	Back to admin functions page

	<form method="get" action="adminIndex.jsp">
		&nbsp;<br> <input type="submit" value="Back">
	</form>
<br>

</body>
</html>