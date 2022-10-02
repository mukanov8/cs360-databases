<%@page contentType="text/html; charset=EUC-KR" %>
<%@page import="java.sql.*"%>

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
<html>
    <head>
        <TITLE> HW6 </TITLE>
        <meta charset="ISO-8859-1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <p> <a href="index.jsp">Home</a> </p>
        <p> <a href="register_ajax.jsp"> Back </a> </p>

        <%
            try {
                String roomName = request.getParameter("roomname");
                String query = "DELETE FROM REGISTERED WHERE roomname=?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, rooroomNamemName);
                pstmt.execute();
        %>
                <p>Deleted room: <%=roomName%>  </p>
        <%
            } catch(SQLException e) {
                out.println(e.toString());
            }
        %>
        
    </body>
</html>
