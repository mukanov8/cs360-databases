<%@ page language="java" import="java.util.*, java.sql.*" session="true" contentType="text/html;charset=EUC_KR" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.*"%>
<%@ page import="java.util.ArrayList"%>

<HTML>
<HEAD>
<TITLE> HW6 </TITLE>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
        <td>delete</td>
      </tr>
    </table>

    <h1> Insert Room Information </h1>
    <form method="post">
      <p><input type="text" name="roomname" placeholder="room name"><td>
      <p><input type="text" name="location" placeholder="location"></p>
      <p><input type="text" name="capacity" placeholder="capacity"></p>
      <p>air conditioner</p>
      <p><input type="radio" name="airconditioner" value = "O">O
      <input type="radio" name="airconditioner" value="X">X</p>
      <p>board</p>
      <p><input type="radio" name="board" id="board" value = "O">O
      <input type="radio" name="board" id="board" value="X">X</p>
      <p><input type="submit" value="register the room"></p>
    </form>

  </body>
</html>