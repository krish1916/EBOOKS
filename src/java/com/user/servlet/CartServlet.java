/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Details;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
//import java.util.List;

/**
 *
 * @author rik
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try{
           int bid = Integer.parseInt(req.getParameter("bid"));
           int uid = Integer.parseInt(req.getParameter("uid"));
           BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
           Book_Details b = dao.getBookById(bid);
           
           Cart c = new Cart();
           c.setBid(bid);
           c.setUid(uid);
           c.setBook_name(b.getBookName());
           c.setAuthor(b.getAuthor());
           c.setPrice(Double.parseDouble(b.getPrice()));
           c.setTotal_price(Double.parseDouble(b.getPrice()));
           c.setBookc(b.getBookCategory());
           
           CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
           boolean f = dao2.addCart(c);
           HttpSession session = req.getSession();
           if(f){
               
                session.setAttribute("cartobj",c.getBookc());
                session.setAttribute("carta",c.getAuthor());
                
               System.out.println("Add Cart Success");
               session.setAttribute("succMsg", "Item added to cart");
               resp.sendRedirect("index.jsp");
           }else{
               System.out.println("Not Added to Cart");
           }
           
           
       }catch(Exception e){
           e.printStackTrace();
       }
    }
    
    
    
}
