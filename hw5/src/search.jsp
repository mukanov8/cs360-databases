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
        int condition1 = Integer.parseInt(request.getParameter("condition1"));
        String condition2 = request.getParameter("condition2");
        String query= null;
        if (condition2 !=null ){
            query = "SELECT * FROM REGISTERED WHERE capacity >= ? ;";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, condition1);
        }
        else {
            query = "SELECT * FROM REGISTERED WHERE capacity >= ? AND board like ?;";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, condition1);
            pstmt.setString(2, condition2);
        }
        rs = pstmt.executeQuery();
        while(rs.next()){
            JSONObject obj = new JSONObject();
            obj.put("roomname", rs.getString("roomname"));
            obj.put("location", rs.getString("location"));
            obj.put("capacity", rs.getInt("capacity"));
            obj.put("airconditioner", rs.getString("airconditioner"));
            obj.put("board", rs.getString("board"));
            array.add(obj);
        }
        out.print(array);
    } catch(SQLException e) {
        out.println(e.toString());
    }
%>
