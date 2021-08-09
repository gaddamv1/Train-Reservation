<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit Question</title>
	</head>
	<body>
		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//String entity = request.getParameter("command");
			int questionid = Integer.parseInt(request.getParameter("questionid"));
			String answer = request.getParameter("answer");
			try{
				String update = "UPDATE questions SET answer = \"" + answer + "\" WHERE questionID = " + questionid;
				stmt.executeUpdate(update);
			}catch (Exception e) {
					out.print(e);
			};
			

			//stmt.executeQuery(update);
			
		
			
			
			
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM questions";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			out.print("Result");
			out.print("<br>");
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
			out.print("Question");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Answer");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("answer"));
				out.print("</td>");
				out.print("<td>");
				out.print("</tr>");

			}
			out.print("</table>");
			out.print("<br>");
			//close the connection.
			db.closeConnection(con);
			out.print("<br>");
			out.print("<a href=\"custRepHome.jsp\">Back Home</a>");


			
		} catch (Exception e) {
			out.print(e);
		}%>


	</body>
</html>