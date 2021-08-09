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
		<title>User Screen</title>
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
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String type = request.getParameter("type");
				String get;
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				if (type.equals("cust")){
					get = "SELECT * FROM customers WHERE username=? AND passwor = ?";
				}
				else if(type.equals("custrep")) {
					get = "SELECT * FROM employees e, customerRepresentatives c WHERE e.ssn = c.ssn AND username=? AND passwor = ?";
				}
				else {
					get = "SELECT * FROM employees e, admins a WHERE e.ssn = a.ssn AND username=? AND passwor = ?";
				}
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(get);
					
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, username);
				ps.setString(2,password);
				//Run the query against the database.
				
				ResultSet result = ps.executeQuery();
				
				//make nav bar
				if (result.next()){
					
					session.setAttribute("name",result.getString("firstname")+result.getString("lastname"));
					if (type.equals("cust")) {
						session.setAttribute("username",result.getString("username"));
						response.sendRedirect("../Customer/TrainSchedules.jsp");
					}else if (type.equals("custrep")){
						session.setAttribute("ssn",result.getString("ssn"));
						response.sendRedirect("../CustRepresentatives/custRepHome.jsp");
					}
					else {
						session.setAttribute("ssn",result.getString("ssn"));
						response.sendRedirect("../Admin/adminIndex.jsp");
					}
				}
				
				out.print("<h1>User does not exist!</h1>");
				con.close();

			} catch (Exception e) {
				out.print(e);
				out.print("<h2>Input password and username again</h2>");
				
				response.sendRedirect("./userLogin.jsp");
			}
		%>
		<section>
		</section>
		
		
	</body>
</html> 