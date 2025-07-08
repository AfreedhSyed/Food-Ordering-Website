package com.quickbite.servlet;


import java.io.IOException;
import java.util.List;

import com.quickbite.daoimplementation.MenuDAOImpl;
import com.quickbite.model.Menu;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Hi from menu servelt...");
		
		
		String restaurantIdStr = req.getParameter("restaurantId");

		if (restaurantIdStr == null || restaurantIdStr.isEmpty() || restaurantIdStr.equals("null")) {
		    System.out.println("❌ restaurantId is missing or invalid!");
		    resp.sendRedirect("home"); // or your fallback page
		    return;
		}

		int restaurantId = Integer.parseInt(restaurantIdStr); // safe now

		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		
		List<Menu> menuByRestaurantId = menuDAOImpl.getMenuByRestaurantId(restaurantId);
		

for(Menu menu : menuByRestaurantId) {
		 System.out.println(menu);
	}
			
		req.setAttribute("menuByRestaurantId", menuByRestaurantId);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("menu.jsp");
			
		requestDispatcher.forward(req, resp);
	}
}