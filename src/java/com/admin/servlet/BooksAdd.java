/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

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
@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
       try{
           String bookName=req.getParameter("bname");
           String author = req.getParameter("author");
           String price = req.getParameter("price");
           String  category=req.getParameter("categories");
           String status=req.getParameter("status");
           Part part1 = req.getPart("bimg");
           Part part2 =req.getPart("bpdf");
           String fileName1 = part1.getSubmittedFileName();
           String fileName2 =part2.getSubmittedFileName();
           
           Book_Details b = new Book_Details(bookName,author,price,category,status,fileName1,"admin",fileName2);
           System.out.println(b);
           BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
           boolean f=dao.addBooks(b);
           HttpSession session = req.getSession();
           
           if(f){
               String Path =getServletContext().getRealPath("")+"book";
           System.out.println(Path);
           File fi = new File(Path);
           part1.write(Path + File.separator + fileName1);
           //System.out.println(Path);
           session.setAttribute("succMsg", "Book added Successfuly");
           resp.sendRedirect("admin/add_books.jsp");
           
               
               System.out.println("Book Add Successfully"); 
           }
           else{
               session.setAttribute("failedMsg", "Book is not added");
               resp.sendRedirect("admin/add_books.jsp");
               System.out.println("Not add");
           }
           
       }catch(Exception e){
           e.printStackTrace();
       }
    }
    
    
    
}
