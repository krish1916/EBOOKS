/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;


import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author rik
 */
@WebServlet("/add_old_book")
@MultipartConfig

public class AddOldBook extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
       try{
           String bookName=req.getParameter("bname");
           String author = req.getParameter("author");
           String price = req.getParameter("price");
           String  category="Old Books";
           String status="Active";
           Part part = req.getPart("bimg");
           String fileName = part.getSubmittedFileName();
           String userEmail = req.getParameter("user");
           
           Book_Details b = new Book_Details(bookName,author,price,category,status,fileName,userEmail,"");
           //System.out.println(b);
           BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
           boolean f=dao.addBooks(b);
           HttpSession session = req.getSession();
           
           if(f){
               String Path =getServletContext().getRealPath("")+"book";
           System.out.println(Path);
           File fi = new File(Path);
           part.write(Path + File.separator + fileName);
           //System.out.println(Path);
           session.setAttribute("succMsg", "Book Add Successfully");
           resp.sendRedirect("sell_book.jsp");
               
               System.out.println("Book Add Successfully"); 
           }
           else{
               session.setAttribute("failedMsg", "Something went wrong");
               System.out.println("Not add");
           }
           
       }catch(Exception e){
           e.printStackTrace();
       }
    }
    
}
