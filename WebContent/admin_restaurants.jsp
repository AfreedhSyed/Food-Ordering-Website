<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quickbite.model.Restaurant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QuickBite Admin - Manage Restaurants</title>
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

        h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            background: var(--dessert-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 2rem;
            text-align: center;
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

        /* Form Styling */
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
        textarea {
            width: 100%;
            padding: 0.8rem 1rem;
            font-size: 1rem;
            border: 1px solid var(--bg-secondary);
            border-radius: var(--border-radius);
            transition: var(--transition);
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus {
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

        /* Table Styling */
        .restaurant-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
        }

        .restaurant-table th,
        .restaurant-table td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid var(--bg-secondary);
        }

        .restaurant-table th {
            background-color: var(--carrot-orange);
            color: white;
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        .restaurant-table tbody tr:hover {
            background-color: rgba(255, 107, 53, 0.05);
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
            text-decoration: none; /* For links acting as buttons */
            color: white;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .edit-btn {
            background: var(--fresh-gradient);
        }
        .edit-btn:hover {
            background: #0097a7; /* Darker mint */
        }

        .delete-btn {
            background: var(--tomato-red);
        }
        .delete-btn:hover {
            background: #d32f2f; /* Darker red */
        }

        .manage-menu-btn { /* New style for consistency */
            background: var(--mint-green);
        }
        .manage-menu-btn:hover {
            background: #008c9e;
        }

        .no-restaurants {
            text-align: center;
            padding: 2rem;
            color: var(--text-muted);
            font-style: italic;
        }
    </style>
</head>
<body>
    <h1>QuickBite Admin Panel</h1>

    <div class="admin-container">
        <h2 class="section-title">Add New Restaurant</h2>
        <form action="<%= request.getContextPath() %>/admin/restaurants" method="POST">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label for="name">Restaurant Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" required></textarea>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required pattern="[0-9]{10}" title="10-digit phone number">
            </div>
            <div class="form-group">
                <label for="cuisineType">Cuisine Type:</label>
                <input type="text" id="cuisineType" name="cuisineType" placeholder="e.g., Italian, Indian, Chinese" required>
            </div>
            <div class="form-group">
                <label for="eta">Estimated Delivery Time (ETA):</label>
                <input type="text" id="eta" name="eta" placeholder="e.g., 30-45 mins" required>
            </div>
            <div class="form-group">
                <label for="adminUserId">Admin User ID (who owns this restaurant):</label>
                <input type="number" id="adminUserId" name="adminUserId" required>
            </div>
            <div class="form-group">
                <label for="rating">Rating (e.g., 4.5):</label>
                <input type="text" id="rating" name="rating" placeholder="e.g., 4.2" pattern="[0-5](\.[0-9])?" title="Rating between 0 and 5, with one decimal place optional">
            </div>
            <div class="form-group">
                <label for="isActive">Is Active (Yes/No):</label>
                <input type="text" id="isActive" name="isActive" placeholder="Yes or No" required pattern="^(Yes|No|yes|no)$" title="Enter Yes or No">
            </div>
            <div class="form-group">
                <label for="imagePath">Image Path (e.g., Images/restaurant1.jpg):</label>
                <input type="text" id="imagePath" name="imagePath" placeholder="e.g., Images/restaurant1.jpg">
            </div>
            <button type="submit">
                <i class="fas fa-plus-circle"></i> Add Restaurant
            </button>
        </form>
    </div>

    <div class="admin-container">
        <h2 class="section-title">Existing Restaurants</h2>
        <table class="restaurant-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Cuisine</th>
                    <th>ETA</th>
                    <th>Rating</th>
                    <th>Active</th>
                    <th>Actions</th>
                    <th>Menu Actions</th> </tr>
            </thead>
            <tbody>
                <% 
                    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurantList");
                    if (restaurants != null && !restaurants.isEmpty()) {
                        for (Restaurant restaurant : restaurants) {
                %>
                <tr>
                    <td><%= restaurant.getRestaurantId() %></td>
                    <td><%= restaurant.getName() %></td>
                    <td><%= restaurant.getAddress() %></td>
                    <td><%= restaurant.getPhone() %></td>
                    <td><%= restaurant.getCusineType() %></td>
                    <td><%= restaurant.getEta() %></td>
                    <td><%= restaurant.getRating() %></td>
                    <td><%= restaurant.getActive() %></td>
                    <td class="action-buttons">
                        <a href="<%= request.getContextPath() %>/admin/restaurants?action=edit&id=<%= restaurant.getRestaurantId() %>" class="edit-btn">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <form action="<%= request.getContextPath() %>/admin/restaurants" method="POST" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>">
                            <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete <%= restaurant.getName() %>?');">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </form>
                    </td>
                    <td>
                        <a href="<%= request.getContextPath() %>/admin/menu?restaurantId=<%= restaurant.getRestaurantId() %>" class="action-buttons manage-menu-btn">
                            <i class="fas fa-bars"></i> Manage Menu
                        </a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="10" class="no-restaurants">No restaurants available. Add one above!</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>