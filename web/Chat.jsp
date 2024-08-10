<%-- 
    Document   : c
    Created on : 18-Mar-2024, 12:23:32 pm
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>ChatGPT Integration</title>
        <%@include file="all_component/allCss.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#sendMessage").click(function () {
                    var message = $("#userMessage").val();
                    $("#chat").append("<div>You: " + message + "</div>");
                    $("#userMessage").val("");

                    $.ajax({
                        url: "ChatServlet",
                        type: "POST",
                        data: {message: message},
                        success: function (response) {
                            $("#chat").append("<div>Natasa: "  + response + "</div>");
                        },
                        error: function () {
                            $("#chat").append("<div>Natasa: "+ Error + "</div>");
                        }
                    });
                });
            });
        </script>
        
    </head>
    <body>

        <%@include file="all_component/navbar.jsp"%>
        <div class="conatiner">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="text-center text-primary">Chat Bot</h1>
                            <div id="chat"></div>
                            <input type="text" id="userMessage" placeholder="Type a message" class="p-4" style="border-radius: 15px; margin-bottom: 30px;width: 80%;" >
                            <button id="sendMessage" class="btn "><i class="fa-solid fa-paper-plane"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

