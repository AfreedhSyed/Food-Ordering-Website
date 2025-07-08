package com.quickbite.servlet;

import java.io.IOException;

import com.quickbite.dao.UserDAO;
import com.quickbite.daoimplementation.UserDAOImpl;
import com.quickbite.model.User; // Ensure this import is correct and User class has getRole()

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // int count = 1; // This variable doesn't seem to be used, can be removed if desired

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("--- LoginServlet: doPost method invoked ---");
        System.out.println("Hi from login servlet");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println("Received email: " + email);
        System.out.println("Received password: " + (password != null ? "******" : "null"));

        HttpSession session = req.getSession();
        Integer attempts = (Integer) session.getAttribute("loginAttempts");

        if (attempts == null) attempts = 0;

        System.out.println("Current login attempts: " + attempts);

        UserDAO udao = new UserDAOImpl();
        System.out.println("⚙️ Loading JDBC Driver...");
        System.out.println("🔌 Connecting to Database...");
        User user = udao.getUserByEmailId(email); // This method should also populate the 'role' in the User object
        System.out.println("✅ Connection established!");

        if (user == null) {
            System.out.println("User not found for email: " + email);
            req.setAttribute("error", "Email not registered. Click on 'register here' to create an account</a>");
            System.out.println("--- Forwarding to login.jsp (User Not Found) ---");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        else if (attempts >= 2) {
            System.out.println("Account locked for email: " + email);
            req.setAttribute("error", "Account locked. Contact admin for support.");
            System.out.println("--- Forwarding to login.jsp (Account Locked) ---");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        else if (!password.equals(user.getPassword())) {
            System.out.println("Incorrect password for email: " + email);
            attempts++;
            session.setAttribute("loginAttempts", attempts);
            int remaining = 3 - attempts;
            String message = ( remaining > 0 ) ? ( String.format("Wrong password! %d attempt%s remaining.", remaining, remaining > 1 ? "s" : "") ) : ( "Last attempt!" );
            req.setAttribute("error", message);
            System.out.println("--- Forwarding to login.jsp (Wrong Password) ---");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        else {
            System.out.println("Login successful for email: " + email);
            // Successful login
            session.setAttribute("userId", user.getUserid());
            session.setAttribute("userAddress", user.getAddress());
            session.setAttribute("user", user); // Store the full User object in session
            session.removeAttribute("loginAttempts");

            // --- MODIFIED LOGIC FOR ROLE-BASED REDIRECTION ---
            String userRole = user.getRole(); // Get the role of the logged-in user

            if ("admin".equalsIgnoreCase(userRole)) { // Check if the user's role is "admin" (case-insensitive)
                System.out.println("User is an ADMIN. Redirecting to admin restaurants page.");
                // Redirect to the AdminRestaurantServlet, which will then display admin_restaurants.jsp
                resp.sendRedirect(req.getContextPath() + "/admin/restaurants"); 
            } else {
                System.out.println("User is a regular USER. Forwarding to home page.");
                // Forward to your HomeServlet (mapped to "/home") for regular users
                req.getRequestDispatcher("home").forward(req, resp); 
            }
            // --- END MODIFIED LOGIC ---
        }
        System.out.println("--- LoginServlet: End of doPost method ---");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("--- LoginServlet: doGet method invoked ---");
        resp.sendRedirect("login.jsp");
    }
}