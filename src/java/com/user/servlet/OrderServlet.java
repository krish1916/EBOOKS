/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;


import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.entity.Book_Details;
import com.entity.Book_Order;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author rik
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");

			String email = req.getParameter("email");

			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			String totalPrice = req.getParameter("totalPrice");
                        //Double totalPrice = Double.valueOf(req.getParameter("totalPrice"));
			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;
                        Cart ca= new Cart();
			if ("COD".equals(paymentType)) {
                            

				/* System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType); */

				CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
				BookDAOImpl daox=new BookDAOImpl(DBConnect.getConn());
				List<Cart> blist = dao.getBookByUser(id);

				if (blist.isEmpty()) {
					session.setAttribute("failedMsg", "Add Item");
					resp.sendRedirect("cart.jsp");
				} else {
					OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getConn());

					Book_Order o = null;

					ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
					Random r = new Random();
					for (Cart c : blist) {
						o = new Book_Order();
						Book_Details b=daox.getBookById(c.getBid());
						o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
						o.setUserName(name);
						o.setEmail(email);
						o.setPhno(phno);
						o.setFulladd(fullAdd);
						o.setBookName(c.getBook_name());
						o.setAuthor(c.getAuthor());
						o.setPrice(c.getPrice() + "");
						o.setPaymentType("COD");
                                                o.setBookCategory(c.getBookc());
						//o.setIsbn(b.getIsbn());
						orderList.add(o);

					}

					if ("noselect".equals(paymentType)) {
						session.setAttribute("failedMsg", "Choose Payment Method");
						resp.sendRedirect("cart.jsp");
					} else {
						boolean f = dao2.saveOrder(orderList);

						if (f) {
                                                     
							resp.sendRedirect("order_success.jsp");
						} else {
							session.setAttribute("failedMsg", "Your Order Failed");
							resp.sendRedirect("cart.jsp");
						}
					}
				}
			} else if ("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Choose Payment Method");
				resp.sendRedirect("cart.jsp");
			}

			else {
                            if("ONLINE".equals(paymentType)){
                                resp.sendRedirect("cardpayment.jsp?un=" + name + "&&em=" + email + "&&ph=" + phno + "&&ad=" + fullAdd
						+ "&&ta=" + totalPrice);
                                System.out.println(totalPrice);
                                session.setAttribute("price",ca.getTotal_price());
                            }
                            else{
                                resp.sendRedirect("order_success.jsp");
                            }
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    
}
