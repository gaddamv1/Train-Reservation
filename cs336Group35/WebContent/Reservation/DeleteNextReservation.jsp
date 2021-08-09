<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.Date,java.text.ParseException,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE ">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Delete </title>
	</head>
	<body>
		<%
			try {
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = con.createStatement();
				
				//Get parameters from the HTML form at the index.jsp
				int reservationnumber = Integer.valueOf(request.getParameter("reservationnumber"));		 
				
				//Make an insert statement for the Sells table:
				String delete1 = "delete from originOfReservation  where reservationNum="+reservationnumber+";";
						
	             Statement st1 = con.createStatement();
	             
	               st1.executeUpdate(delete1);
				
		
					String delete2 = "delete from destinationOfReservation  where reservationNum="+reservationnumber+";";
							
		             Statement st2 = con.createStatement();
		             
		             st2.executeUpdate(delete2);
		             
		             
						String delete3 = "delete from makesReservation  where reservationNum="+reservationnumber+";";
						
			             Statement st3 = con.createStatement();
			             
			            st3.executeUpdate(delete3);
			             
			             
							String delete4 = "delete from reservations  where reservationNum="+reservationnumber+";";
							
				             Statement st4 = con.createStatement();
				             
				             st4.executeUpdate(delete4);
		             
				
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				out.print("Insert table customers succeeded");
				response.sendRedirect("../Reservation/Reservation.jsp");
				
			} catch (Exception ex) {
				out.print(ex);
		
			}
		%>
	</body>
</html>