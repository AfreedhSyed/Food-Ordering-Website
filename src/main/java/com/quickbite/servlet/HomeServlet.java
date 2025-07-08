package com.quickbite.servlet;

import java.io.IOException;
import java.util.List;

import com.quickbite.daoimplementation.RestaurantDAOImpl;
import com.quickbite.model.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override // Add this method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("--- HomeServlet: doPost method invoked (Forwarded from Login) ---");
        // Typically, if your home page logic is the same for GET and forwarded POST,
        // you can just call doGet here.
        doGet(request, response);
    }

    @Override // This annotation is good practice
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("--- HomeServlet: doGet method invoked ---"); // Added for more clarity in logs

        List<Restaurant> restaurantList = new RestaurantDAOImpl().getAllRestaurants();

        // DEBUG LOGGING
        System.out.println("🔍 [DEBUG] Total restaurants fetched: " + (restaurantList != null ? restaurantList.size() : "null"));
        if (restaurantList != null) {
            for (Restaurant r : restaurantList) {
                System.out.println("➡️ Restaurant: " + r.getName());
            }
        }

        request.setAttribute("restaurantList", restaurantList);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}