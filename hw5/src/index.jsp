<%@page contentType="text/html; charset=EUC-KR" %>
<%@page import="java.sql.*"%>
<%
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String jdbcUrl = "jdbc:mysql://localhost:3306/hw6?characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "user";
    String dbPass = "user";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch(ClassNotFoundException e) {
        out.println(e.toString());
    }

    try {
        con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
    } catch(SQLException e) {
        out.println(e.toString());
    }
%>
<html>
    <head>
        <title>HW6  </title>
    </head>
    <body>
        <h1> CS360 Room Reservation Service </h1>
        <p> <a href="register_ajax.jsp">Make New Room </a> </p>
        <p> <a href="reservation_ajax.jsp">New Reservation </a> </p>
        <p> <a href="reservation_list.jsp">See All Reservations </a> </p>

    </body>
</html>
