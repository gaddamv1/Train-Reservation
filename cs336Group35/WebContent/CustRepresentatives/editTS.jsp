<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit Train Schedule</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM trainSchedules";
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
			out.print("scheduleID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("trainID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("transitLine");
			out.print("</td>");
			
			out.print("<td>");
			out.print("departure");
			out.print("</td>");
			
			out.print("<td>");
			out.print("arrivalTime");
			out.print("</td>");
			
			out.print("<td>");
			out.print("travelTime");
			out.print("</td>");
			
			out.print("<td>");
			out.print("fare");
			out.print("</td>");
			out.print("<td>");
			out.print("numberStops");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("schID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("trainID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("transitLine"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("departure"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("arrival"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("travelTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out current price
				out.print(result.getString("numberStops"));
				out.print("</td>");
				
				
				
				
				out.print("</tr>");

			}
			out.print("</table>");
			
			out.print("<br>");
			
			
			
			
			if (entity.equals("edit")) {
				
				out.print("<form action=\"editTSresult.jsp\"");
				out.print("<br>");
				out.print("Schedule ID To Edit: <input type = \"text\" id=\"scheduleID\" name=\"scheduleID\" ><br>");
				out.print("Column Name to Edit: <input type = \"text\" id=\"columnName\" name=\"columnName\" ><br>");
				out.print("New Value: <input type = \"text\" id=\"newValue\" name=\"newValue\" ><br>");
				out.print("<input type=\"submit\" value=\"Submit\"></form>");
				
				
				
				//out.print("<input type=\"submit\" onClick=\"refreshPage()\" value=\"Update!\">");
				
			} else if(entity.equals("delete")) {
				
				out.print("<form action=\"deleteResult.jsp\"");
				out.print("<br>");
				out.print("Row to Delete By ScheduleID: <input type = \"text\" id=\"scheduleID\" name=\"scheduleID\" ><br>");
				out.print("<input type=\"submit\" value=\"Submit\"></form>");
				
				
				//out.print("<input type=\"submit\" onClick=\"refreshPage()\" value=\"Delete!\">");
			}
			
			
			
			
			
			//close the connection.
			db.closeConnection(con);
			out.print("<br>");
			out.print("<a href=\"custRepHome.jsp\">Back Home</a>");


			
		} catch (Exception e) {
			out.print(e);
		}%>


	</body>
</html>