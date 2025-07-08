<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Confirmed - QuickBite</title>
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
      background: var(--success-gradient);
      color: var(--text-primary);
      line-height: 1.6;
      overflow-x: hidden;
      position: relative;
      text-align: center;
      padding: 4rem 2rem;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
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

    .confirmation-container {
      max-width: 800px;
      margin: 0 auto;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      padding: 4rem 3rem;
      border-radius: var(--border-radius-lg);
      box-shadow: var(--shadow-heavy);
      border: 1px solid var(--glass-border);
      position: relative;
      animation: confirmationSlideIn 1s ease-out;
    }

    .confirmation-container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: var(--success-gradient);
      border-radius: var(--border-radius-lg) var(--border-radius-lg) 0 0;
    }

    @keyframes confirmationSlideIn {
      0% {
        opacity: 0;
        transform: translateY(50px) scale(0.9);
      }
      100% {
        opacity: 1;
        transform: translateY(0) scale(1);
      }
    }

    .confirmation-container h1 {
      font-family: 'Poppins', sans-serif;
      font-size: 3rem;
      font-weight: 700;
      background: var(--success-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 1.5rem;
      position: relative;
    }

    .confirmation-container h1::after {
      content: '🎉';
      position: absolute;
      top: -20px;
      right: -15px;
      font-size: 2rem;
      animation: celebration 2s ease-in-out infinite;
    }

    @keyframes celebration {
      0%, 100% {
        transform: translateY(0) rotate(0deg);
      }
      25% {
        transform: translateY(-10px) rotate(10deg);
      }
      50% {
        transform: translateY(-5px) rotate(-5deg);
      }
      75% {
        transform: translateY(-8px) rotate(5deg);
      }
    }

    .confirmation-container p {
      font-size: 1.2rem;
      color: var(--text-secondary);
      margin-bottom: 1rem;
      font-weight: 500;
    }

    .confirmation-container strong {
      color: var(--text-primary);
      font-weight: 700;
    }

    .success-icon {
      font-size: 4rem;
      color: var(--lettuce-green);
      margin: 2rem 0;
      animation: successPulse 2s ease-in-out infinite;
    }

    @keyframes successPulse {
      0%, 100% {
        transform: scale(1);
        opacity: 1;
      }
      50% {
        transform: scale(1.1);
        opacity: 0.8;
      }
    }

    .moving-image-container {
      margin-top: 3rem;
      position: relative;
      overflow: hidden;
      height: 120px;
      background: var(--bg-secondary);
      border-radius: var(--border-radius);
      padding: 1rem;
    }

    .moving-image {
      width: 160px;
      position: absolute;
      top: 20px;
      left: -180px;
      animation: drive 4s linear infinite;
      border-radius: var(--border-radius);
      box-shadow: var(--shadow-light);
    }

    .road {
      width: 100%;
      height: 12px;
      background: var(--spice-gradient);
      margin-top: 1.5rem;
      border-radius: 6px;
      position: relative;
      overflow: hidden;
    }

    .road::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: repeating-linear-gradient(
        90deg,
        transparent,
        transparent 20px,
        white 20px,
        white 40px
      );
      animation: roadMove 1s linear infinite;
    }

    @keyframes drive {
      0% { 
        left: -180px;
        transform: translateY(0);
      }
      50% {
        transform: translateY(-5px);
      }
      100% { 
        left: 100%;
        transform: translateY(0);
      }
    }

    @keyframes roadMove {
      0% {
        transform: translateX(0);
      }
      100% {
        transform: translateX(-40px);
      }
    }

    .delivery-info {
      margin-top: 2rem;
      padding: 1.5rem;
      background: var(--bg-secondary);
      border-radius: var(--border-radius);
      border-left: 4px solid var(--lettuce-green);
    }

    .delivery-info h3 {
      font-family: 'Poppins', sans-serif;
      font-size: 1.3rem;
      color: var(--text-primary);
      margin-bottom: 0.5rem;
    }

    .delivery-info p {
      font-size: 1rem;
      color: var(--text-secondary);
      margin-bottom: 0.5rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      body {
        padding: 2rem 1rem;
      }
      
      .confirmation-container {
        padding: 3rem 2rem;
      }
      
      .confirmation-container h1 {
        font-size: 2.5rem;
      }
      
      .confirmation-container p {
        font-size: 1.1rem;
      }
      
      .moving-image {
        width: 120px;
      }
    }

    @media (max-width: 480px) {
      .confirmation-container {
        padding: 2rem 1.5rem;
      }
      
      .confirmation-container h1 {
        font-size: 2rem;
      }
      
      .confirmation-container p {
        font-size: 1rem;
      }
      
      .moving-image {
        width: 100px;
      }
    }

    /* Focus States for Accessibility */
    .confirmation-container:focus {
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

  <div class="confirmation-container">
    <div class="success-icon">
      <i class="fas fa-check-circle"></i>
    </div>
    <h1>Thank You for Your Order!</h1>
    <p>Your order has been successfully placed with <strong>QuickBite</strong>.</p>
    <p>We're getting your food ready and it will be delivered to your doorstep shortly.</p>

    <div class="delivery-info">
      <h3><i class="fas fa-truck"></i> Delivery Status</h3>
      <p><i class="fas fa-clock"></i> Estimated delivery time: 30-45 minutes</p>
      <p><i class="fas fa-map-marker-alt"></i> Your order is being prepared</p>
    </div>

    <div class="moving-image-container">
      <img src="Images\Restaurant Images\th.jpg" alt="Delivery on the way" class="moving-image">
    </div>
    <div class="road"></div>
  </div>

</body>
</html>