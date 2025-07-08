package com.quickbite.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


import java.io.IOException;
import java.sql.Timestamp;

import com.quickbite.dao.OrderDAO;
import com.quickbite.daoimplementation.OrderDAOImpl;
import com.quickbite.daoimplementation.OrderItemDAOImpl;
import com.quickbite.model.Cart;
import com.quickbite.model.CartItem;
import com.quickbite.model.Order;
import com.quickbite.model.OrderItem;
import com.quickbite.model.User;



@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
	private OrderDAO orderDAO;
	
	@Override
	public void init() throws ServletException {
		orderDAO = new OrderDAOImpl();
	}
	
	
	//
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		User user = (User)session.getAttribute("user");
		
//		if(user==null) {
//			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
//			rd.forward(req, resp);
//		}
		
		if(cart!=null && user!=null && !cart.getItems().isEmpty()) {
			//Extract form data
			String paymentmode = req.getParameter("payment");
			String address = (String)session.getAttribute("userAddress");
			
			
			//Create and populate order object
			Order order = new Order();
			order.setUserId(user.getUserid());
			order.setRestaurantId( (int)session.getAttribute("restaurantId") );
			order.setOrderDate(new Timestamp(System.currentTimeMillis()));
			order.setPaymentMode(paymentmode);
//			order.setDeliveryAddress(address);
			order.setStatus("Confirmed");
			order.setTotalAmount((int)cart.getGrandTotal());
			
			
			//Calculate total amount
			int totalAmount=0;
			for(CartItem item : cart.getItems().values())
			{
				totalAmount += item.getPrice() * item.getQuantity();
			}
			
			order.setTotalAmount(totalAmount);
			
			
			
			int orderId = orderDAO.addOrder(order);
			
			for(CartItem item : cart.getItems().values()) 
			{
				int orderItemId = item.getItemId();
				int quantity = item.getQuantity();
				int totalPrice = (int)item.getTotalprice();
				int menuId=item.getMenuId();
				
				
				OrderItem orderitem = new OrderItem(orderItemId, orderId,menuId,quantity,totalPrice);
				
				OrderItemDAOImpl orderI;
				orderI = new OrderItemDAOImpl();
				orderI.addOrderItem(orderitem);
			}
			
			session.removeAttribute("cart"); //Clear the cart
			session.setAttribute("order", order);
			
			resp.sendRedirect("order_confirmation.jsp");
		}
		else {
			resp.sendRedirect("cart.jsp"); //Redirect if cart is empty or user is not logged in
		}
	}
}