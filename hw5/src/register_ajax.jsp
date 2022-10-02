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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script > 
function onNameCheckClick(){
    const value = $('#nameInput').val() ;
    if (value.length>0){
      $.ajax({
        url: "/nameCheck.jsp",
        type: 'GET',
        data: {name: value},
        success: function(res){
          const data = JSON.parse(res)
          if (data[0].isSame) {alert('This room already exists!');}
          else {alert('This room is available!');}
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
        <td>delete</td>
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
                        <td> 
                          <form action="delete_reservation.jsp?roomname=<%=rs.getString(1)%>" method="post">
                          <input type="submit" value="Delete"> </form>
                      </td>
                    </tr>
        <%
                }
            } catch(SQLException e) {
                out.println(e.toString());
            }
        %>
    </table>

    <h1> Insert Room Information </h1>
    <form method="post" action="register_room.jsp">
      <p>
      
      <input type="text" name="roomname" placeholder="room name" id="nameInput"> <button id="nameCheck" type="button" onclick="onNameCheckClick()"> Room name check</button>
      </p>
      <p><input type="text" name="location" placeholder="location"></p>
      <p><input type="text" name="capacity" placeholder="capacity"></p>
      <p>air conditioner</p>
      <p><input type="radio" name="airconditioner" value = "O">O
      <input type="radio" name="airconditioner" value="X">X</p>
      <p>board</p>
      <p><input type="radio" name="board" id="board" value = "O">O
      <input type="radio" name="board" id="board" value="X">X</p>
      <p><input type="submit" value="register_room"></p>
    </form>

  </body>
</html>