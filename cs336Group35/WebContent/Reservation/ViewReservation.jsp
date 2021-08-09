
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="./styles/styles.css">
		<meta charset="ISO-8859-1">
		<title>View</title>
	</head>
<body>
	
  <%
  
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection
        		("jdbc:mysql://database-1.c7f4bxaozzfl.us-east-1.rds.amazonaws.com:3306/station","admin","Duykhanh1234");
        Statement st=con.createStatement();
        Statement st1=con.createStatement();
        String name=(String)session.getAttribute("username");
        System.out.println(name);
        Date date=new Date();
        ResultSet rs=st.executeQuery("select rs.reservationNum , rs.resdate, rs.totalFare, rs.resType,mr.username, ofr.stationID, (select stationName from stations where stationID=ofr.stationID) as origin,dfr.stationID , (select stationName from stations where stationID=dfr.stationID) as destination from reservations rs inner join makesReservation mr on mr.reservationNum=rs.reservationNum inner join originOfReservation ofr on ofr.reservationNum=mr.reservationNum inner join destinationOfReservation dfr on dfr.reservationNum=mr.reservationNum where mr.username='"+name+"' and date(now())>rs.resDate");
        ResultSet rs1=st1.executeQuery("select rs.reservationNum , rs.resdate, rs.totalFare, rs.resType,mr.username, ofr.stationID, (select stationName from stations where stationID=ofr.stationID) as origin,dfr.stationID , (select stationName from stations where stationID=dfr.stationID) as destination from reservations rs inner join makesReservation mr on mr.reservationNum=rs.reservationNum inner join originOfReservation ofr on ofr.reservationNum=mr.reservationNum inner join destinationOfReservation dfr on dfr.reservationNum=mr.reservationNum where mr.username='"+name+"' and date(now())<rs.resDate");
    %><table border=1 align=center style="text-align:center">
      <thead>Future Reservations
          <tr>
             
             <th>RESERVATION NUMBER</th>
             <th>DATE</th>
             <th>TOTALFARE</th>
             <th>TYPE</th>
             <th>USERNAME</th>
             <th>ORIGIN STATION ID</th>
             <th>ORIGIN</th>
             <th>DESTINATION STATION ID</th>
             <th>DESTINATION</th>

          </tr>
      </thead>
      <tbody>
        <%while(rs1.next())
        {
            %>
            <tr>
                <td><%=rs1.getInt("reservationNum") %></td>
                <td><%=rs1.getString("resDate") %></td>
                <td><%=rs1.getDouble("totalFare") %></td>
                <td><%=rs1.getString("resType") %></td>
                <td><%=rs1.getString("username") %></td>
                <td><%=rs1.getInt("ofr.stationID") %></td>
                <td><%=rs1.getString("origin") %></td>
                <td><%=rs1.getInt("dfr.stationID") %></td>
                <td><%=rs1.getString("destination") %></td>      
            </tr>
            <%}%>
           </tbody>
        </table><br>
        
            <table border=1 align=center style="text-align:center">
      <thead>Past Reservations
          <tr>
             
             <th>RESERVATION NUMBER</th>
             <th>DATE</th>
             <th>TOTALFARE</th>
             <th>TYPE</th>
             <th>USERNAME</th>
             <th>ORIGIN STATION ID</th>
             <th>ORIGIN</th>
             <th>DESTINATION STATION ID</th>
             <th>DESTINATION</th>

          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getInt("reservationNum") %></td>
                <td><%=rs.getString("resDate") %></td>
                <td><%=rs.getDouble("totalFare") %></td>
                <td><%=rs.getString("resType") %></td>
                <td><%=rs.getString("username") %></td>
                <td><%=rs.getInt("ofr.stationID") %></td>
                <td><%=rs.getString("origin") %></td>
                <td><%=rs.getInt("dfr.stationID") %></td>
                <td><%=rs.getString("destination") %></td>      
            </tr>
            <%}%>
           </tbody>
        </table><br>
        
        <br>
        <section class='main_left'>
        <form method="post" action="Reservation.jsp">
        <input type="submit" value="back">
        </form>
				</section>
        
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
    
    
           
</body>
</html> 