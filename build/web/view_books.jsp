<%-- 
    Document   : view_books.
    Created on : 12-Mar-2024, 8:46:18 pm
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@page import="com.entity.User" %>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>

        <%@include file="all_component/navbar.jsp" %>
        <% User u = (User)session.getAttribute("userobj");
        
        
        %>
        <%
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        Book_Details b = dao.getBookById(bid);
        %>

        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white paint-card">
                    <img src="book/<%=b.getPhotoName()%>"
                         style="height: 250px; width: 200px"><br>
                    <h4>Book Name : <span class="text-success"> <%=b.getBookName() %></span></h4>
                    <h4>Author Name :<span class="text-success"><%=b.getAuthor() %></span> </h4>
                    <h4>Category : <span class="text-success"><%=b.getBookCategory() %></span></h4>

                </div>
                <div class="col-md-6 text-center p-5 border bg-white paint-card">
                    <h2><%= b.getBookName()%></h2>
                    <%
                        if("Old Books".equals(b.getBookCategory()))
                        {%>
                    <h5 class="text-primary">Contact to Seller</h5>
                    <h5>Email : <%= b.getEmail()%></h5>

                    <%}
else if("E Book".equals(b.getBookCategory())){%>
                    <h5 class="text-primary">Your Book will be deliver in your email id with in 4 hours after your purchase</h5>

                    <%}
                    %>
                    <%if("E Book".equals(b.getBookCategory())){%>
                    <div class="row mt-2">

                        
                    </div>

                    <%}else{%>
                    <div class="row mt-2">

                        <div class="col-md-4 text-center text-danger p-2">
                            <i class="fa-solid fa-money-bill-1-wave fa-3x"></i>
                            <p>Cash on Delivery</p>
                        </div>
                        <div class="col-md-4 text-center text-danger p-2 ">
                            <i class="fa-solid fa-rotate-left fa-3x"></i>
                            <p>Return Available</p>
                        </div><!-- comment -->
                        <div class="col-md-4 text-center text-danger p-2">
                            <i class="fa-solid fa-truck fa-3x"></i>
                            <p>Free Delivery</p>
                        </div>
                    </div>

                    <%}
                    %>


                    <% 
                        if("Old Books".equals(b.getBookCategory()))
                        {%>
                    <div class="text-center p-3">
                        <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        <a href="" class="btn btn-danger" style="text-decoration: none;"><i class="fa-solid fa-indian-rupee-sign"></i>200</a>
                    </div>

                    <%}
else{%>


                    <div class="text-center p-3">
                        <%  if(u == null)
                                {%>
                        <a href="login.jsp" class="btn btn-primary" style="margin-left:0.3rem"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                        <%}else{%>
                        <a href="cart?bid=<%= b.getBookId()%>&&uid=<%= u.getId()%>" class="btn btn-primary" style="margin-left:0.3rem"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>

                        <%}
                                
                        %>
                        <a href="" class="btn btn-danger" style="text-decoration: none;"><i class="fa-solid fa-indian-rupee-sign"></i>200</a>
                    </div>
                    <%}
                    %>

                </div>

            </div>


        </div>

    </body>
</html>
