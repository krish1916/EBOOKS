<%-- 
    Document   : add_books
    Created on : 26-Feb-2024, 3:47:36 pm
    Author     : rik
--%>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit Books</h4>

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
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                                Book_Details b = dao.getBookById(id);
                                    
                            %>


                            <form action="../edit_books" method="post"
                                  >
                                <input type="hidden" name="id" value="<%=b.getBookId() %>">
                                

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label> <input
                                        name="bname" type="text" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="emailHelp"
                                        value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label> <input
                                        name="author" type="text" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getAuthor() %>">
                                        </div>

                                        

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label> <input
                                        name="price" type="number" class="form-control"
                                        id="exampleInputPassword1" value="<%=b.getPrice()%>">
                                </div>



                                <div class="form-group">
                                    <label for="inputState">Book Status</label> <select
                                        id="inputState" name="status" class="form-control">
                                        <%
                                        if ("Active".equals(b.getStatus())) {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%
                                        }
                                        %>
                                    </select>
                                </div>




                                <button type="submit" class="btn btn-primary">Edit</button>
                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 100px;">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>

