
<%
    String adminName1= (String)session.getAttribute("adminName");
%>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3> <i class="fa-solid fa-book"></i> Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <div class="col-md-3">
            <a class="btn btn-success text-white"><i
                    class="fas fa-user"></i> <%= adminName1%></a>
            <a a data-toggle="modal" data-target="#exampleModalCenter"
               class="btn btn-primary text-white"><i
                    class="fas fa-sign-in-alt"></i> Logout</a>

        </div>
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
                    <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<!-- end logout modal -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp"> <i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
            </li>

    </div>
</nav>