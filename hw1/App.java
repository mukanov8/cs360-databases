package com.example;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Scanner;

public class App 
{
    public static void main( String[] args )
    {
        int cmdNumber=1;
        String id, pw, dbname;

        Scanner scan = new Scanner(System.in);
        System.out.print("type your DB name : ");
        dbname = scan.nextLine();
        System.out.print("type your ID : ");
        id = scan.nextLine();
        System.out.print("type your PW : "); 
        pw = scan.nextLine();

        PreparedStatement pstmt = null;	
        ResultSet rs = null;

        Connector con = new Connector(dbname, id, pw);

        try(Connection curCon = con.getCon(); Statement stmt = curCon.createStatement();)
        {
            while(true)
            {        
                System.out.println(""); 
                System.out.print("Select commands (1) Problem 1, (2) Problem 2, (3) Problem 3, (4) Problem 4, (5) Problem 5 : ");

                if(cmdNumber == 1)
                {
                    // Code for Problem 1
                    System.out.print("what's your desired max price ");
                    String maxPrice = scan.nextLine();
                    
                    System.out.print("what's your desired min value for speed? ");
                    String speed = scan.nextLine();

                    System.out.print("what's your desired min value for RAM? ");
                    String ram = scan.nextLine();

                    System.out.print("what's your desired min value for hard disk? ");
                    String hardDisc = scan.nextLine();

                    System.out.print("what's your desired min value for screen size? ");
                    String screenSize = scan.nextLine();

                    String queryString = String.format("SELECT LAPTOP.model, LAPTOP.speed, LAPTOP.ram, LAPTOP.hd, LAPTOP.screen, LAPTOP.price, PRODUCT.maker FROM LAPTOP, PRODUCT WHERE PRODUCT.model=LAPTOP.model AND LAPTOP.speed>=%s AND LAPTOP.ram>=%s AND LAPTOP.hd>=%s AND LAPTOP.screen>=%s AND LAPTOP.price<=%s", speed, ram, hardDisc, screenSize, maxPrice);
                    
                    System.out.print(queryString);

                    StringBuilder ddl = new StringBuilder();
                    String query = ddl.append(queryString).toString();
                    stmt.execute(query);
                }
                
                else if(cmdNumber == 2)
                {
                    // Code for Problem 1
                }

                else if(cmdNumber == 3)
                {
                    // Code for Problem 1
                }

                else if(cmdNumber == 4)
                {
                    // Code for Problem 1
                }

                else if(cmdNumber == 5)
                {
                    // Code for Problem 1
                }

                else{
                    break;
                }

            }
        }
        catch (SQLException s) {
            System.out.print(s.getMessage());
        }
    }
}

class Connector {

    private Connection con;
    private String url;
    private String id;
    private String pwd;

    public Connector(String dbname, String id, String pwd){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.url = "jdbc:mysql://localhost:3306/" + dbname + "?characterEncoding=UTF-8&serverTimezone=UTC";
            this.id = id;
            this.pwd = pwd;
        } catch (ClassNotFoundException e){ }

        try {
            System.out.println("loading Connection...");
            this.con = DriverManager.getConnection(this.url, this.id, this.pwd);
            System.out.println("Connection success!");
        } catch (SQLException s){ 
            System.out.println(s.getMessage());
            System.out.print(s.getSQLState());
        }
    }

    public Connection getCon(){
        return this.con;
    }

    public void setCon(String newDbname, String newId, String newPwd){
        
        this.url = "jdbc:mysql://localhost:3306/" + newDbname + "?characterEncoding=UTF-8&serverTimezone=UTC";
        // mysql 8 이상을 사용할 때에 serverTimezone을 명시하지 않으면 error 발생
        this.id = newId;
        this.pwd = newPwd;

        try {
            this.con = DriverManager.getConnection(this.url, this.id, this.pwd);
        } catch (SQLException s) {             
            System.out.println(s.getMessage());
            System.out.print(s.getSQLState());
        }
    }

    public void closeCon(){
        try{
            this.con.close();
            System.out.println("connection is closed.");
            System.out.println(this.con.isClosed());
        } catch (SQLException s){ }
    }
}
