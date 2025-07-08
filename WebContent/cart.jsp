<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.quickbite.model.Cart, com.quickbite.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>QuickBite- Your Cart</title>
  <link type="image/png" rel="icon" href="Images/online-order.png">
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
      min-height: 100vh;
      padding: 2rem 1rem;
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

    h1 {
      text-align: center;
      margin: 2rem 0 3rem;
      font-family: 'Poppins', sans-serif;
      font-size: 2.5rem;
      font-weight: 700;
      background: var(--spice-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      position: relative;
    }

    h1::after {
      content: '🛒';
      position: absolute;
      top: -15px;
      right: -10px;
      font-size: 1.5rem;
      animation: logoBounce 2s ease-in-out infinite;
    }

    @keyframes logoBounce {
      0%, 100% {
        transform: translateY(0) rotate(0deg);
      }
      50% {
        transform: translateY(-8px) rotate(10deg);
      }
    }

    .cart-container {
      max-width: 700px;
      margin: 0 auto 3rem;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      padding: 2.5rem;
      border-radius: var(--border-radius-lg);
      box-shadow: var(--shadow-heavy);
      border: 1px solid var(--glass-border);
      position: relative;
      animation: cartSlideIn 0.8s ease-out;
    }

    .cart-container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: var(--accent-gradient);
      border-radius: var(--border-radius-lg) var(--border-radius-lg) 0 0;
    }

    @keyframes cartSlideIn {
      0% {
        opacity: 0;
        transform: translateY(30px) scale(0.95);
      }
      100% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }
    }

    .cart-row {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      border-bottom: 1px solid var(--bg-secondary);
      padding: 1.5rem 0;
      transition: var(--transition);
    }

    .cart-row:hover {
      background: rgba(255, 107, 53, 0.02);
      border-radius: var(--border-radius);
      padding-left: 1rem;
      padding-right: 1rem;
      margin: 0 -1rem;
    }

    .cart-left {
      flex: 1;
    }

    .cart-left p {
      margin: 0.5rem 0;
      font-size: 0.95rem;
      color: var(--text-secondary);
    }

    .item-name {
      font-weight: 700;
      font-size: 1.1rem;
      color: var(--text-primary);
      font-family: 'Poppins', sans-serif;
      background: var(--primary-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .item-price, .item-total {
      color: var(--text-secondary);
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .item-price i, .item-total i {
      font-size: 0.8rem;
      opacity: 0.7;
    }

    .cart-right {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 1rem;
      min-width: 120px;
    }

    .qty-box {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      background: var(--bg-secondary);
      padding: 0.5rem;
      border-radius: var(--border-radius);
    }

    .qty-btn {
      background: var(--accent-gradient);
      color: white;
      border: none;
      padding: 0.5rem 0.75rem;
      font-size: 1rem;
      font-weight: 600;
      border-radius: 50%;
      cursor: pointer;
      transition: var(--transition);
      min-width: 35px;
      height: 35px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .qty-btn:hover:not(:disabled) {
      transform: scale(1.1);
      box-shadow: var(--shadow-light);
    }

    .qty-btn:disabled {
      background: var(--text-muted);
      cursor: not-allowed;
      opacity: 0.5;
    }

    .qty-display {
      min-width: 30px;
      text-align: center;
      font-weight: 700;
      font-size: 1.1rem;
      color: var(--text-primary);
    }

    .remove-btn {
      background: transparent;
      border: 2px solid var(--tomato-red);
      color: var(--tomato-red);
      padding: 0.5rem 1rem;
      font-size: 0.85rem;
      font-weight: 600;
      border-radius: var(--border-radius);
      cursor: pointer;
      transition: var(--transition);
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .remove-btn:hover {
      background: var(--tomato-red);
      color: white;
      transform: translateY(-2px);
      box-shadow: var(--shadow-light);
    }

    .grand-total {
      display: flex;
      justify-content: space-between;
      padding: 2rem 0 1rem;
      font-size: 1.25rem;
      font-weight: 700;
      border-top: 2px solid var(--bg-secondary);
      margin-top: 1rem;
      font-family: 'Poppins', sans-serif;
    }

    .grand-total span:last-child {
      background: var(--success-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      font-size: 1.5rem;
    }

    .cart-actions {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      margin-top: 2rem;
    }

    .action-btn {
      background: var(--primary-gradient);
      color: white;
      text-decoration: none;
      text-align: center;
      border: none;
      padding: 1rem;
      font-size: 1rem;
      font-weight: 600;
      font-family: 'Poppins', sans-serif;
      border-radius: var(--border-radius);
      cursor: pointer;
      transition: var(--transition);
      position: relative;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }

    .action-btn::before {
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

    .action-btn:hover::before {
      left: 0;
    }

    .action-btn:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow-medium);
    }

    .action-btn:active {
      transform: translateY(-1px);
    }

    .proceed {
      background: var(--spice-gradient);
    }

    .proceed::before {
      background: var(--dessert-gradient);
    }

    .empty-cart-message {
      text-align: center;
      padding: 3rem 2rem;
      font-size: 1.1rem;
      color: var(--text-secondary);
      background: var(--bg-secondary);
      border-radius: var(--border-radius);
      border: 2px dashed var(--carrot-orange);
    }

    .empty-cart-message p {
      margin-bottom: 2rem;
      font-size: 1.2rem;
      font-weight: 500;
    }

    .empty-cart-message .emoji {
      font-size: 3rem;
      margin-bottom: 1rem;
      display: block;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      body {
        padding: 1rem;
      }
      
      h1 {
        font-size: 2rem;
        margin: 1.5rem 0 2rem;
      }
      
      .cart-container {
        padding: 2rem 1.5rem;
        margin: 0 auto 2rem;
      }
      
      .cart-row {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
      }

      .cart-right {
        flex-direction: row;
        justify-content: space-between;
        width: 100%;
        margin-top: 1rem;
      }
    }

    @media (max-width: 480px) {
      .cart-container {
        padding: 1.5rem 1rem;
      }
      
      h1 {
        font-size: 1.75rem;
      }
      
      .cart-actions {
        gap: 0.75rem;
      }
      
      .action-btn {
        padding: 0.875rem;
        font-size: 0.95rem;
      }
    }

    /* Focus States for Accessibility */
    .qty-btn:focus,
    .remove-btn:focus,
    .action-btn:focus {
      outline: 2px solid var(--carrot-orange);
      outline-offset: 2px;
    }

    /* Smooth Scrolling */
    html {
      scroll-behavior: smooth;
    }
  </style>
</head>
<body>
  <!-- TOP LEFT HOME BUTTON -->
  <a class="nav-btn" href="<%= request.getContextPath() %>/home" style="position: fixed; top: 20px; left: 20px; z-index: 1100; background: #fff; color: #ff6b35; padding: 0.7rem 1.4rem; border-radius: 18px; text-decoration: none; font-weight: 600; font-size: 1rem; border: none; display: flex; align-items: center; gap: 0.5rem; box-shadow: 0 2px 8px rgba(255, 107, 53, 0.08); transition: all 0.2s cubic-bezier(.4,0,.2,1);">
    <i class="fas fa-home"></i>
    Home
  </a>
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

  <h1>Your Shopping Cart</h1>

  <div class="cart-container">
    <%
      Cart cart = (Cart)session.getAttribute("cart");
      Integer restaurantId = (Integer)session.getAttribute("restaurantId");

      if(cart != null && !cart.getItems().isEmpty()) {
        for(CartItem item : cart.getItems().values()) {
    %>
      <div class="cart-row">
        <div class="cart-left">
          <p class="item-name"><%= item.getName() %></p>
          <p class="item-price"><i class="fas fa-tag"></i> Price per item: ₹<%= item.getPrice() %></p>
          <p class="item-total"><i class="fas fa-calculator"></i> Subtotal: ₹<%= item.getTotalprice() %></p>
        </div>

        <div class="cart-right">
          <div class="qty-box">
            <form action="cart" method="post">
              <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
              <button class="qty-btn" <% if(item.getQuantity() == 1) { %>disabled<% } %>><i class="fas fa-minus"></i></button>
            </form>

            <span class="qty-display"><%= item.getQuantity() %></span>

            <form action="cart" method="post">
              <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
              <button class="qty-btn"><i class="fas fa-plus"></i></button>
            </form>
          </div>

          <form action="cart" method="post">
            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
            <input type="hidden" name="action" value="remove">
            <button class="remove-btn">
              <i class="fas fa-trash"></i>
              Remove
            </button>
          </form>
        </div>
      </div>
    <%
        }
    %>
      <div class="grand-total">
        <span>Total Amount</span>
        <span>₹<%= cart.getGrandTotal() %></span>
      </div>

      <div class="cart-actions">
        <a href="menu?restaurantId=<%= restaurantId %>" class="action-btn">
          <i class="fas fa-plus"></i>
          Add More Items
        </a>
        <form action="checkout.jsp" method="post">
          <input type="submit" value="Proceed to Checkout" class="action-btn proceed">
        </form>
      </div>
    <%
      } else {
    %>
      <div class="empty-cart-message">
        <span class="emoji">🛒</span>
        <p>Your cart is currently empty. Browse the menu to add your favorite dishes!</p>
        <div class="cart-actions">
          <a href="<%= request.getContextPath() %>/menu?restaurantId=<%= restaurantId %>" class="action-btn">
            <i class="fas fa-utensils"></i>
            Browse Menu
          </a>
        </div>
      </div>
    <% } %>
  </div>
</body>
</html>