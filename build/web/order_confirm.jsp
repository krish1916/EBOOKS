<%@page import="com.entity.Book_Details"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%
String username1 = request.getParameter("username");
String email1 = request.getParameter("email");
String phno1 = request.getParameter("phno");
String address1 = request.getParameter("address");

User u = (User) session.getAttribute("userobj");

CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

List<Cart> blist = dao.getBookByUser(u.getId());

OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getConn());
BookDAOImpl daox = new BookDAOImpl(DBConnect.getConn());
Book_Order o = null;

ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
Random r = new Random();
for (Cart c : blist) {
	o = new Book_Order();
	Book_Details b = daox.getBookById(c.getBid());
	o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
	o.setUserName(username1);
	o.setEmail(email1);
	o.setPhno(phno1);
	o.setFulladd(address1);
	o.setBookName(c.getBook_name());
	o.setAuthor(c.getAuthor());
	o.setPrice(c.getPrice() + "");
	o.setPaymentType("Online Payment");
        o.setBookCategory(c.getBookc());
	//o.setIsbn(b.getIsbn());
	orderList.add(o);

}

boolean f = dao2.saveOrder(orderList);

if (f) {
	response.sendRedirect("order_success.jsp");
} else {
	session.setAttribute("failedMsg", "Your Order Failed");
	response.sendRedirect("cart.jsp");
}
%>