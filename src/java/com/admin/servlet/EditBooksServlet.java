/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
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
@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try{
           int id = Integer.parseInt(req.getParameter("id"));
            String bookName=req.getParameter("bname");
           String author = req.getParameter("author");
           String price = req.getParameter("price");
           //String  category=req.getParameter("categories");
           String status=req.getParameter("status");
           
           Book_Details b = new Book_Details();
           b.setBookId(id);
           b.setBookName(bookName);
           b.setAuthor(author);
           b.setPrice(price);
           b.setStatus(status);
           BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
           boolean f = dao.editBooks(b);
           HttpSession session = req.getSession();
           if(f){
               System.out.println("Update Successfully");
               session.setAttribute("succMsg", "Book Edit Successfuly");
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
