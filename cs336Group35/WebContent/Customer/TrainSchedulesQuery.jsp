<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order By</title>
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
			
			String entity = request.getParameter("sort_by");
			
			//String str = "SELECT * FROM trainSchedules ORDER BY  " + entity;
			String str = "select t.*, o.stationID as originID, s.stationName as originName, d.stationID as destinationID, st.stationName as destinationName " + 
			"from trainSchedules t, originOfTrainSchedule o, destinationOfTrainSchedule d, stations s, stations st " + 
			"where o.schID = t.schID " + 
			"and d.schID = t.schID " +
			"and o.stationID = s.stationID " +
			"and d.stationID = st.stationID " +
			"order by " + entity;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
	
			//Make an HTML table to show the results in:
			out.print("<style>");
			out.print("table, th, td {border: 1px solid black; border-collapse: collapse;}");
			out.print("tr:nth-child(even) {background-color: #dddddd;}");
			out.print("</style>");
			out.print("<table style='width:100%'>");
			out.print("<caption>Sort by " + entity + "</caption>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("schID");
			out.print("</td>");
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
			out.print("departure");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("arrival");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("travelTime");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("fare");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("numberStops");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("originID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("originName");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("destinationID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("destinationName");
			out.print("</td>");
			
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current schID name:
				out.print(result.getString("schID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current trainID name:
				out.print(result.getString("trainID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current transitLine name:
				out.print(result.getString("transitLine"));
				out.print("</td>");
				out.print("<td>");
				//Print out current departure name:
				out.print(result.getString("departure"));
				out.print("</td>");
				out.print("<td>");
				//Print out current arrival name:
				out.print(result.getString("arrival"));
				out.print("</td>");
				out.print("<td>");
				//Print out current travelTime name:
				out.print(result.getString("travelTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out current fare name:
				out.print(result.getString("fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out current numberStops name:
				out.print(result.getString("numberStops"));
				out.print("</td>");
				out.print("<td>");
				//Print out current originID name:
				out.print(result.getString("originID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current originName name:
				out.print(result.getString("originName"));
				out.print("</td>");
				out.print("<td>");
				//Print out current destinationID name:
				out.print(result.getString("destinationID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current destinationName name:
				out.print(result.getString("destinationName"));
				out.print("</td>");
				
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