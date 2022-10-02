<%@ page language="java" import="java.util.*, java.sql.*" session="true" contentType="text/html;charset=EUC_KR" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.*"%>

<HTML>
<HEAD>
<TITLE> HW6 </TITLE>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</HEAD>
  <body>
    <h1> Reservation List </h1>
    <p> <a href="index.jsp">Home</a> </p>
    <table border="1">
      <tr>
        <td>room name</td>
        <td>user_name</td>
        <td>start_date</td>
        <td>end_date</td>
        <td>purpose</td>
        <td>number of people</td>
        <td>delete</td> 
      </tr>
    </table>

  </body>
</html>