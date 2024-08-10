/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

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
@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
             int id = Integer.parseInt(req.getParameter("id"));
             BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
             boolean f = dao.deleteBooks(id);
             HttpSession session = req.getSession();
           if(f){
               System.out.println("Update Successfully");
               session.setAttribute("succMsg", "Book deleted Successfuly");
               resp.sendRedirect("admin/allBooks.jsp");
           }
           else{
               System.out.println("Something went wrong");
           }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
}
