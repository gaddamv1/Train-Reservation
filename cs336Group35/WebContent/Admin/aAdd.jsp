<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Update</title>
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
			String assn = request.getParameter("aSSN");
			String af = request.getParameter("af");
			String al = request.getParameter("al");
			String au = request.getParameter("au");
			String ap = request.getParameter("ap");
			
			//String curtable = "select c.ssn from employees c;";
			//ResultSet cur = stmt.executeQuery(curtable);
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			
			String str = "INSERT INTO employees (ssn, firstname, lastname, username, passwor) VALUES (\"" + assn + "\", \"" + af + "\", \"" + al + "\", \"" + au + "\", \"" + ap + "\");";
			String str2 = "INSERT INTO customerRepresentatives (ssn) VALUES (\"" + assn + "\");";
			//Run the query against the database.
			//SELECT * FROM station.customerRepresentatives;
			//ResultSet result1 = stmt.executeQuery(po);
			//ResultSet result2 = stmt.executeQuery(str);
			//ResultSet result3 = stmt.executeQuery(str2);
			//ResultSet result = stmt.executeQuery(pn);
			stmt.executeUpdate(str);
			stmt.executeUpdate(str2);
			//String count = "Select count(*) as \"num\" from employees e where c.ssn = e.ssn;";
			//ResultSet c = stmt.executeQuery(count);
			
			
			String pn = "Select e.ssn, e.firstname, e.lastname, e.username, e.passwor from employees e, customerRepresentatives c where c.ssn = e.ssn;";
			ResultSet result = stmt.executeQuery(pn);
			//while(result.next())
			//{
				
			//}
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("ssn");
			out.print("</td>");
			out.print("<td>");
			//print out column header
			out.print("firstname");
			out.print("</td>");
			out.print("<td>");
			//print out column header
			out.print("lastname");
			out.print("</td>");
			out.print("<td>");
			//print out column header
			out.print("username");
			out.print("</td>");
			out.print("<td>");
			//print out column header
			out.print("password");
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
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("firstname"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("lastname"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("passwor"));
				out.print("</td>");
				
				
				out.print("</tr>");

			}
			out.print("</table>");
				
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("An error occured. This could be because an existing ssn was entered.");
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