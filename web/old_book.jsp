<%-- 
    Document   : edit_book
    Created on : 14-Mar-2024, 2:46:25 pm
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
        <div class="conatiner ">
            <h3 class="text-center text-primary">Old Books</h3>
            <table class="table table-striped mt-5 ">
                <thead>
                    <tr>
                        
                        <th scope="col">Book Name</th>
                        
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User)session.getAttribute("userobj");
                        String email = u.getEmail();
                        
                        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                        List<Book_Details>list = dao.getBookByOld(email,"Old Books");
                        for(Book_Details b : list){%>
                        <tr>
                            <th scope="row"><%=b.getBookName()%></th>
                            <td><%=b.getAuthor() %></td>
                            <td><%=b.getPrice() %></td>
                        <td>
                            <a href="delete_old_books?em=<%=email %>&&id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                        
                    </tr>
                        <%}
                        %>
                    
                    
                </tbody>
            </table>
        </div>
    </body>
</html>
