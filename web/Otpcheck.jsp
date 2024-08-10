<%@ page import="com.OTP.OTPGenerator" %>
<%@ page import="com.OTP.EmailSender" %>

<%
// Register button clicked
EmailSender em = new EmailSender();
if (request.getParameter("registerButton") != null) {
    // Generate OTP
    String otp = OTPGenerator.generateOTP();

    // Store OTP in session
    session.setAttribute("otp", otp);

    // Send OTP to user's email
    String recipientEmail = request.getParameter("email"); // Assuming email input field is named "email"
    em.sendOTPEmail(recipientEmail, otp);

    // Forward to OTP verification page
    response.sendRedirect("verifyOTP.jsp");
    try {
    em.sendOTPEmail(recipientEmail, otp);
} catch (Exception e) {
    e.printStackTrace(); // Print the stack trace to identify the error
}
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body>
    <h2>Registration Form</h2>
    <form action="" method="post">
        Email: <input type="email" name="email" required><br><br>
        <input type="submit" name="registerButton" value="Register">
    </form>
</body>
</html>