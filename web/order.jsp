<%-- 
    Document   : order
    Created on : 14-Mar-2024, 11:34:00 am
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@page import="com.entity.User" %>
<%@page import="com.entity.Book_Details"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp"%>
    </head>
    <body>
              <%
// Check if the admin is logged in
Boolean isUserLoggedIn = (Boolean) session.getAttribute("userobj1");
if (isUserLoggedIn == null || !isUserLoggedIn) {
    // If admin is not logged in, redirect to login page
    response.sendRedirect("login.jsp");
} else {
    // Admin is logged in, display the admin module
    //response.sendRedirect("home.jsp");
    }
%>
        <%@include file="all_component/navbar.jsp"%>
        <div class="conatiner p-3">
            <h3 class="text-center text-primary">Your Order</h3>
            <%
    String succMsg = (String)session.getAttribute("succMsg");
    String failedMsg = (String)session.getAttribute("failedMsg");

    if (succMsg != null && !succMsg.isEmpty()) {
                            %>
                            <p class="text-center text-success"><%= succMsg %></p>
                            <%
                                    session.removeAttribute("succMsg");
                                }

                                if (failedMsg != null && !failedMsg.isEmpty()) {
                            %>
                            <p class="text-center text-danger"><%= failedMsg %></p>
                            <%
                                    session.removeAttribute("failedMsg");
                                }
                            %>
            <table class="table table-striped mt-5 ">
                <thead>
                    <tr>
                        <th scope="col">Order Id</th>
                        
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        
                        <th scope="col">Payment Type</th>
                        <th scope="col">Download</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User)session.getAttribute("userobj");
                        OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
                        List<Book_Order> blist = dao.getBook(u.getEmail());
                        for(Book_Order b : blist){%>
                        <tr>
                            <th scope="row"><%=b.getOrderId() %></th>
                            
                            <td><%=b.getBookName() %></td>
                            <td><%=b.getAuthor() %></td>
                            <td><%=b.getPrice() %></td>
                            <td><%=b.getBookCategory() %></td>
                            
                            <td><%=b.getPaymentType() %></td>
                            <% 
if("E Book".equals(b.getBookCategory())){%>
<td>
                                <a href="download?bid=<%= b.getId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-download"></i></a>
                            </td>
<%}
                            %>
                            
                            
                    </tr>
                        <%}
                        %>
                    
                    
                    
                </tbody>
            </table>
        </div>
    </body>
</html>
