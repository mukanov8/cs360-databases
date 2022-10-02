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


    </HEAD>
    <body>
        <p> <a href="index.jsp">Home</a> </p>
        <p><a href="register_ajax.jsp">Back </a> </p>
        <%
            try {
                String roomName = request.getParameter("roomname");
                String location = request.getParameter("location");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                String airconditioner = request.getParameter("airconditioner");
                String board = request.getParameter("board");

                String query = "insert into REGISTERED values(?, ?, ?, ?, ?)";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, roomName);
                pstmt.setString(2, location);
                pstmt.setInt(3, capacity);
                pstmt.setString(4, airconditioner);
                pstmt.setString(5, board);
                pstmt.execute();
        %>
                <p><%=roomName%> was registered </p>
        <%
            } catch(SQLException e) {
                out.println(e.toString());
            }
        %>
        
    </body>
</HTML>
