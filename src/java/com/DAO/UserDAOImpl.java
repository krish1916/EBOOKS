/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rik
 */
public class UserDAOImpl implements UserDAO {

    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User us){
        boolean f = false;
        try{
           PreparedStatement ps = conn.prepareStatement("INSERT into user(Name,Email,Password,phno) values(?,?,?,?)");
           ps.setString(1, us.getName());
           ps.setString(2, us.getEmail());
           ps.setString(4, us.getPhno());
           ps.setString(3, us.getPassword());
           int i =ps.executeUpdate();
           if(i>0){
               f=true;
           }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
     
    public User login(String email,String password){
        //boolean f = false;
        User us = null;
        try{
            String sql="Select * from user where Email=? and Password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                us=new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(10));
                us.setPassword(rs.getString(4));
                
                
                        
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return us;
    }
    public boolean checkPassword(int id ,String ps){
        boolean f = false;
        try{
            String sql ="select * from user where id=? and Password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, ps);
            
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                f=true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
           
        }
        
        return f;
    }
    public boolean updateProfile(User us){
        boolean f = false;
        try{
           PreparedStatement ps = conn.prepareStatement("update user set Name=?,Email=?,phno=? where id=?");
           ps.setString(1, us.getName());
           ps.setString(2, us.getEmail());
           ps.setString(3, us.getPhno());
           ps.setInt(4, us.getId());
           
           int i =ps.executeUpdate();
           if(i>0){
               f=true;
           }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean checkUser(String email){
        boolean f = true;
        try{
           PreparedStatement ps = conn.prepareStatement("select * from user where email = ?");
           ps.setString(1, email);
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               f=false;
           }
           
           
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean forgotPassword(String email, String phno, String password) {

		boolean f = false;
		try {
			String sql = "update user set password=? where email=? and phno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			ps.setString(3, phno);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
    public boolean checkPasswordAuthen(String email, String phno) {
		boolean f = false;
		try {

			String sql = "select * from user where email=? and phno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, phno);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
