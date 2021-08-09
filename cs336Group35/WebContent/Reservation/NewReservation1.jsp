<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.text.ParseException,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE ">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert </title>
	</head>
	<body>
		<%
			try {
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = con.createStatement();
				
				
				String username = request.getParameter("username");
				int schid = Integer.valueOf(request.getParameter("schid"));
				int trainid = Integer.valueOf(request.getParameter("trainid"));
				String transitline=request.getParameter("transitline");
				int originid = Integer.valueOf(request.getParameter("Origin"));
				int destinationid = Integer.valueOf(request.getParameter("Destination"));
				String reservdate = request.getParameter("Date");
				String personType = request.getParameter("persontype");
				String journeytype=request.getParameter("journeytype");
				
				
				
				
				
				
				
				
				String farequery = "select fare/numberStops as farePerStop from station.trainSchedules where schID="+schid+" and transitLine='"+transitline+"';";
				
	             Statement st0 = con.createStatement();
	             
	             double fareperstop=0;
	             ResultSet rs0=st0.executeQuery(farequery);
	             while(rs0.next())
	             {
	            	 fareperstop=rs0.getDouble(1);
	            	 
	             }
	             //System.out.println(fareperstop);
	             String stopsquery="with recursive test as(select ts1.transitLine as transitline,ts1.schID as schid,ts1.stationID as stationid,ts1.trainID,(select st1.stationName from stations st1 where st1.stationID=ts1.stationID) as stationName,ts1.stopArrival as arrival,ts1.stopDeparture as departure from stopsOfTrainSchedule ts1 union select distinct ot.transitLine as transitline,ot.schID as schid,ot.stationID as stationid,ts.trainID,(select st.stationName from stations st where st.stationID=ot.stationID) as stationName,t.departure as arrival, t.departure from stopsOfTrainSchedule ts,originOfTrainSchedule ot inner join trainSchedules t on t.trainID=ot.trainID and t.schID=ot.schID where ot.trainID=ts.trainID and ot.schID=ts.schID order by schid, departure) select count(*) from test where schid="+schid+" and transitLine='"+transitline+"' and arrival > (select arrival from test where schid="+schid+" and stationid="+originid+") and arrival <=(select arrival from test where schid="+schid+" and stationid="+destinationid+");";
	            
	             Statement st1 = con.createStatement();
	             double numberofstops=0;
	             ResultSet rs1=st1.executeQuery(stopsquery);
	             while(rs1.next())
	             {
	            	 numberofstops=rs1.getDouble(1);
	             }
	             
	             double fare=(numberofstops * fareperstop);
	             
				if(personType.equalsIgnoreCase("Disabled"))
				{		
					
					fare= fare-(fare * 0.5);
					//System.out.println("Disabled fare="+fare);
				}
				else if(personType.equalsIgnoreCase("Child"))
				{
					fare=fare-(fare * 0.25);
					//System.out.println("Child fare="+fare);
				}
				else if(personType.equalsIgnoreCase("Senior"))
				{
					fare=fare-(fare * 0.35);
					//System.out.println("Senior fare="+fare);
				}
								
				if(journeytype.equalsIgnoreCase("round-trip"))
				{
					fare=fare*2;
					//System.out.println("round trip fare="+fare);
				}
				
				//String startDateStr = request.getParameter("date"); 
				
	
			String query = "Select  max(reservationNum)+1 from reservations";
					
            Statement st2 = con.createStatement();
            
            ResultSet rs2=st2.executeQuery(query);
            int reserv=0;
            while(rs2.next())
            {
           	 reserv=rs2.getInt(1);
            }
				
	
           // System.out.println("reserv====="+reserv); 
				
				
				//Make an insert statement for the Sells table:
				String insert = "INSERT INTO reservations(reservationNum,resDate,totalFare,transitLine,resType,username)"
						+ "VALUES (?,?,?,?,?,?)";
				
				PreparedStatement ps = con.prepareStatement(insert);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself

                Date date1=new SimpleDateFormat("MM/dd/yyyy").parse(reservdate);  
                java.sql.Date sqlDate = new java.sql.Date(date1.getTime());
				
				//System.out.println("reservdate=="+reservdate);
				//System.out.println("sqlDate="+sqlDate);
			
				ps.setInt(1, reserv);
				ps.setDate(2, sqlDate);
				ps.setDouble(3, fare);
				ps.setString(4, transitline);
				ps.setString(5, journeytype);
				ps.setString(6, username);
				ps.executeUpdate();
				
				
				String insert1 = "INSERT INTO makesReservation (reservationNum,username,schID,trainid,transitLine)"
						+ "VALUES (?,?,?,?,?)";
				
				
PreparedStatement ps1 = con.prepareStatement(insert1);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
               ps1.setInt(1, reserv);
				ps1.setString(2, username);
				ps1.setInt(3, schid);
				ps1.setInt(4, trainid);
				ps1.setString(5, transitline);
				ps1.executeUpdate();
		
				
				
				String insert2 = "INSERT INTO originOfReservation (reservationNum,stationID)"
						+ "VALUES (?,?)";
PreparedStatement ps2 = con.prepareStatement(insert2);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
                ps2.setInt(1, reserv);
				ps2.setInt(2,originid);
				ps2.executeUpdate();
				

				String insert3 = "INSERT INTO destinationOfReservation (reservationNum,stationID)"
						+ "VALUES (?,?)";
PreparedStatement ps3 = con.prepareStatement(insert3);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself

				ps3.setInt(1, reserv);
				ps3.setInt(2,destinationid);
				ps3.executeUpdate();
				
				
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				out.print("Insert table customers succeeded");
				response.sendRedirect("./Reservation.jsp");
				
			} catch (Exception ex) {
				out.print(ex);
		
			}
		%>
		</body>
</html>