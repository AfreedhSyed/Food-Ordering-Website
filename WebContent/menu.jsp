<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quickbite.model.Menu, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>QuickBite - View Menu</title>
  <link rel="icon" type="image/png" href="Images/online-order.png" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800&display=swap');

    :root {
      /* Food-Inspired Gradients */
      --primary-gradient: linear-gradient(135deg, #ff6b35 0%, #f7931e 100%);
      --secondary-gradient: linear-gradient(135deg, #ff8a80 0%, #ff5722 100%);
      --accent-gradient: linear-gradient(135deg, #4caf50 0%, #8bc34a 100%);
      --success-gradient: linear-gradient(135deg, #4caf50 0%, #66bb6a 100%);
      --warning-gradient: linear-gradient(135deg, #ff9800 0%, #ffc107 100%);
      --dessert-gradient: linear-gradient(135deg, #e91e63 0%, #f06292 100%);
      --spice-gradient: linear-gradient(135deg, #795548 0%, #8d6e63 100%);
      --fresh-gradient: linear-gradient(135deg, #00bcd4 0%, #26c6da 100%);
      
      /* Food Color Palette */
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
      
      /* Glass Effects */
      --glass-bg: rgba(255, 255, 255, 0.15);
      --glass-border: rgba(255, 255, 255, 0.25);
      
      /* Shadows with Food Tones */
      --shadow-light: 0 8px 32px rgba(255, 107, 53, 0.15);
      --shadow-medium: 0 12px 40px rgba(255, 107, 53, 0.25);
      --shadow-heavy: 0 20px 60px rgba(255, 107, 53, 0.35);
      
      /* Text Colors */
      --text-primary: #424242;
      --text-secondary: #616161;
      --text-muted: #9e9e9e;
      
      /* Background Colors */
      --bg-primary: #fff8e1;
      --bg-secondary: #f5f5dc;
      
      /* Border Radius */
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
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      background: var(--bg-primary);
      color: var(--text-primary);
      line-height: 1.6;
      overflow-x: hidden;
      position: relative;
    }

    /* Floating Food Icons Background */
    .floating-food {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: -1;
      overflow: hidden;
    }

    .food-icon {
      position: absolute;
      font-size: 2rem;
      opacity: 0.1;
      animation: float 6s ease-in-out infinite;
    }

    .food-icon:nth-child(1) {
      top: 10%;
      left: 10%;
      animation-delay: 0s;
      font-size: 1.5rem;
    }

    .food-icon:nth-child(2) {
      top: 20%;
      right: 15%;
      animation-delay: 1s;
      font-size: 2.5rem;
    }

    .food-icon:nth-child(3) {
      top: 60%;
      left: 5%;
      animation-delay: 2s;
      font-size: 1.8rem;
    }

    .food-icon:nth-child(4) {
      top: 40%;
      right: 5%;
      animation-delay: 3s;
      font-size: 2.2rem;
    }

    .food-icon:nth-child(5) {
      top: 80%;
      right: 20%;
      animation-delay: 4s;
      font-size: 1.6rem;
    }

    .food-icon:nth-child(6) {
      top: 30%;
      left: 20%;
      animation-delay: 5s;
      font-size: 2rem;
    }

    .food-icon:nth-child(7) {
      top: 70%;
      left: 30%;
      animation-delay: 1.5s;
      font-size: 1.4rem;
    }

    .food-icon:nth-child(8) {
      top: 15%;
      left: 50%;
      animation-delay: 2.5s;
      font-size: 2.3rem;
    }

    .food-icon:nth-child(9) {
      top: 85%;
      left: 60%;
      animation-delay: 3.5s;
      font-size: 1.7rem;
    }

    .food-icon:nth-child(10) {
      top: 50%;
      right: 30%;
      animation-delay: 4.5s;
      font-size: 1.9rem;
    }

    @keyframes float {
      0%, 100% {
        transform: translateY(0px) rotate(0deg);
        opacity: 0.1;
      }
      25% {
        transform: translateY(-20px) rotate(5deg);
        opacity: 0.15;
      }
      50% {
        transform: translateY(-10px) rotate(-3deg);
        opacity: 0.2;
      }
      75% {
        transform: translateY(-15px) rotate(2deg);
        opacity: 0.12;
      }
    }

    /* Custom Scrollbar */
    ::-webkit-scrollbar {
      width: 8px;
    }

    ::-webkit-scrollbar-track {
      background: var(--bg-secondary);
    }

    ::-webkit-scrollbar-thumb {
      background: var(--primary-gradient);
      border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
      background: var(--dessert-gradient);
    }

    /* Navbar Styles */
    .navbar {
      position: relative;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1.5rem 3rem;
      background: var(--primary-gradient);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      border-bottom: 1px solid var(--glass-border);
      box-shadow: var(--shadow-medium);
      position: sticky;
      top: 0;
      z-index: 1000;
    }

    .navbar::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: var(--glass-bg);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      z-index: -1;
    }

    .logo {
      font-family: 'Poppins', sans-serif;
      font-size: 2.25rem;
      font-weight: 800;
      background: linear-gradient(135deg, #ffffff 0%, #fff8e1 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      letter-spacing: -0.5px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      position: relative;
      animation: logoGlow 3s ease-in-out infinite alternate;
    }

    .logo::before {
      content: '🍕';
      position: absolute;
      top: -10px;
      right: -25px;
      font-size: 1.2rem;
      animation: logoBounce 2s ease-in-out infinite;
    }

    .logo::after {
      content: '';
      position: absolute;
      bottom: -5px;
      left: 0;
      width: 100%;
      height: 2px;
      background: var(--accent-gradient);
      border-radius: 1px;
      transform: scaleX(0);
      transition: var(--transition);
    }

    .logo:hover::after {
      transform: scaleX(1);
    }

    .logo:hover {
      animation: logoPulse 0.6s ease-in-out;
    }

    @keyframes logoGlow {
      0% {
        filter: drop-shadow(0 0 5px rgba(255, 107, 53, 0.3));
      }
      100% {
        filter: drop-shadow(0 0 15px rgba(255, 107, 53, 0.6));
      }
    }

    @keyframes logoBounce {
      0%, 100% {
        transform: translateY(0) rotate(0deg);
      }
      50% {
        transform: translateY(-8px) rotate(10deg);
      }
    }

    @keyframes logoPulse {
      0% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.05);
      }
      100% {
        transform: scale(1);
      }
    }

    .nav-buttons {
      display: flex;
      gap: 1rem;
      align-items: center;
    }

    .nav-btn {
      position: relative;
      background: var(--glass-bg);
      color: white;
      padding: 0.75rem 1.5rem;
      font-weight: 600;
      font-size: 0.9rem;
      border-radius: var(--border-radius);
      text-decoration: none;
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border: 1px solid var(--glass-border);
      transition: var(--transition);
      overflow: hidden;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .nav-btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: var(--accent-gradient);
      transition: var(--transition);
      z-index: -1;
    }

    .nav-btn:hover::before {
      left: 0;
    }

    .nav-btn:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-medium);
      border-color: rgba(255, 255, 255, 0.3);
    }

    .nav-btn i {
      font-size: 1rem;
      transition: var(--transition);
    }

    .nav-btn:hover i {
      transform: scale(1.1);
    }

    /* Main Container */
    .container {
      max-width: 1400px;
      margin: 4rem auto;
      padding: 0 2rem;
    }

    /* Card Grid */
    .card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 2.5rem;
      padding: 1rem 0;
    }

    .card {
      position: relative;
      background: white;
      border-radius: var(--border-radius-lg);
      overflow: hidden;
      box-shadow: var(--shadow-light);
      transition: var(--transition);
      border: 1px solid rgba(0, 0, 0, 0.05);
    }

    .card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: var(--primary-gradient);
      transform: scaleX(0);
      transition: var(--transition);
    }

    .card:hover::before {
      transform: scaleX(1);
    }

    .card:hover {
      transform: translateY(-12px) scale(1.02);
      box-shadow: var(--shadow-heavy);
      animation: cardWiggle 0.6s ease-in-out;
    }

    @keyframes cardWiggle {
      0%, 100% {
        transform: translateY(-12px) scale(1.02) rotate(0deg);
      }
      25% {
        transform: translateY(-12px) scale(1.02) rotate(1deg);
      }
      75% {
        transform: translateY(-12px) scale(1.02) rotate(-1deg);
      }
    }

    .card img {
      width: 100%;
      height: 220px;
      object-fit: cover;
      transition: var(--transition);
    }

    .card:hover img {
      transform: scale(1.05);
    }

    .card-content {
      padding: 1.5rem;
      position: relative;
    }

    .card-content h3 {
      font-family: 'Poppins', sans-serif;
      font-size: 1.5rem;
      font-weight: 700;
      margin-bottom: 0.75rem;
      color: var(--text-primary);
      line-height: 1.3;
      background: var(--spice-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .card-content p {
      font-size: 0.95rem;
      margin-bottom: 0.5rem;
      color: var(--text-secondary);
      line-height: 1.5;
    }

    .meta {
      font-size: 0.85rem;
      color: var(--text-muted);
      display: flex;
      align-items: center;
      gap: 0.5rem;
      margin-bottom: 0.25rem;
    }

    .meta i {
      font-size: 0.8rem;
      opacity: 0.7;
    }

    .rating-container {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      margin: 1rem 0;
      padding: 0.75rem 0;
      border-top: 1px solid var(--bg-secondary);
    }

    .rating-star {
      color: var(--sunset-yellow);
      font-size: 1.1rem;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
    }

    .add-btn {
      width: 100%;
      margin-top: 1rem;
      background: var(--accent-gradient);
      color: white;
      border: none;
      padding: 1rem;
      border-radius: var(--border-radius);
      font-weight: 600;
      font-family: 'Poppins', sans-serif;
      cursor: pointer;
      transition: var(--transition);
      position: relative;
      overflow: hidden;
    }

    .add-btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: var(--primary-gradient);
      transition: var(--transition);
      z-index: -1;
    }

    .add-btn:hover::before {
      left: 0;
    }

    .add-btn:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow-medium);
    }

    .add-btn:active {
      transform: translateY(-1px);
    }

    .added {
      background: var(--warning-gradient) !important;
      pointer-events: none;
      animation: addedPulse 0.6s ease-in-out;
    }

    @keyframes addedPulse {
      0% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.05);
      }
      100% {
        transform: scale(1);
      }
    }

    /* Responsive Design */
    @media (max-width: 1024px) {
      .navbar {
        padding: 1.25rem 2rem;
      }
      
      .card-grid {
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 2rem;
      }
    }

    @media (max-width: 768px) {
      .navbar {
        flex-direction: column;
        gap: 1.5rem;
        padding: 1.5rem 1.5rem;
      }

      .logo {
        order: 1;
        font-size: 2rem;
      }

      .nav-buttons {
        order: 2;
        width: 100%;
        justify-content: center;
      }

      .container {
        margin: 2rem auto;
        padding: 0 1rem;
      }

      .card-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
      }

      .card-content {
        padding: 1.25rem;
      }
    }

    @media (max-width: 480px) {
      .navbar {
        padding: 1rem;
      }

      .logo {
        font-size: 1.75rem;
      }

      .nav-btn {
        padding: 0.6rem 1.2rem;
        font-size: 0.85rem;
      }

      .card-grid {
        gap: 1rem;
      }
    }

    /* Focus States for Accessibility */
    .nav-btn:focus,
    .card:focus,
    .add-btn:focus {
      outline: 2px solid var(--carrot-orange);
      outline-offset: 2px;
    }

    /* Smooth Scrolling */
    html {
      scroll-behavior: smooth;
    }
  </style>

  <script>
    function handleAddToCart(button) {
      button.classList.add('added');
      button.value = 'Added to Cart!';
      button.innerHTML = '<i class="fas fa-check"></i> Added to Cart!';
    }
  </script>
