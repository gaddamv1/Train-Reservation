<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer List</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("tline");
			String entity2 = request.getParameter("date");
			
			//Date parsed = format.parse(date);

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//String str = "SELECT * FROM customers WHERE accounttype = \"cust\"";
			
			String str = "SELECT c.username, c.firstname, c.lastname, r.reservationNum, r.transitLine, r.resdate FROM customers c, makesReservation m, reservations r, trainSchedules t WHERE c.username = m.username AND m.reservationNum = r.reservationNum AND m.schID = t.schID AND r.resdate = \"" + entity2 +"\" AND r.transitLine = \"" + entity + "\"";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			

			//System.out.println(entity);
			//System.out.println(entity2);
			
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
			out.print("UserName");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("FirstName");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("LastName");
			out.print("</td>");
			
			out.print("<td>");
			out.print("ReservationNum");
			out.print("</td>");
			
			out.print("<td>");
			out.print("TrainsitLine");
			out.print("</td>");
			
			out.print("<td>");
			out.print("ResDate");
			out.print("</td>");
			
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("firstname"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("lastname"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("reservationNum"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("transitLine"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("resdate"));
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table>");
			
			//close the connection.
			db.closeConnection(con);
			
			out.print("<br>");
			out.print("<a href=\"custRepHome.jsp\">Back</a>");

			
		} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>