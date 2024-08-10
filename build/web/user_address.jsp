<%-- 
    Document   : old_book
    Created on : 14-Mar-2024, 11:34:37 am
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Sell Book</title>
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

        <%@include file="all_component/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Edit Address</h5>




                            <form action="add_old_book" method="post"
                                  >

                                <input type="hidden" value="" name="user">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Address</label>
                                        <input type="text" class="form-control" id="inputEmail4" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Landmark</label>
                                        <input type="text" class="form-control" id="inputPassword4" value="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">City</label>
                                        <input type="text" class="form-control" id="inputEmail4" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">State</label>
                                        <input type="text" class="form-control" id="inputPassword4" value="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Zip</label>
                                        <input type="text" class="form-control" id="inputPassword4" value="">
                                    </div>
                                </div>


                                <div class="text-center">
                                    <button type="submit" class="btn btn-warning">Update</button>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>
