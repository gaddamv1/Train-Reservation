<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 

String payment_ind = request.getParameter("redirect");

if(payment_ind.equals("reservation")  )
{
   response.sendRedirect("../Reservation/PriorReservation.jsp"); 
}

else if(payment_ind.equals("view")  )
{
   response.sendRedirect("../Reservation/ViewReservation.jsp"); 
}

else if(payment_ind.equals("delete")  )
{
   response.sendRedirect("../Reservation/DeleteReservation.jsp"); 
}


%>


</body>
</html>