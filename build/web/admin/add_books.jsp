<%-- 
    Document   : add_books
    Created on : 26-Feb-2024, 3:47:36 pm
    Author     : rik
--%>

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
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
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

<!--                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg }</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session" />
                            </c:if>-->


                            <form action="../add_books" method="post"
                                  enctype="multipart/form-data">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label> <input
                                        name="bname" type="text" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name*</label> <input
                                        name="author" type="text" class="form-control"
                                        id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>



                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label> <input
                                        name="price" type="number" class="form-control"
                                        id="exampleInputPassword1">
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Book Categories</label> <select
                                        id="inputState" name="categories" class="form-control">
                                        <option selected>--select--</option>

                                        <option >New Books</option>
                                        <option>E Book</option>


                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="inputState">Book Status</label> <select
                                        id="inputState" name="status" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label> <input
                                        name="bimg" type="file" class="form-control-file"
                                        id="exampleFormControlFile1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Pdf</label> <input
                                        name="bpdf" type="file" class="form-control-file"
                                        id="exampleFormControlFile1">
                                </div>


                                <button type="submit" class="btn btn-primary">Add</button>
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
