/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
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
@WebServlet("/delete_old_books")
public class DeleteOldBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String em = req.getParameter("em");
            int id=Integer.parseInt(req.getParameter("id"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.oldBooksDelete(em, "Old Books",id);
            HttpSession session = req.getSession();
            if(f){
                System.out.println("Successful");
                resp.sendRedirect("old_book.jsp");
            }
            else{
                System.out.println("Something wrong");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
}
