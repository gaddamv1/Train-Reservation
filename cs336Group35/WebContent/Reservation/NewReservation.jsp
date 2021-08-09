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
				Class.forName("com.mysql.jdbc.Driver");
		        Connection con1=(Connection)DriverManager.getConnection
		        		("jdbc:mysql://database-1.c7f4bxaozzfl.us-east-1.rds.amazonaws.com:3306/station","admin","Duykhanh1234");
		        Statement st=con1.createStatement();
		        String transitline=request.getParameter("transitline");
		        ResultSet rs1=st.executeQuery("select * from(select  ts1.transitLine as transitline,ts1.schID as schid,ts1.stationID as stationid,ts1.trainID,(select st1.stationName from stations st1 where st1.stationID=ts1.stationID) as stationName,ts1.stopArrival as arrival,ts1.stopDeparture as departure,(select  st1.stationName from stations st1 inner join originOfTrainSchedule ot1 on st1.stationID=ot1.stationID where ot1.schID=ts1.schID) as origin,(select  st1.stationName from stations st1 inner join destinationOfTrainSchedule dt1 on st1.stationID=dt1.stationID where dt1.schID=ts1.schID) as destination from stopsOfTrainSchedule ts1 union select  distinct ot.transitLine as transitline,ot.schID as schid,ot.stationID as stationid,ts.trainID,(select st.stationName from stations st where st.stationID=ot.stationID) as stationName,t.departure as arrival, t.departure,(select  st.stationName from stations st inner join originOfTrainSchedule ot on st.stationID=ot.stationID where ot.schID=ts.schID) as origin,(select  st.stationName from stations st inner join destinationOfTrainSchedule dt on st.stationID=dt.stationID where dt.schID=ts.schID) as destination from stopsOfTrainSchedule ts, originOfTrainSchedule ot inner join trainSchedules t on t.trainID=ot.trainID and t.schID=ot.schID where ot.trainID=ts.trainID and ot.schID=ts.schID order by  schid, departure) as s1 where transitline='"+transitline+"';");
				//Get parameters from the HTML form at the index.jsp
				/*String username = request.getParameter("username");
				int schid = request.getParameter("schid");
				int originid = Integer.valueOf(request.getParameter("Origin"));
				int destinationid = Integer.valueOf(request.getParameter("Destination"));
				String reservdate = request.getParameter("Date");
				String personType = request.getParameter("persontype");
				String journeytype=request.getParameter("journeytype");*/
		        %><table border=1 align=center style="text-align:center">
		        <thead>
		            <tr>
		               <th>TRANSIT LINE</th>
		               <th>SCHID</th>
		               <th>TRAINID</th>
		               <th>STATIONID</th>
		               <th>STATION NAME</th>
		               <th>ARRIVAL</th>
		               <th>DEPARTURE</th>
		               <th>ORIGIN</th>
		               <th>DESTINATION</th>
		            </tr>
		        </thead>
		        <tbody>
		          <%while(rs1.next())
		          {
		              %>
		              <tr>
		                  <td><%=rs1.getString("transitline") %></td>
		                  <td><%=rs1.getInt("schid") %></td>
		                  <td><%=rs1.getInt("trainID") %></td>
		                  <td><%=rs1.getInt("stationid") %></td>
		                  <td><%=rs1.getString("stationName") %></td>
		                  <td><%=rs1.getString("arrival") %></td>
		                  <td><%=rs1.getString("departure") %></td>
		                  <td><%=rs1.getString("origin") %></td>
		                  <td><%=rs1.getString("destination") %></td>  
     
		              </tr>
		              <%}%>
		             </tbody>
		          </table><br>
		      <%}
		catch(Exception e){
	        out.print(e.getMessage());%><br><%
	    }
	    %>
	    
	    <section class='main_left'>
			<form method="post" action="NewReservation1.jsp">
              				<div class='flex_row'>
					<label class='section' for='username'>Username</label>
					<input type="text" name='username' required />
				</div>
				<div class='flex_row'>
					<label class='section' for='transitline'>Transit Line</label>
					<input type="text" name='transitline' required />
				</div>
				<div class='flex_row'>
					<label class='section' for='schid'>schID</label>
					<input type="number" name='schid' required  placeholder='number'/>
				</div>
				<div class='flex_row'>
					<label class='section' for='trainid'>TrainID</label>
					<input type="number" name='trainid' required  placeholder='number'/>
				</div>
				<div class='flex_row'>
					<label class='section' for='Origin'>Origin Station ID</label>
					<input type="number" name='Origin' required placeholder='number' />
				</div>
				<div class='flex_row'>
					<label class='section' for='Destination'>Destination Station ID</label>
					<input type="number" name='Destination' required  placeholder='number'/>
				</div>
				<div class='flex_row'>
					<label class='section' for='date'>Date</label>
					<input type="text" name='Date' required  placeholder='mm/dd/yyyy' ">
				</div>
				<div class='flex_row'>
					<label class='section' for='journeytype'>Journey Type</label>
					<input type="text" name='journeytype' required/>
				</div>
				<div class='flex_row'>
					<label class='section' for='Person'>Person Type</label> &nbsp
					<input type="radio" name="persontype" value="Disabled"/>Disabled
                    <input type="radio" name="persontype" value="Child"/>Child
                    <input type="radio" name="persontype" value="Senior"/>Senior
                    <input type="radio" name="persontype" value="General"/>General
				</div>
								
				<input type="submit" value="Reserve">
			</form>
				</section>
	     <br>
        <section class='main_left'>
        <form method="post" action="PriorReservation.jsp">
        <input type="submit" value="back">
        </form>
				</section>
	    
	   
	    
	    
	</body>
</html>