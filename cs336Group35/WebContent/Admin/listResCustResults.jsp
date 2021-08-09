<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Res by Cust Results</title>
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
			String entity = request.getParameter("tLinec");
			String entity2 = request.getParameter("tLinec2");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT r.reservationNum, r.resDate FROM reservations r, customers c WHERE r.username = c.username and c.firstname = '"+ entity +"' and c.lastname = '"+ entity2 +"';";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<style>");
			out.print("table, th, td {border: 1px solid black; border-collapse: collapse;}");
			out.print("tr:nth-child(even) {background-color: #dddddd;}");
			out.print("</style>");
			out.print("<table style='width:100%'>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Reservation Number");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Reservation Date");
			out.print("</td>");
			
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("reservationNum"));
				out.print("</td>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("resDate"));
				out.print("</td>");
				out.print("<td>");
				
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