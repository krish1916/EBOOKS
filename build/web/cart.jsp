<%-- 
    Document   : cart
    Created on : 13-Mar-2024, 2:24:48 pm
    Author     : rik
--%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
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

        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row p-2">
                <div class="col-md-6">


                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Selected Item</h3>
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

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Category</th>



                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                    User u = (User) session.getAttribute("userobj");
                                    

                                    CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                    List<Cart> cart = dao.getBookByUser(u.getId());
                                    Double totalPrice = 0.00;
                                    for (Cart c : cart) {
                                    totalPrice=c.getTotal_price();
                                            
                                    %>
                                    <tr>
                                        <th scope="row"><%=c.getBook_name()%></th>
                                        <td><%=c.getAuthor()%></td>
                                        <td><%=c.getPrice()%></td>
                                        <td><%=c.getBookc()%></td>


                                        <td><a
                                                href="remove?bid=<%= c.getBid() %>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid() %>"
                                                class="btn btn-sm btn-danger">Remove</a></td>
                                    </tr>
                                    <%
                                    }
                                    %>

                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><%=totalPrice%></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>
                            <form method="post" action="order">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <input name="id" type="hidden" value="<%=u.getId() %>">
                                        <label for="inputEmail4">Name</label>
                                        <input required="required" name="uname" type="text" class="form-control" id="inputEmail4" value="<%= u.getName()%>" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email</label>
                                        <input required="required" name="email" type="email" class="form-control" id="inputPassword4" value="<%=u.getEmail() %>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone Number</label>
                                        <input required="required" name="phone" type="text" class="form-control" id="inputEmail4" value="<%=u.getPhno() %>" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input required="required" name="address" type="text" class="form-control" id="inputPassword4" value="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input required="required" name="landmark" type="text" class="form-control" id="inputEmail4" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input required="required" name="city" type="text" class="form-control" id="inputPassword4" value="">
                                    </div>
                                </div><!-- comment -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">State</label>
                                        <input required="required" name="state" type="text" class="form-control" id="inputEmail4" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Zip Code</label>
                                        <input required="required" name="pincode" type="number" class="form-control" id="inputPassword4" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Payment Mode</label>
                                    <select class="form-control" name="payment"> 
                                        <option value="noselect">---Select</option>
                                        <option value="COD">Cash On Delivery</option>
                                        
                                        
                                        <option value="ONLINE" >Online Payment</option>
                                    </select>
                                </div>


                                <input type="hidden" name="ta" value="<%=totalPrice%>">
                                <div class="text-center">
                                    <button class="btn btn-success">Order Now</button>
                                    <a href="index.jsp" class="btn btn-warning">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
