<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.quickbite.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>QuickBite - Discover Restaurants</title>
  <link rel="icon" type="image/png" href="Images/online-order.png" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Poppins:wght@400;600;700&display=swap');

    :root {
      --primary: #ff6b35;
      --secondary: #f7931e;
      --accent: #4caf50;
      --warning: #ffc107;
      --background: #fff8f0;
      --surface: #fff;
      --text-primary: #222;
      --text-secondary: #666;
      --text-muted: #aaa;
      --border-radius: 18px;
      --shadow: 0 4px 24px rgba(255, 107, 53, 0.10);
      --transition: all 0.2s cubic-bezier(.4,0,.2,1);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Inter', 'Poppins', Arial, sans-serif;
      background: var(--background);
      color: var(--text-primary);
      min-height: 100vh;
      line-height: 1.6;
    }

    /* NAVBAR */
    .navbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1.2rem 3vw;
      background: linear-gradient(90deg, var(--primary), var(--secondary));
      box-shadow: var(--shadow);
      position: sticky;
      top: 0;
      z-index: 100;
    }
    .logo {
      font-family: 'Poppins', sans-serif;
      font-size: 2.2rem;
      font-weight: 700;
      color: #fff;
      letter-spacing: -1px;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    .logo::before {
      content: '🍕';
      font-size: 1.5rem;
    }

    .search-container {
      flex: 1;
      max-width: 500px;
      margin: 0 2vw;
      position: relative;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .search-bar {
      width: 100%;
      padding: 0.95rem 3.2rem 0.95rem 1.5rem;
      border-radius: 999px;
      border: none;
      font-size: 1.08rem;
      background: rgba(255,255,255,0.55);
      color: var(--text-primary);
      box-shadow: 0 4px 24px rgba(255, 107, 53, 0.10), 0 1.5px 8px rgba(76,175,80,0.07);
      transition: var(--transition);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      outline: none;
      font-family: inherit;
      font-weight: 500;
      letter-spacing: 0.01em;
    }
    .search-bar::placeholder {
      color: #bdbdbd;
      font-weight: 400;
      opacity: 1;
      letter-spacing: 0.01em;
    }
    .search-bar:focus {
      background: rgba(255,255,255,0.85);
      box-shadow: 0 0 0 4px rgba(255, 107, 53, 0.13), 0 4px 24px rgba(255, 107, 53, 0.13);
      border: 1.5px solid var(--primary);
    }
    .search-button {
      position: absolute;
      right: 0.5rem;
      top: 50%;
      transform: translateY(-50%);
      background: linear-gradient(135deg, var(--primary), var(--accent));
      border: none;
      width: 44px;
      height: 44px;
      border-radius: 50%;
      color: #fff;
      font-size: 1.25rem;
      cursor: pointer;
      transition: var(--transition);
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 2px 8px rgba(255, 107, 53, 0.13);
      outline: none;
      border: 2px solid transparent;
    }
    .search-button:hover, .search-button:focus {
      background: linear-gradient(135deg, var(--accent), var(--primary));
      box-shadow: 0 4px 16px rgba(76,175,80,0.18);
      border: 2px solid var(--accent);
      color: #fff;
      transform: translateY(-50%) scale(1.08);
    }

    .nav-buttons {
      display: flex;
      gap: 1rem;
    }
    .nav-btn {
      background: rgba(255,255,255,0.12);
      color: #fff;
      padding: 0.7rem 1.4rem;
      border-radius: var(--border-radius);
      text-decoration: none;
      font-weight: 600;
      font-size: 1rem;
      border: 1px solid rgba(255,255,255,0.18);
      transition: var(--transition);
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    .nav-btn:hover {
      background: #fff;
      color: var(--primary);
      border-color: var(--primary);
    }

    /* MAIN CONTAINER */
    .container {
      max-width: 1200px;
      margin: 3rem auto;
      padding: 0 2vw;
    }

    /* CARD GRID */
    .card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 2rem;
    }
    .card {
      background: var(--surface);
      border-radius: var(--border-radius);
      box-shadow: var(--shadow);
      overflow: hidden;
      text-decoration: none;
      color: inherit;
      display: flex;
      flex-direction: column;
      transition: var(--transition);
      border: 1px solid #f3f3f3;
      position: relative;
    }
    .card:hover {
      transform: translateY(-8px) scale(1.02);
      box-shadow: 0 8px 32px rgba(255, 107, 53, 0.18);
    }
    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      transition: var(--transition);
    }
    .card-content {
      padding: 1.3rem 1.2rem 1.2rem 1.2rem;
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .card h3 {
      font-family: 'Poppins', sans-serif;
      font-size: 1.3rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
      color: var(--primary);
    }
    .card p {
      font-size: 1rem;
      color: var(--text-secondary);
      margin-bottom: 0.3rem;
    }
    .meta {
      font-size: 0.92rem;
      color: var(--text-muted);
      display: flex;
      align-items: center;
      gap: 0.4rem;
    }
    .rating-container {
      display: flex;
      align-items: center;
      gap: 0.4rem;
      margin-top: 0.7rem;
    }
    .rating-star {
      color: var(--warning);
      font-size: 1.1rem;
    }
    .rating-text {
      font-weight: 600;
      color: var(--text-primary);
    }
    .status-badge {
      position: absolute;
      top: 1rem;
      right: 1rem;
      padding: 0.3rem 0.9rem;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 600;
      text-transform: uppercase;
      background: var(--accent);
      color: #fff;
      box-shadow: 0 2px 8px rgba(76,175,80,0.10);
    }
    .status-badge.inactive {
      background: var(--primary);
      opacity: 0.7;
    }

    /* EMPTY STATE */
    .empty-state {
      text-align: center;
      padding: 4rem 2rem;
      background: #fff;
      border-radius: var(--border-radius);
      box-shadow: var(--shadow);
      border: 2px dashed var(--primary);
    }
    .empty-state h3 {
      font-size: 1.3rem;
      color: var(--text-secondary);
      margin-bottom: 1rem;
      font-weight: 600;
    }
    .empty-state .emoji {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      display: block;
    }

    /* BUTTONS */
    button, .btn {
      background: var(--primary);
      color: #fff;
      border: none;
      border-radius: var(--border-radius);
      padding: 0.8rem 1.6rem;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      box-shadow: 0 2px 8px rgba(255, 107, 53, 0.08);
    }
    button:hover, .btn:hover {
      background: var(--accent);
      color: #fff;
    }

    /* FORMS */
    input, select, textarea {
      border: 1px solid #e0e0e0;
      border-radius: var(--border-radius);
      padding: 0.8rem 1rem;
      font-size: 1rem;
      margin-bottom: 1rem;
      width: 100%;
      background: #fff;
      color: var(--text-primary);
      transition: var(--transition);
    }
    input:focus, select:focus, textarea:focus {
      outline: 2px solid var(--primary);
    }

    /* RESPONSIVE DESIGN */
    @media (max-width: 1024px) {
      .navbar {
        flex-direction: column;
        gap: 1rem;
        padding: 1rem 2vw;
      }
      .container {
        margin: 2rem auto;
        padding: 0 1vw;
      }
      .card-grid {
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 1.2rem;
      }
    }
    @media (max-width: 600px) {
      .navbar {
        flex-direction: column;
        gap: 0.7rem;
        padding: 0.7rem 1vw;
      }
      .logo {
        font-size: 1.3rem;
      }
      .container {
        margin: 1rem auto;
        padding: 0 0.5vw;
      }
      .card-grid {
        grid-template-columns: 1fr;
        gap: 0.7rem;
      }
      .card img {
        height: 140px;
      }
    }

    /* ANIMATIONS */
    .card, .nav-btn, .search-bar, button, .btn {
      transition: var(--transition);
    }

    ::-webkit-scrollbar {
      width: 8px;
    }
    ::-webkit-scrollbar-thumb {
      background: var(--primary);
      border-radius: 4px;
    }
    ::-webkit-scrollbar-track {
      background: #f3f3f3;
    }

    html {
      scroll-behavior: smooth;
    }

    /* Animated Gradient Background */
    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      z-index: -1;
      background: linear-gradient(270deg, #ffecd2, #fcb69f, #ff6b35, #f7931e, #fff8f0, #4caf50, #ffc107);
      background-size: 400% 400%;
      animation: gradientBG 18s ease-in-out infinite;
      opacity: 0.25;
    }

    @keyframes gradientBG {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }
  </style>
</head>

<body>
  <!-- FLOATING FOOD ICONS BACKGROUND -->
  <!--
  <div class="floating-food">
    <div class="food-icon">🍕</div>
    <div class="food-icon">🍔</div>
    <div class="food-icon">🍜</div>
    <div class="food-icon">🍣</div>
    <div class="food-icon">🍰</div>
    <div class="food-icon">🥗</div>
    <div class="food-icon">🍟</div>
    <div class="food-icon">🌮</div>
    <div class="food-icon">🍦</div>
    <div class="food-icon">🥪</div>
  </div>
  -->

  <!-- NAVIGATION BAR -->
  <nav class="navbar">
    <div class="logo">QuickBite</div>
    <div class="search-container">
      <form action="SearchServlet" method="POST">
        <input type="text" name="searchQuery" class="search-bar" placeholder="Search for restaurants, cuisines, or locations...">
        <button type="submit" class="search-button">
          <i class="fas fa-search"></i>
        </button>
      </form>
    </div>
    <div class="nav-buttons">
      <a class="nav-btn" href="login.jsp">
        <i class="fas fa-sign-in-alt"></i>
        Sign In
      </a>
      <a class="nav-btn" href="cart.jsp">
        <i class="fas fa-shopping-cart"></i>
        Cart
      </a>
    </div>
  </nav>

  <!-- CONTENT -->
  <div class="container">
    <div class="card-grid">
     
<%
    List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("restaurantList");
%>

<% if (allRestaurants == null || allRestaurants.isEmpty()) { %>
    <div class="empty-state">
        <span class="emoji">🍽️</span>
        <h3>No restaurants available at the moment</h3>
        <p>We're working hard to bring you the best dining experiences. Please check back soon!</p>
    </div>
<% } else { 
     for (Restaurant restaurant : allRestaurants) {
%>
    <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>" class="card">
        <div class="status-badge <%= restaurant.getActive().equalsIgnoreCase("active") ? "" : "inactive" %>">
            <%= restaurant.getActive() %>
        </div>
        <img src="<%= restaurant.getImagePath() %>" alt="<%= restaurant.getName() %>">
        <div class="card-content">
            <h3><%= restaurant.getName() %></h3>
            <p><i class="fas fa-map-marker-alt"></i> <%= restaurant.getAddress() %></p>
            <p class="meta"><i class="fas fa-utensils"></i> <%= restaurant.getCusineType() %></p>
            <p class="meta"><i class="fas fa-clock"></i> ETA: <%= restaurant.getEta() %></p>
            <div class="rating-container">
                <span class="rating-star">★</span>
                <span class="rating-text"><%= restaurant.getRating() %></span>
            </div>
        </div>
    </a>
<%   } 
} %>
    </div>
  </div>
</body>
</html>