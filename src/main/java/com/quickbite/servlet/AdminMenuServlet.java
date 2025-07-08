package com.quickbite.servlet;

import java.io.IOException;
import java.util.List;

import com.quickbite.dao.MenuDAO;
import com.quickbite.dao.RestaurantDAO; // Needed to get restaurant details
import com.quickbite.daoimplementation.MenuDAOImpl;
import com.quickbite.daoimplementation.RestaurantDAOImpl;
import com.quickbite.model.Menu;
import com.quickbite.model.Restaurant; // Needed for restaurant name

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // For admin session check

@WebServlet("/admin/menu")
public class AdminMenuServlet extends HttpServlet {

    private MenuDAO menuDAO;
    private RestaurantDAO restaurantDAO; // To fetch restaurant details for the menu page

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImpl();
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- Basic Admin Authentication Check (Placeholder) ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null /* || !isAdmin(session.getAttribute("user")) */) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        // --- End of Auth Check Placeholder ---

        String restaurantIdStr = request.getParameter("restaurantId");
        int restaurantId = 0;

        if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
            try {
                restaurantId = Integer.parseInt(restaurantIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid restaurantId in AdminMenuServlet doGet: " + restaurantIdStr);
                response.sendRedirect(request.getContextPath() + "/admin/restaurants?error=invalid_restaurant_id");
                return;
            }
        } else {
            // If no restaurantId is provided, redirect back to the main restaurant management page
            response.sendRedirect(request.getContextPath() + "/admin/restaurants?error=no_restaurant_selected");
            return;
        }

        // Fetch the specific restaurant details (to display its name on the menu page)
        Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
        if (restaurant == null) {
            response.sendRedirect(request.getContextPath() + "/admin/restaurants?error=restaurant_not_found");
            return;
        }
        request.setAttribute("restaurant", restaurant); // Set restaurant object for JSP

        // Fetch all menu items for this specific restaurant
        List<Menu> menuItems = menuDAO.getMenuByRestaurantId(restaurantId); // Assuming you have this method in MenuDAOImpl
        request.setAttribute("menuList", menuItems); // This name matches admin_menu.jsp

        // Forward to the menu management JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_menu.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // --- Basic Admin Authentication Check (Placeholder) ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null /* || !isAdmin(session.getAttribute("user")) */) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        // --- End of Auth Check Placeholder ---

        String action = request.getParameter("action");
        // Get restaurantId from the request parameter, this is the one we should use
        String restaurantIdStr = request.getParameter("restaurantId"); 
        int restaurantId = 0;

        if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
            try {
                restaurantId = Integer.parseInt(restaurantIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid restaurantId for POST action: " + restaurantIdStr);
                response.sendRedirect(request.getContextPath() + "/admin/restaurants?error=invalid_restaurant_id_post");
                return;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/restaurants?error=no_restaurant_id_for_action");
            return;
        }

        if (action != null) {
            switch (action) {
                case "add":
                    addMenuItem(request, response, restaurantId); // Pass the correct restaurantId
                    break;
                case "delete":
                    deleteMenuItem(request, response, restaurantId); // Pass the correct restaurantId
                    break;
                // case "edit": // We'll implement this if desired after add/delete are working
                //     editMenuItem(request, response, restaurantId);
                //     break;
                default:
                    response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&error=unknown_action");
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId);
        }
    }

    private void addMenuItem(HttpServletRequest request, HttpServletResponse response, int restaurantId)
            throws ServletException, IOException {
        try {
            // Retrieve parameters from the form (matching admin_menu.jsp fields)
            String itemName = request.getParameter("itemName");
            String description = request.getParameter("description");
            // CORRECTED: Parse price as float
            float price = Float.parseFloat(request.getParameter("price")); 
            String imagePath = request.getParameter("imagePath");
            String isAvailable = request.getParameter("isAvailable");

            // CORRECTED: menuId is auto-generated by the database for new items.
            // Do NOT try to parse it from the request. Use 0 as a placeholder.
            int menuIdForNewItem = 0; 
            
            // CORRECTED: ratings is not in the admin_menu.jsp form.
            // Assign a default value (e.g., 0.0f) as per your Menu model's float type.
            float defaultRatings = 0.0f; 

            // Create a new Menu object using your Menu model's 8-argument constructor.
            // The order here MUST match your Menu constructor:
            // Menu(int menuId, int restaurantId, String itemName, String description, float price, float ratings, String isAvailable, String imagePath)
            Menu newMenuItem = new Menu(menuIdForNewItem,  // 0 for auto-generated ID
                                        restaurantId,      // Use the restaurantId passed as method parameter
                                        itemName,
                                        description,
                                        price,
                                        defaultRatings,    // Default value for ratings
                                        isAvailable,
                                        imagePath);
            
            // Call the DAO to add the menu item
            menuDAO.addMenu(newMenuItem);
            
            // Redirect back to the menu page for this restaurant (Post-Redirect-Get pattern)
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&message=add_menu_success");
        } catch (NumberFormatException e) {
            // Catch specific error for number parsing issues (e.g., price not a number)
            System.err.println("Error parsing number for addMenuItem: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&error=invalid_menu_input");
        } catch (Exception e) {
            // Catch any other unexpected errors during the add process
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&error=add_menu_failed");
        }
    }

    private void deleteMenuItem(HttpServletRequest request, HttpServletResponse response, int restaurantId)
            throws ServletException, IOException {
        try {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            
            // Call the DAO to delete the menu item
            menuDAO.deleteMenu(menuId);
            
            // Redirect back to the menu page for this restaurant (Post-Redirect-Get)
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&message=delete_menu_success");
        } catch (NumberFormatException e) {
            System.err.println("Error parsing menuId for deleteMenuItem: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&error=invalid_menu_id");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/menu?restaurantId=" + restaurantId + "&error=delete_menu_failed");
        }
    }
}