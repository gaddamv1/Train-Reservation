<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../styles/styles.css">
		<meta charset="ISO-8859-1">
		<title>Customer Questions</title>
	</head>
	<body class="main">
		<%
			List<String> list = new ArrayList<String>();

			try {

				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				//Create a SQL statement
				Statement stmt = con.createStatement();
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				String str = "SELECT * FROM questions";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Get the combobox from the index.jsp
				
				out.print("<div class='flex_column justify_content' >");
					out.print("<div class='flex_column'>");
						
					out.print("<form method='POST' action='functionQuestion.jsp' class='flex_column'>");
					out.print("<div class='flex_row'");
							out.print("<label class='section' for='question'>Input the questions</label>");
							out.print("<input type='text' class='input' name='question'");
						out.print("</div>");
						out.print("<input type='submit' name='input' value='Submit Question'");
						out.print("</form>");
					out.print("</div>");
					out.print("<div class='flex_column'>");
					
						out.print("<form method='POST' action='functionQuestion.jsp' class='flex_column'>");
						out.print("<div class='flex_row'");
							out.print("<label class='section' for='name'>Search question    </label>");
							out.print("<input type='text' class='input' name='name'");
						out.print("</div>");
						out.print("<input type='submit' name='search' value='Search Question'");
						out.print("</form>");
					out.print("</div>");
					out.print("<table>");
	
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
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
						//Print out current beer name:
						out.print(result.getString("question"));
						out.print("</td>");
						out.print("<td>");
						//Print out current price
						out.print(result.getString("answer"));
						out.print("</td>");
						out.print("</tr>");
		
					}
					out.print("</table>");
					
				out.print("</div>");
			//close the connection.
				con.close();

				
			} catch (Exception e) {
				out.print(e);
				//response.sendRedirect("./userLogin.jsp");
			}
		%>
		<section>
		</section>
		
		
	</body>
</html> 