<%-- 
    Document   : AllRecentBooks
    Created on : 12-Mar-2024, 7:41:36 pm
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
        <div class="container" >
           
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                <%
                    BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
                    List<Book_Details> list1=dao1.getAllRecentBooks();
                    for(Book_Details b : list1)
                    {%>
                <div class="col-md-3">
                    <div class="card ">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px;height: 200px" class="img-thumblin">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>

                                <%
                                if (b.getBookCategory().equals("New Books")) {
                                %>
                                Categories:<%=b.getBookCategory()%></p>
                            <div class="row">
                                <%  if(u == null)
                                {%>
                                 <a href="login.jsp" class="btn btn-danger btn-sm" style="margin-left:0.3rem"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                                <%}else{%>
                                <a href="cart?bid=<%= b.getBookId()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm" style="margin-left:0.3rem"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>

                                 <%}
                                
                                %>
                                
                                
                                <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm " style="margin-left:0.3rem">View Details</a><!-- comment -->
                                
                                <a href="" class="btn btn-danger btn-sm" style="margin-left:0.2rem"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>

                            </div>
                            <%
                            } else {
                            %>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="row">
                                
                                <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm " style="margin-left:0.3rem">View Details</a><!-- comment -->
                                <a href="" class="btn btn-danger btn-sm" style="margin-left:0.2rem"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>
                            </div>
                            <%
                            }
                            %>




                        </div>

                    </div>
                </div>
                <%}
                    
                %>





            </div>
            
        </div>
        
    </body>
</html>
