<%@page import="java.sql.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@page import="com.entity.User" %>
<%@page import="com.entity.Cart" %>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%
    String userName1= (String)session.getAttribute("userName");
    String author= (String)session.getAttribute("carta");
    
%>


<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3> <i class="fa-solid fa-book"></i> Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="ch">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        




        <%
            if(session.getAttribute("userobj") != null)
            {%>
        <div class="col-md-3">
            <%
                                    User u9 = (User) session.getAttribute("userobj");
                                    

                                    CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                    List<Cart> cart = dao.getBookByUser(u9.getId());
                                    //Double totalPrice = 0.00;
                                    for (Cart c : cart) {%>
                                    
                                            
                                    <%}%>
                                    <a href="cart.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"><span class="text-warning ml-2"><%=cart.size() %></span></i></a>
            
            
            
            
            
            <a href="setting.jsp" class="btn btn-success "><i class="fa-regular fa-user"></i>
                <% 
                        String fullName = userName1; // Replace with your actual full name
                        String[] parts = fullName.split(" ");
                        String initials = parts[0].charAt(0) +" "+ parts[1]; // First letter of first name and full surname
                        out.print(initials.toUpperCase()); // Convert to uppercase if needed
                    %>
            
            </a>
            <!--            <a  class="btn btn-primary "><i class="fa-solid fa-right-to-bracket"></i>Logout</a>-->


            <a a data-toggle="modal" data-target="#exampleModalCenter"
               class="btn btn-primary text-white"><i
                    class="fas fa-sign-in-alt"></i> Logout</a>

        </div>


        <%}else{%>
        <div class="col-md-3">
            <a href="login.jsp" class="btn btn-success "><i class="fa-solid fa-right-to-bracket"></i>Login</a>
            <a href="register.jsp" class="btn btn-primary "><i class="fa-regular fa-user"></i>Register</a>
        </div>


        <%}
            
        %>





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
                    <a href="logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>       
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"> <i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
            </li>


            <li class="nav-item active">
                <a class="nav-link" href="AllRecentBooks.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link rik-link" href="AllNewBooks.jsp"><i class="fa-solid fa-book-bookmark"></i> New Book</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link disabled" href="AllOldBooks.jsp"><i class="fa-solid fa-book"></i> Old Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link disabled" href="AllDownloadBooks.jsp"><i class="fa-solid fa-book"></i> Download Book</a>
            </li>

        </ul>
        <%
            if(session.getAttribute("userobj") != null)
            {%>
        <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit" style="margin-right: 0.5rem;" ><i class="fa-solid fa-gears"></i> Setting</a>
            <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 mr-1" type="submit"><i class="fa-solid fa-phone-volume"></i> Contact Us</a>
            <a href="Chat.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit" style="margin-right: 0.5rem;" ><i class="fa-solid fa-gears"></i> Chat with us</a>

            
        </form>


        <%}else{%>
        <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit" style="margin-right: 0.5rem;" ><i class="fa-solid fa-gears"></i> Setting</a>
            <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 mr-1" type="submit"><i class="fa-solid fa-phone-volume"></i> Contact Us</a>
            

            
        </form>


        <%}
            
        %>
        
        
        
        
        
        
        
    </div>
</nav>