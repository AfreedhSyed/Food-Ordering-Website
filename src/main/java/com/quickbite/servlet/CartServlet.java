package com.quickbite.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.quickbite.dao.MenuDAO;
import com.quickbite.daoimplementation.MenuDAOImpl;
import com.quickbite.model.Cart;
import com.quickbite.model.CartItem;
import com.quickbite.model.Menu;



@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
		HttpSession session = req.getSession(false);
        

        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        
   
        //
        Cart cart = (Cart)session.getAttribute("cart");
        Integer oldRestaurantId = (Integer)session.getAttribute("restaurantId");
        
        int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        
        if (cart != null && oldRestaurantId != null && oldRestaurantId != newRestaurantId) {
            session.removeAttribute("cart");
            cart = null;
        }
        
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", newRestaurantId);
        }
        
        
        String action = req.getParameter("action");
        
        
        try {
            if (action.equals("add")) 
            {
                addItemToCart(req, cart, newRestaurantId);
            } 
            else if (action.equals("update")) 
            {
                updateCartItem(req, cart);
            } 
            else if (action.equals("remove")) 
            {
                removeCartItem(req, cart);
            }
            
            
            session.setAttribute("cart", cart);
            resp.sendRedirect("cart.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }

	
	
	//
    private void addItemToCart(HttpServletRequest req, Cart cart, int restaurantId) throws Exception {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        
        MenuDAO menuDAO = new MenuDAOImpl();
        Menu menuItem = menuDAO.getMenuById(menuId);
        
        // Create CartItem matching your constructor
        CartItem item = new CartItem(menuId,restaurantId,menuItem.getItemName(),quantity,menuItem.getPrice(),quantity * menuItem.getPrice());
        
        cart.getItems().put(menuId, item);
    }

    
    //
    private void updateCartItem(HttpServletRequest req, Cart cart) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        int newQuantity = Integer.parseInt(req.getParameter("quantity"));
        
        CartItem item = cart.getItems().get(itemId);
        if (item != null) {
            if (newQuantity <= 0) {
                cart.getItems().remove(itemId);
            } else {
                item.setQuantity(newQuantity);
                item.setTotalprice(newQuantity * item.getPrice());
            }
        }
    }

    
    //
    private void removeCartItem(HttpServletRequest req, Cart cart) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        cart.getItems().remove(itemId);
    }		

}

//cart error:
//1.The error happened because session.getAttribute("userId") was null.
//2. You must always check if user is logged in before doing cart operations.
//3. After login, store userId in session using session.setAttribute("userId", userId).
//4.In CartServlet, add a null check to prevent errors.
//5. Now the flow will work smoothly — if not logged in, user will be redirected to login.