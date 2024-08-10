<%-- 
    Document   : edit_profile
    Created on : 14-Mar-2024, 11:34:22 am
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Edit Profile</title>
        <%@include file="all_component/allCss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body style="background-color: #f0f1f2;">
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
        <%
                                    User ur = (User) session.getAttribute("userobj");
        %>
        <%@include file="all_component/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">

                            <h4 class="text-center text-primary">Edit Profile</h4>
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




                            <form action="update_profile" method="post">
                                <input type="hidden" value="<%= ur.getId() %>" name="id1">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Full Name</label> <input
                                        type="text" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="fname"
                                        value="<%=ur.getName() %>">


                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label> <input
                                        type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="email"
                                        value="<%=ur.getEmail() %>">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone No</label> <input
                                        type="number" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" required="required" name="phno"
                                        value="<%=ur.getPhno() %>">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label> <input
                                        type="password" class="form-control" id="exampleInputPassword1"
                                        required="required" name="password">
                                </div>
                                <div class="text-center p-2">
                                    <button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
