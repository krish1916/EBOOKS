<%-- 
    Document   : login
    Created on : 24-Feb-2024, 10:18:04 pm
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color:#f7f7f7;">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">
                                Login Page</h3>
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
                            <form action="login" method="post">
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" required="required" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   
                                </div>
                                 
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" required="required" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="text-center" >
                                    <button type="submit" class="btn btn-primary">Login</button><br>
                                    <a href="forgot.jsp">forgot Password</a><br>
                                    <a href="register.jsp">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div style="margin-top: 174px;">
             <%@include file="all_component/footer.jsp" %>
        </div>
    </body>
</html>
