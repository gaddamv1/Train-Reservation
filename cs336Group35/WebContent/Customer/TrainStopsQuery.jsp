<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>By Train</title>
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
			
			String entity = request.getParameter("train");
			
			String str = "SELECT distinct s.trainID, s.transitLine, s.stationID, sta.city, sta.stationName, t.fare/t.numberStops as farePerStop " + 
			"FROM stopsOfTrainSchedule s, trainSchedules t, stations sta " + 
			"WHERE s.trainID = t.trainID " + 
			"and s.transitLine = t.transitLine " + 
			"and s.stationID = sta.stationID " + 
			"and s.trainID = " + entity;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<style>");
			out.print("table, th, td {border: 1px solid black; border-collapse: collapse;}");
			out.print("tr:nth-child(even) {background-color: #dddddd;}");
			out.print("</style>");
			out.print("<table style='width:100%'>");
			out.print("<caption>Train " + entity + " Stops</caption>");
			//make a row
			out.print("<tr>");
	
			//make a column
			out.print("<td>");
			out.print("trainID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("transitLine");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("stationID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("city");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("stationName");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("farePerStop");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current trainID name:
				out.print(result.getString("trainID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current transitLine name:
				out.print(result.getString("transitLine"));
				out.print("</td>");
				out.print("<td>");
				//Print out current stationID name:
				out.print(result.getString("stationID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current city name:
				out.print(result.getString("city"));
				out.print("</td>");
				out.print("<td>");
				//Print out current stationName name:
				out.print(result.getString("stationName"));
				out.print("</td>");
				out.print("<td>");
				//Print out current farePerStop name:
				out.print(result.getString("farePerStop"));
				out.print("</td>");
				out.print("<td>");
				
				out.print("</tr>");

			}
			out.print("</table>");

			out.print("<a href=\"TrainSchedules.jsp\">Back</a>");
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
</body>
</html>