<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quickbite.model.Menu, com.quickbite.model.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QuickBite Admin - Manage Menu</title>
    <link type="image/png" rel="icon" href="<%= request.getContextPath() %>/Images/online-order.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800&display=swap');

        :root {
            --primary-gradient: linear-gradient(135deg, #ff6b35 0%, #f7931e 100%);
            --secondary-gradient: linear-gradient(135deg, #ff8a80 0%, #ff5722 100%);
            --accent-gradient: linear-gradient(135deg, #4caf50 0%, #8bc34a 100%);
            --success-gradient: linear-gradient(135deg, #4caf50 0%, #66bb6a 100%);
            --warning-gradient: linear-gradient(135deg, #ff9800 0%, #ffc107 100%);
            --dessert-gradient: linear-gradient(135deg, #e91e63 0%, #f06292 100%);
            --spice-gradient: linear-gradient(135deg, #795548 0%, #8d6e63 100%);
            --fresh-gradient: linear-gradient(135deg, #00bcd4 0%, #26c6da 100%);
            
            --tomato-red: #ff5722;
            --carrot-orange: #ff6b35;
            --sunset-yellow: #ffc107;
            --lettuce-green: #4caf50;
            --mint-green: #00bcd4;
            --berry-purple: #9c27b0;
            --chocolate-brown: #795548;
            --cream-white: #fff8e1;
            --warm-beige: #f5f5dc;
            --deep-charcoal: #424242;
            
            --glass-bg: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.25);
            
            --shadow-light: 0 8px 32px rgba(255, 107, 53, 0.15);
            --shadow-medium: 0 12px 40px rgba(255, 107, 53, 0.25);
            --shadow-heavy: 0 20px 60px rgba(255, 107, 53, 0.35);
            
            --text-primary: #424242;
            --text-secondary: #616161;
            --text-muted: #9e9e9e;
            
            --bg-primary: #fff8e1;
            --bg-secondary: #f5f5dc;
            
            --border-radius: 16px;
            --border-radius-lg: 24px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            line-height: 1.6;
            padding: 2rem;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            max-width: 1200px;
            margin-bottom: 2rem;
        }

        h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            background: var(--dessert-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            flex-grow: 1; /* Allow h1 to take available space */
        }

        .back-button {
            background: var(--chocolate-brown);
            color: white;
            padding: 0.7rem 1.2rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-button:hover {
            background: #6D4C41; /* Darker brown */
            transform: translateY(-2px);
        }

        .admin-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            padding: 2.5rem;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-heavy);
            border: 1px solid var(--glass-border);
            width: 100%;
            max-width: 1200px; /* Enlarged for full menu bar */
            margin-bottom: 2rem;
        }

        .section-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.8rem;
            color: var(--chocolate-brown);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--bg-secondary);
        }

        /* Form Styling (reused from admin_restaurants.jsp) */
        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            font-size: 0.95rem;
            color: var(--text-primary);
        }

        input[type="text"],
        input[type="number"],
        textarea,
        select { /* Added select for Is Available */
            width: 100%;
            padding: 0.8rem 1rem;
            font-size: 1rem;
            border: 1px solid var(--bg-secondary);
            border-radius: var(--border-radius);
            transition: var(--transition);
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus,
        select:focus {
            border-color: var(--carrot-orange);
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        button[type="submit"] {
            background: var(--success-gradient);
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
        }

        button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-light);
        }

        /* Table Styling (reused from admin_restaurants.jsp) */
        .menu-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
        }

        .menu-table th,
        .menu-table td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid var(--bg-secondary);
        }

        .menu-table th {
            background-color: var(--lettuce-green); /* Different color for menu table header */
            color: white;
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        .menu-table tbody tr:hover {
            background-color: rgba(76, 175, 80, 0.05); /* Lighter green on hover */
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .action-buttons button,
        .action-buttons a {
            padding: 8px 12px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-size: 0.85rem;
            font-weight: 500;
            transition: var(--transition);
            text-decoration: none;
            color: white;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .edit-btn {
            background: var(--fresh-gradient);
        }
        .edit-btn:hover {
            background: #0097a7;
        }

        .delete-btn {
            background: var(--tomato-red);
        }
        .delete-btn:hover {
            background: #d32f2f;
        }

        .no-menu-items {
            text-align: center;
            padding: 2rem;
            color: var(--text-muted);
            font-style: italic;
        }
    </style>
</head>
<body>
    <% 
        // Retrieve the restaurant object passed from AdminMenuServlet
        Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
        List<Menu> menuItems = (List<Menu>) request.getAttribute("menuList");
        
        // Default values if restaurant is not found (shouldn't happen with proper flow)
        int restaurantId = (restaurant != null) ? restaurant.getRestaurantId() : 0;
        String restaurantName = (restaurant != null) ? restaurant.getName() : "Unknown Restaurant";
    %>

    <div class="header-section">
        <a href="<%= request.getContextPath() %>/admin/restaurants" class="back-button">
            <i class="fas fa-arrow-left"></i> Back to Restaurants
        </a>
        <h1>Manage Menu for <%= restaurantName %></h1>
        <div></div> <!-- Spacer to push title to center -->
    </div>

    <div class="admin-container">
        <h2 class="section-title">Add New Menu Item</h2>
        <form action="<%= request.getContextPath() %>/admin/menu" method="POST">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">

            <div class="form-group">
                <label for="itemName">Item Name:</label>
                <input type="text" id="itemName" name="itemName" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" min="0" required>
            </div>
            <div class="form-group">
                <label for="imagePath">Image Path (e.g., Images/pizza.jpg):</label>
                <input type="text" id="imagePath" name="imagePath" placeholder="e.g., Images/pizza.jpg">
            </div>
            <div class="form-group">
                <label for="isAvailable">Is Available:</label>
                <select id="isAvailable" name="isAvailable" required>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>
            <button type="submit">
                <i class="fas fa-plus-circle"></i> Add Menu Item
            </button>
        </form>
    </div>

    <div class="admin-container">
        <h2 class="section-title">Existing Menu Items</h2>
        <table class="menu-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Available</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (menuItems != null && !menuItems.isEmpty()) {
                        for (Menu menuItem : menuItems) {
                %>
                <tr>
                    <td><%= menuItem.getMenuId() %></td>
                    <td><%= menuItem.getItemName() %></td>
                    <td><%= menuItem.getDescription() %></td>
                    <td>₹<%= String.format("%.2f", menuItem.getPrice()) %></td>
                    <td><%= menuItem.getAvailable() %></td>
                    <td><%= menuItem.getImagePath() != null && !menuItem.getImagePath().isEmpty() ? "<a href='" + request.getContextPath() + "/" + menuItem.getImagePath() + "' target='_blank'>View Image</a>" : "N/A" %></td>
                    <td class="action-buttons">
                        <a href="<%= request.getContextPath() %>/admin/menu?action=edit&menuId=<%= menuItem.getMenuId() %>&restaurantId=<%= restaurantId %>" class="edit-btn">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <form action="<%= request.getContextPath() %>/admin/menu" method="POST" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="menuId" value="<%= menuItem.getMenuId() %>">
                            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                            <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete <%= menuItem.getItemName() %>?');">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="no-menu-items">No menu items found for this restaurant. Add one above!</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>