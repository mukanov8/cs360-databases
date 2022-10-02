<%@ page language="java" import="java.util.*, java.sql.*" session="true" contentType="text/html;charset=EUC_KR" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.json.simple.JSONArray"%> 
<%@ page import="org.json.simple.JSONObject"%>

<%
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    JSONArray array = new JSONArray();
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

    try {
        String roomName = request.getParameter("name");
        String query = "SELECT count(*) FROM REGISTERED WHERE roomname like ? ;";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, roomName);
        rs = pstmt.executeQuery();
        rs.next();
        int sameName = rs.getInt(1);
        if(sameName > 0) {
          JSONObject obj = new JSONObject();
          obj.put("isSame", true);
          array.add(obj);
        }
        else{
          JSONObject obj = new JSONObject();
          obj.put("isSame", false);
          array.add(obj);
        }
        out.print(array);
    } catch(SQLException e) {
        out.println(e.toString());
    }
%>
