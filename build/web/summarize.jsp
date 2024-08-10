<%-- 
    Document   : summarize
    Created on : 18-Mar-2024, 11:20:43 pm
    Author     : rik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Summarization</title>
</head>
<body>
    <h1>Book Summarization</h1>
    <form action="SummarizeServlet" method="post">
        <textarea name="bookText" rows="10" cols="50"></textarea><br>
        <input type="submit" value="Summarize">
    </form>
</body>
</html>

