<HTML>
<HEAD>
<TITLE> HW6 </TITLE>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</HEAD>
  <body>
    <h1> Registered Room List </h1>
        <table border="1">
          <tr>
            <td>room name</td>
            <td>location</td>
            <td>capacity</td>
            <td>airconditioner</td>
            <td>board</td>
          </tr>
          <tbody>
          </tbody>  
        </table> 
    
    <h3>Put the conditions you want.</h3>
    <table border="1">
        <tr>
          <td>room name</td>
          <td>location</td>
          <td>capacity</td>
          <td>airconditioner</td>
          <td>board</td>
        </tr>
        <tbody>
        </tbody>  
      </table> 
    <form action="reservation.jsp">
      <p>Condition 1 : <input type="text" name="search_people" placeholder="how many people use it?"></p>
      <p>Condition 2 : <input type="text" name="search_board" placeholder="Do you need a whiteboard?(O/X)"></p>
      <p><input type="submit" value="find a room"></p>
    </form>

    <h1> make a new reservation </h1>
    <form action="insert_reservation.jsp" method="post">
      <p><input type="text" name="location" placeholder="location"></p>
      <p><input type="text" name="room" placeholder="room name"></p>
      <p><input type="text" name="user_name" placeholder="user name"></p>
      <p><input type="date" name="start date" placeholder="start_date"></p>
      <p><input type="date" name="end date" placeholder="end_date"></p>
      <p><input type="text" name="purpose" placeholder="purpose"></p>
      <p><input type="text" name="people" placeholder="number of the people"></p>

      <p><input type="submit" value="make a reservation!"></p>
    </form>


  </body>
</html>