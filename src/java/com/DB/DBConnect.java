/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author rik127.0.0.1:3306
 * root@ebook.chewyqgugsle.eu-north-1.rds.amazonaws.com:3306
 */
public class DBConnect {
    private static Connection conn;
    public static Connection getConn(){
        try{
             Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://ebook.chewyqgugsle.eu-north-1.rds.amazonaws.com:3306/ebook","root","Rik12345");
            
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
            
        }
        return conn;
    }
    
}
