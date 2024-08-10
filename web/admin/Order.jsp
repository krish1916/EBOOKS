<%-- 
    Document   : allBooks
    Created on : 28-Feb-2024, 11:15:47 am
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
<%
// Check if the admin is logged in
Boolean isAdminLoggedIn = (Boolean) session.getAttribute("userobj");
if (isAdminLoggedIn == null || !isAdminLoggedIn) {
    // If admin is not logged in, redirect to login page
    response.sendRedirect("../login.jsp");
} else {
    // Admin is logged in, display the admin module
    //response.sendRedirect("home.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        
        <%@include file="navbar.jsp" %>
        <div class="text-center"><h3>Order Details</h3></div>
        <table class="table table-striped ">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    
                    <th scope="col">Email</th>
                    
                    <th scope="col">Phone No</th><!-- comment -->
                    <th scope="col">Address</th>
                    <th scope="col">Book Name</th><!-- comment -->
                    <th scope="col">Author</th>
                     <th scope="col">Price</th>
                     <th scope="col">Category</th>
                      <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
                        List<Book_Order> blist = dao.getBook();
                        for(Book_Order b : blist){%>
                        <tr>
                            <th scope="row"><%=b.getOrderId() %></th>
                            
                            <td><%=b.getEmail() %></td>
                            
                            <td><%=b.getPhno() %></td>
                            <td><%= b.getFulladd() %></td>
                            <td><%=b.getBookName() %></td>
                            <td><%=b.getAuthor() %></td>
                            <td><%=b.getPrice() %></td>
                            <td><%=b.getBookCategory() %></td>
                            <td><%=b.getPaymentType() %></td>
                    </tr>
                    <%}
                
                %>
                
            </tbody>
        </table>
        <div style="margin-top: 290px;">
             <%@include file="footer.jsp" %>
        </div>

    </body>
</html>

