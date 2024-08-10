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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try{
             UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
             HttpSession session = req.getSession();
             String email = req.getParameter("email");
             String password= req.getParameter("password");
             if("admin@gmail.com".equals(email) && "admin".equals(password)){
                 User us = new User();
                 us.setName("Admin");
                 session.setAttribute("userobj",true);
                 session.setAttribute("adminName","Admin");
                 resp.sendRedirect("admin/home.jsp");
                 
             }else{
                 User us = dao.login(email, password);
                 if(us!=null){
                     session.setAttribute("userobj1",true);
                     session.setAttribute("userobj", us);
                     session.setAttribute("userName",us.getName());
                     session.setAttribute("userEmail",us.getEmail());
                     
                     
                     
                     resp.sendRedirect("index.jsp");
                     
                 }
                 else{
                     session.setAttribute("failedMsg", "Invaid user please register first");
                    resp.sendRedirect("login.jsp?error=true");
                 }
                 
             }
             
             //System.out.println(email+" "+password);
    
}catch(Exception e){
    e.printStackTrace();
}
   
    }
   
}
   
    



    