</head>

<body>
  <!-- FLOATING FOOD ICONS BACKGROUND -->
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

  <nav class="navbar">
    <div class="logo">QuickBite</div>
    <div class="nav-buttons">
      <a class="nav-btn" href="<%= request.getContextPath() %>/home">
        <i class="fas fa-arrow-left"></i>
        Back to Restaurants
      </a>
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

  <div class="container">
    <div class="card-grid">
      <%
    List<Menu> menuByRestaurantId = (List<Menu>) request.getAttribute("menuByRestaurantId");
    for(Menu menu : menuByRestaurantId) {
%>
        <div class="card">
          <img src="<%= menu.getImagePath() %>" alt="<%= menu.getItemName() %> image">
          <div class="card-content">
            <h3><%= menu.getItemName() %></h3>
            <p class="meta"><i class="fas fa-tag"></i> Price: ₹<%= menu.getPrice() %></p>
            <p class="meta"><i class="fas fa-info-circle"></i> <%= menu.getDescription() %></p>
            <p class="meta"><i class="fas fa-circle"></i> Status: <%= menu.getAvailable() %></p>
            <div class="rating-container">
              <span class="rating-star">★</span>
              <span class="rating-text"><%= menu.getRatings() %></span>
            </div>
            <form action="cart?restaurantId=<%= menu.getRestaurantId() %>" method="post"
                  onsubmit="handleAddToCart(this.querySelector('.add-btn')); return true;">
              <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
              <input type="hidden" name="quantity" value="1">
              <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
              <input type="hidden" name="action" value="add">
              <input type="submit" class="add-btn" value="Add to Cart">
            </form>
          </div>
        </div>
      <% } %>
    </div>

</body>
</html>