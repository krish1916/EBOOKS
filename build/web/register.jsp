<%-- 
    Document   : register
    Created on : 24-Feb-2024, 4:11:24 pm
    Author     : rik
--%>


<%--<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function validatePassword() {
                var password = document.getElementById("password").value;

                // Regular expressions for validation
                var upperCase = /[A-Z]/;
                var number = /\d/;
                var specialChar = /[!@#$%^&*()-_=+]/;

                // Check if password meets all criteria
                if (password.length < 8 || !upperCase.test(password) || !number.test(password) || !specialChar.test(password)) {
                    alert("Password must be at least 8 characters long and contain at least one uppercase letter, one number, and one special character.");
                    return false;
                }
                return true;
            }

        </script>

        <%@include file="all_component/allCss.jsp" %>

    </head>
    <body style="background-color:#f7f7f7;">
        <%@include file="all_component/navbar.jsp" %>

        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Registration Page</h3>
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






                            <form action="register" method="post" onsubmit="return validatePassword()">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Full Name<span class="text-danger">*</span></label>
                                    <input name="fname" required="required" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Full Name">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address<span class="text-danger">*</span></label>
                                    <input name="email" required="required" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Phone<span class="text-danger">*</span></label>
                                    <input name="phno" required="required" type="number " class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password<span class="text-danger">*</span></label>
                                    <input name="password" required="required" type="password" class="form-control" id="password" placeholder="Password">
                                </div>
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Condition</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <%@include file="all_component/footer.jsp" %>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
