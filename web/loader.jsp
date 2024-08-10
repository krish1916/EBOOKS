<%-- 
    Document   : loader
    Created on : 18-Mar-2024, 12:54:11 pm
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Loading...</title>
    <style>
        /* Loader styles */
        .loader {
            position: fixed;
            z-index: 9999;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .loader img {
            width: 100px; /* Adjust as needed */
            height: 100px; /* Adjust as needed */
        }
    </style>
</head>
<body>
    <div class="loader">
        <img src="img/loader.gif" alt="Loading...">
    </div>
</body>
</html>
