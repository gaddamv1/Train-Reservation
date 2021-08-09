<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="./styles/styles.css">
		<meta charset="ISO-8859-1">
		<title>Book a reservation</title>
	</head>
<body>
	
  <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection
        		("jdbc:mysql://database-1.c7f4bxaozzfl.us-east-1.rds.amazonaws.com:3306/station","admin","Duykhanh1234");
        Statement st=con.createStatement();
        //ResultSet rs=st.executeQuery("select  ts.transitLine, ts.trainID, (select stationName from stations where stationID=ot.stationID) as origin,(select stationName from stations where stationID= dt.stationID) as destination,st.stationName as station,ts.stationID, ts.stopArrival, ts.stopDeparture from stopsOfTrainSchedule ts inner join stations st on st.stationID= ts.stationID inner join originOfTrainSchedule ot on ts.trainID=ot.trainID and ts.transitLine=ot.transitLine inner join destinationOfTrainSchedule dt on ts.trainID=dt.trainID and ts.transitLine=dt.transitLine order by ts.transitLine,ts.stopArrival , ts.trainID ;");
        ResultSet rs1=st.executeQuery("select  ts1.transitLine as transitline,(select st1.stationName from stations st1 where st1.stationID=ts1.stationID) as stationName,(select  st1.stationName from stations st1 inner join originOfTrainSchedule ot1 on st1.stationID=ot1.stationID where ot1.schID=ts1.schID) as origin,(select  st1.stationName from stations st1 inner join destinationOfTrainSchedule dt1 on st1.stationID=dt1.stationID where dt1.schID=ts1.schID) as destination,(select c.travelTime from trainSchedules c where c.schID=ts1.schID and c.trainID=ts1.trainID and c.transitLine=ts1.transitLine) as TravelTime from stopsOfTrainSchedule ts1 union select  distinct ot.transitLine as transitline,(select st.stationName from stations st where st.stationID=ot.stationID) as stationName,(select  st.stationName from stations st inner join originOfTrainSchedule ot on st.stationID=ot.stationID where ot.schID=ts.schID) as origin,(select  st.stationName from stations st inner join destinationOfTrainSchedule dt on st.stationID=dt.stationID where dt.schID=ts.schID) as destination,(select n.travelTime from trainSchedules n where n.schID=ts.schID and n.trainID=ts.trainID and n.transitLine=ts.transitLine) as TravelTime from stopsOfTrainSchedule ts, originOfTrainSchedule ot inner join trainSchedules t on t.trainID=ot.trainID and t.schID=ot.schID where ot.trainID=ts.trainID and ot.schID=ts.schID;");
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>TRANSIT LINE</th>
             <th>STATION NAME</th>
             <th>ORIGIN</th>
             <th>DESTINATION</th>
             <th>TOTAL TRAVEL TIME</th>

          </tr>
      </thead>
      <tbody>
        <%while(rs1.next())
        {
            %>
            <tr>
                <td><%=rs1.getString("transitline") %></td>
                <td><%=rs1.getString("stationName") %></td>
                <td><%=rs1.getString("origin") %></td>
                <td><%=rs1.getString("destination") %></td>
                <td><%=rs1.getString("TravelTime") %></td>       
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
    
    
             <br>
             <br>
            <section class='main_left'>
			<form method="post" action="NewReservation.jsp">
				<div class='flex_row'>
					<label class='section' for='transitline'>Transit Line</label>
					<input type="text" name='transitline' required />
				</div>
				<input type="submit" value="Reserve">
			</form>
				</section>
				
				 <br>
        <section class='main_left'>
        <form method="post" action="Reservation.jsp">
        <input type="submit" value="back">
        </form>
				</section>
	    
</body>
</html> 