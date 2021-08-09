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
		<title>Questions</title>
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

				
				//Get the combobox from the index.jsp
				//Get the combobox from the index.jsp
				if (request.getParameter("input") != null) {

					Random rand = new Random();
					int n = rand.nextInt(1000) + 100;
				
					String question = request.getParameter("question");
					//System.out.print(question);
					//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
					
					//System.out.print(n);
					String insert = "INSERT INTO questions(questionID,question,answer)"
							+ " VALUES (?,?,?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setInt(1,n);
					ps.setString(2, question);
					ps.setString(3,"N/A");
					ps.executeUpdate();
					//Run the query against the database.
					//Get the combobox from the index.jsp

					
				//close the connection.
					con.close();
					response.sendRedirect("./customerQuestions.jsp");
				}
				else if (request.getParameter("search") != null) {
					String question = request.getParameter("name");
					//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
					String str = "SELECT * FROM questions WHERE question='" + question +"'";
					//Run the query against the database.
					ResultSet result = stmt.executeQuery(str);
					out.print("<div class='flex_column justify_content' >");
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
					con.close();
					
					out.print("</div>");
}
				else if(request.getParameter("reply")!=null){
					String question = request.getParameter("name");
					//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
					String str = "SELECT * FROM questions WHERE answer='N/A'";
					//Run the query against the database.
					ResultSet result = stmt.executeQuery(str);
					
					//parse out the results
					while (result.next()) {
						String string = "Update questions set WHERE answer='N/A'";
						
		
					}
					
					out.print("</table>");
					con.close();
					
					out.print("</div>");
					
				}
			//close the connection.
			out.print("<a href=\"customerQuestions.jsp\">Back Home</a>");
			} catch (Exception e) {
				out.print(e);
				//response.sendRedirect("./userLogin.jsp");
			}
		%>
		<section>
		</section>
		
		
	</body>
</html> 
