<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>QuickBite - Checkout</title>
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
      background: var(--primary-gradient);
      color: var(--text-primary);
      line-height: 1.6;
      overflow-x: hidden;
      position: relative;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 3rem 1rem;
      min-height: 100vh;
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
      font-family: 'Poppins', sans-serif;
      font-size: 2.5rem;
      font-weight: 700;
      background: var(--spice-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 2rem;
      text-align: center;
      position: relative;
    }

    h1::after {
      content: '💳';
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

    .checkout-container {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      padding: 3rem 2.5rem;
      width: 100%;
      max-width: 500px;
      border-radius: var(--border-radius-lg);
      box-shadow: var(--shadow-heavy);
      border: 1px solid var(--glass-border);
      position: relative;
      animation: checkoutSlideIn 0.8s ease-out;
    }

    .checkout-container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: var(--success-gradient);
      border-radius: var(--border-radius-lg) var(--border-radius-lg) 0 0;
    }

    @keyframes checkoutSlideIn {
      0% {
        opacity: 0;
        transform: translateY(30px) scale(0.95);
      }
      100% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }
    }

    .form-group {
      margin-bottom: 1.5rem;
      position: relative;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 600;
      font-size: 0.95rem;
      color: var(--text-primary);
      transition: var(--transition);
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 1rem 1.2rem;
      font-size: 1rem;
      font-weight: 500;
      border: 2px solid var(--bg-secondary);
      border-radius: var(--border-radius);
      background: white;
      outline: none;
      transition: var(--transition);
      position: relative;
    }

    input[type="text"]:focus,
    select:focus {
      border-color: var(--carrot-orange);
      box-shadow: 0 0 0 4px rgba(255, 107, 53, 0.1);
      transform: translateY(-2px);
    }

    input[type="text"]::placeholder {
      color: var(--text-muted);
      font-weight: 400;
    }

    select {
      cursor: pointer;
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
      background-position: right 0.5rem center;
      background-repeat: no-repeat;
      background-size: 1.5em 1.5em;
      padding-right: 2.5rem;
    }

    button {
      width: 100%;
      padding: 1rem;
      background: var(--success-gradient);
      color: white;
      font-size: 1.1rem;
      font-weight: 600;
      font-family: 'Poppins', sans-serif;
      border: none;
      border-radius: var(--border-radius);
      cursor: pointer;
      transition: var(--transition);
      position: relative;
      overflow: hidden;
      margin-top: 1rem;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }

    button::before {
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

    button:hover::before {
      left: 0;
    }

    button:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow-medium);
    }

    button:active {
      transform: translateY(-1px);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      body {
        padding: 2rem 1rem;
      }
      
      h1 {
        font-size: 2rem;
        margin-bottom: 1.5rem;
      }
      
      .checkout-container {
        padding: 2rem 1.5rem;
        max-width: 100%;
      }
    }

    @media (max-width: 480px) {
      body {
        padding: 1.5rem 1rem;
      }
      
      h1 {
        font-size: 1.75rem;
      }
      
      .checkout-container {
        padding: 1.5rem 1rem;
      }
      
      input[type="text"],
      select {
        padding: 0.875rem 1rem;
      }
    }

    /* Focus States for Accessibility */
    input[type="text"]:focus,
    select:focus,
    button:focus {
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

  <h1>Complete Your Order</h1>

  <div class="checkout-container">
    <form action="<%= request.getContextPath() %>/checkout" method="POST">
      <div class="form-group">
        <label for="address">Enter Delivery Address</label>
        <input type="text" id="address" name="address" value="<%= session.getAttribute("userAddress") %>" required>
      </div>

      <div class="form-group">
        <label for="payment">Choose Payment Method</label>
        <select id="payment" name="payment" required>
          <option value="" disabled selected>Select a payment option</option>
          <option>Credit Card</option>
          <option>Cash on Delivery</option>
          <option>UPI</option>
        </select>
      </div>

      <button type="submit">
        <i class="fas fa-shopping-bag"></i>
        Place Order Now
      </button>
    </form>
  </div>

</body>
</html>