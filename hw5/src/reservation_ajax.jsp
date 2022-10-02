<%@ page language="java" import="java.util.*, java.sql.*" session="true" contentType="text/html;charset=EUC_KR" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.*"%>
<%@ page import="java.util.ArrayList"%>

<%
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String jdbcUrl = "jdbc:mysql://localhost:3306/hw6?characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "Fcnfyf2000";
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch(ClassNotFoundException e) {
        out.println(e.toString());
    }

    try {
        con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
    } catch(SQLException e) {
        out.println(e.toString());
    }
%>

<HTML>
<HEAD>
<TITLE> HW6 </TITLE>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  function onFindClick(){
      const peopleNum = parseInt($('#search_people').val());
      const board = $('#search_people').val();
      if (board.length>0 && peopleNum>0){
        $.ajax({
          url: "/search.jsp",
          type: 'GET',
          data: {condition1: peopleNum, condition2: board},
          success: function(res){
            const data = JSON.parse(res)
            console.log(data)
            // if (data[0].isSame) {alert('This room already exists!');}
            // else {alert('This room is available!');}
          },
          error: function(){
            alert('error')
          }
        })
      }
      else if (board.length<1 && peopleNum>0){
        $.ajax({
          url: "/search.jsp",
          type: 'GET',
          data: {condition1: peopleNum, condition2: ''},
          success: function(res){
            const data = JSON.parse(res)
            console.log(data)
            // if (data[0].isSame) {alert('This room already exists!');}
            // else {alert('This room is available!');}
          },
          error: function(){
            alert('error')
          }
        })
      }
  }
</script>
</HEAD>
  <body>
  <p> <a href="index.jsp">Home</a> </p>
  
    <h1> Registered Room List </h1>
    <table border="1">
      <tr>
        <td>room name</td>
        <td>location</td>
        <td>capacity</td>
        <td>airconditioner</td>
        <td>board</td>
      </tr>
      <% 
            try {
                stmt = con.createStatement();
                String query = "SELECT * FROM REGISTERED;";
                rs = stmt.executeQuery(query);
                while(rs.next()) {
        %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                    </tr>
        <%
                }
            } catch(SQLException e) {
                out.println(e.toString());
            }
        %>
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
      <p>Condition 1 : <input type="text" name="search_people" placeholder="how many people use it?" id="search_people"></p>
      <p>Condition 2 : <input type="text" name="search_board" placeholder="Do you need a whiteboard?(O/X)" id="search_board"></p>
      <p><input type="button" value="find a room" id="find_room" onclick="onFindClick()"></p>
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