<%-- 
    Document   : home
    Created on : 25-Feb-2024, 2:45:44 pm
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%
// Check if the admin is logged in
Boolean isAdminLoggedIn = (Boolean) session.getAttribute("userobj");
String adminName = (String) session.getAttribute("adminName");

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
        <style>
            a{
                text-decoration: none;
            }
            a:hover{
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
<!--        <c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>-->
        <div class="container">
            <div class="row p-5">

                <div class="col-md-3 ">
                    <a href="add_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-plus fa-3x text-primary"></i> <br><!-- comment -->
                                <h4>Add Books</h4>
                                -------

                            </div>
                        </div>
                    </a>


                </div>

                <div class="col-md-3 ">
                    <a href="allBooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book fa-3x text-danger"></i> <br><!-- comment -->
                                <h4>All Books</h4>
                                -------

                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-md-3 ">
                    <a href="Order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box fa-3x text-warning"></i> <br><!-- comment -->
                                <h4>Order</h4>
                                -------

                            </div>
                        </div>
                    </a>

                </div>

                

                <div class="col-md-3 ">
                    <a data-toggle="modal" data-target="#exampleModalCenter">
                        <div class="card">
                            <div class="card-body text-center text-primary">
                                <i class="fa-solid fa-right-from-bracket fa-3x "></i> <br><!-- comment -->
                                <h4>Logout</h4>
                                -------

                            </div>
                        </div>
                    </a>

                </div>


            </div>
            <div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You want logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
        </div>
       

    </body>
</html>
