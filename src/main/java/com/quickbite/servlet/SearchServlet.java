package com.quickbite.servlet;

import java.io.IOException;
import java.util.List;

import com.quickbite.dao.RestaurantDAO;
import com.quickbite.daoimplementation.RestaurantDAOImpl;
import com.quickbite.model.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String searchQuery = req.getParameter("searchQuery");
	    RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
	    List<Restaurant> restaurants;

	    if (searchQuery == null || searchQuery.trim().isEmpty()) {
	        System.out.println("No search query provided. Fetching all restaurants.");
	        restaurants = restaurantDAO.getAllRestaurants();
	    } else {
	        System.out.println("Searching for restaurants with query: '" + searchQuery + "'");
	        restaurants = restaurantDAO.searchRestaurants(searchQuery);
	    }

	    // FIX IS HERE: Changed attribute name from "allRestaurants" to "restaurantList"
	    req.setAttribute("restaurantList", restaurants); // This matches what home.jsp expects!
	    System.out.println("🔍 Search results count: " + (restaurants != null ? restaurants.size() : "0"));

	    RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
	    rd.forward(req, resp);
	}
}