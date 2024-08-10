/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String Name = req.getParameter("fname");
            String Email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String Password = req.getParameter("password");
            String Check = req.getParameter("check");
            User us = new User();
            us.setName(Name);
            us.setEmail(Email);
            us.setPhno(phno);
            us.setPassword(Password);
            HttpSession session = req.getSession();
            if (Check != null) {
                UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                boolean f2 =dao.checkUser(Email);
                if(f2){
                    boolean f1 = dao.userRegister(us);

                if (f1) {

                    //System.out.println("User Register Success");
                    session.setAttribute("succMsg", "User Register Successful");
                    resp.sendRedirect("register.jsp");
                } else {
                    //System.out.println("Something went wrong on server");
                    session.setAttribute("failedMsg", "Something went wrong on server");
                    resp.sendRedirect("register.jsp");
                    
                }
                    
                }else{
                    session.setAttribute("failedMsg", "Email Already Exist");
                    resp.sendRedirect("register.jsp");
                    
                }
                
                
            

                //System.out.println(Name +" "+ Email+" "+phno+" "+Password+" "+Check);
            }
            else{
                //System.out.println("Please Check Agree Terms & Condition");
                 session.setAttribute("failedMsg", "Please Check Agree Terms & Condition");
                    resp.sendRedirect("register.jsp");
            }
        }
            catch(Exception e){
            e.printStackTrace();
        }

        
    }

}
