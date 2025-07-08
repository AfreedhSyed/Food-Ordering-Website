package com.quickbite.servlet;


import java.io.IOException;

import com.quickbite.dao.UserDAO;
import com.quickbite.daoimplementation.UserDAOImpl;
import com.quickbite.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/user-registration")
public class UserRegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phonenumber");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		
		User user = new User(name, username, password, email, phonenumber, address, role);
		
		UserDAO udao = new UserDAOImpl();
		
		udao.addUser(user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/login.jsp"); // Only works if inside WebContent
		dispatcher.forward(req, resp);

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.sendRedirect("user_registration.jsp");
	}

}