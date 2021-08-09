<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->

<a href='../Customer/TrainSchedules.jsp'>Home</a>
<br><br>
<form method="post" action="redirectpage.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="redirect" value="reservation"/>Book a reservation.
    <input type="radio" name="redirect" value="view"/>View Reservations.
    <input type="radio" name="redirect" value="delete"/>Delete a reservation.
    <br><br>
  <input type="submit" value="submit" />
  </form>
  
</body>

</html>