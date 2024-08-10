<%-- 
    Document   : allBooks
    Created on : 28-Feb-2024, 11:15:47 am
    Author     : rik
--%>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="text-center"><h3>All Books</h3></div>
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
        <table class="table table-striped ">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th><!-- comment -->
                    <th scope="col">Status</th><!-- comment -->
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<Book_Details> list = dao.getAllBooks();
                    for(Book_Details b :list)
                    {%>
                <tr>
                    <td><%= b.getBookId() %></th>
                    <td><img src="../book/<%= b.getPhotoName() %>" style="width: 50px ;height: 50px"></td>
                    <td><%= b.getBookName() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getPrice() %></td>
                    <td><%= b.getBookCategory() %></td> 
                    <td><%= b.getStatus() %></td> 
                    <td>
                        <a href="Edit_Books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>


                    </td>
                </tr>

                <%
                }
                    
                %>


            </tbody>
        </table>
        <div style="margin-top: 289px;">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
