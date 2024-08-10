<%-- 
    Document   : verifyOTP
    Created on : 16-Mar-2024, 2:06:13 pm
    Author     : rik
--%>

<%
// Verify OTP and register user
if (request.getParameter("verifyButton") != null) {
    String enteredOTP = request.getParameter("otp"); // Assuming OTP input field is named "otp"
    String storedOTP = (String) session.getAttribute("otp");
    if (enteredOTP.equals(storedOTP)) {
        // OTP matched, proceed with registration
        out.println("Registration successful!");
    } else {
        // OTP not matched
        out.println("Invalid OTP. Please try again.");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
</head>
<body>
    <h2>Verify OTP</h2>
    <form action="" method="post">
        Enter OTP: <input type="text" name="otp" required><br><br>
        <input type="submit" name="verifyButton" value="Verify">
    </form>
</body>
</html>
