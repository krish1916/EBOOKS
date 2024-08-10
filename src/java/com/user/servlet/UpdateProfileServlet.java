/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author rik
 */
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id= Integer.parseInt(req.getParameter("id1"));
             String Name = req.getParameter("fname");
            String Email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String Password = req.getParameter("password");
            
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean f = dao.checkPassword(id, Password);
            User us = new User();
            us.setId(id);
            us.setName(Name);
            us.setEmail(Email);
            us.setPhno(phno);
            HttpSession session = req.getSession();
            if(f){
                boolean f1 = dao.updateProfile(us);
                if(f1){
                    System.out.println("Success");
                    session.setAttribute("succMsg", "Profile Update Successfully");
                    resp.sendRedirect("edit_profile.jsp");
                }
                else{
                    System.out.println("Something went wrong");
                }
            }
            else{
                System.out.println("Password Incorrect");
                session.setAttribute("failedMsg", "Password Incorrect");
                resp.sendRedirect("edit_profile.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
}
