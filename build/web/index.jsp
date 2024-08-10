<%-- 
    Document   : index
    Created on : 23-Feb-2024, 4:36:28 pm
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
        <style>
            .back-img{
                background: url("img/b.jpg");
                height:60vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;

            }
            .popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #f1f1f1;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                z-index: 1000;
                display: none;
            }
            .loader {
                position: fixed;
                z-index: 9999;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.7);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .loader img {
                width: 100px; /* Adjust as needed */
                height: 100px; /* Adjust as needed */
            }
        </style>
    </head>
    <body style="background-color:#f7f7f7;">
        
        <% User u = (User)session.getAttribute("userobj");
        
        
        %>

        <%@include file="all_component/navbar.jsp" %>
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
        <div class="container-fluid back-img">
            <h2 class="text-center text-danger" ">EBook Management System</h2>
        </div>

        <div class="container" >
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                <%
                    BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
                    List<Book_Details> list1=dao1.getRecentBooks();
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
            <div class="text-center">
                <a href="AllRecentBooks.jsp" class="btn btn-danger btn-sm text-white mt-3">View all</a>
            </div>
        </div>
        <!--        End of recent-->
        <hr>
        <div class="container" >
            <h3 class="text-center">New Book</h3>
            <div class="row">
                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<Book_Details> list=dao.getNewBooks();
                    for(Book_Details b : list)
                    {%>
                <div class="col-md-3">
                    <div class="card ">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px;height: 200px" class="img-thumblin">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Categories : <%= b.getBookCategory() %></p>
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

                        </div>

                    </div>
                </div>
                <%}
                    
                %>





            </div>
            <div class="text-center">
                <a href="AllNewBooks.jsp" class="btn btn-danger btn-sm text-white mt-3">View all</a>
            </div>
        </div>
        <!--End of new-->
        <hr>
        <div class="container" >
            <h3 class="text-center">Old Book</h3>
            <div class="row">
                <%
                    BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
                    List<Book_Details> list3=dao3.getOldBooks();
                    for(Book_Details b : list3)
                    {%>
                <div class="col-md-3">
                    <div class="card ">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px;height: 200px" class="img-thumblin">
                            <p><%= b.getBookName() %></p>
                            <p><%= b.getAuthor() %></p>
                            <p>Categories : <%= b.getBookCategory() %></p>
                            <div class="row">

                                <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm " style="margin-left:0.3rem">View Details</a><!-- comment -->
                                <a href="" class="btn btn-danger btn-sm" style="margin-left:0.2rem"><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></a>

                            </div>

                        </div>

                    </div>
                </div>
                <%}
                    
                %>





            </div>
            <div class="text-center">
                <a href="AllOldBooks.jsp" class="btn btn-danger btn-sm text-white mt-3">View all</a>
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
        


        <!-- Popup message -->
        <div class="popup" id="successPopup">
            Item added to cart successfully!
        </div>

    </body>
</html>
