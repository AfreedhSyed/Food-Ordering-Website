🍽️ QuickBite – Full-Stack Java Food Ordering Web Application (with Admin Panel)
📌 Project Overview
QuickBite is a full-stack Java web application designed to simulate a real-world online food ordering platform. Built using JSP, Servlets, JDBC, and MySQL, this project enables users to seamlessly browse restaurants, view menus, manage their cart, and place orders. It also includes a dedicated Admin Panel to manage restaurants, menu items, and monitor orders — offering a complete restaurant management solution.

This system replicates platforms like Zomato or Swiggy, and is ideal for understanding the complete Java EE stack with full CRUD operations, session handling, role-based access, and real-time interactivity.

🌟 Key Features
👤 User Features
User Registration and Login with Session Management

Browse Restaurants and their Menus

Add Items to Cart, Modify Quantity

Place Orders and View Order Status

Responsive UI for mobile and desktop

🛠️ Admin Features
Admin Login with Authentication

Add, Update, Delete Restaurants

Add, Update, Delete Menu Items

View and Manage All Orders

Real-time status updates for order tracking

🧱 Tech Stack
Layer	Technology Used
Frontend	HTML, CSS, JSP, FontAwesome
Backend	Java (Servlets, JSP), JDBC
Database	MySQL
Server	Apache Tomcat 11
IDE	Eclipse / IntelliJ IDEA
Deployment	GitHub (Version Control)

⚙️ Architecture & Design
The project follows a Modular MVC-like architecture:

Model Layer → Java Beans (POJOs)

View Layer → JSP pages styled with modern CSS

Controller Layer → Java Servlets (handles business logic)

DAO Layer → Interacts with MySQL using JDBC

Util Layer → Database Connection and reusable utilities

🧪 Functional Modules
Module	Description
LoginServlet	Handles user/admin login requests
UserRegisterServlet	Registers new users
MenuServlet	Displays menu based on selected restaurant
CartServlet	Adds/removes items to/from cart
AdminServlet	Handles admin actions like menu management
OrderServlet	Handles order processing

🖼️ Database Tables
users – stores user login info

admin – stores admin credentials

restaurants – list of restaurants

menu – items under each restaurant

orders – customer order records

cart – temporary cart entries per user session

📲 How to Run Locally
Clone the repository:

bash
Copy
Edit
git clone https://github.com/your-username/quickbite-food-ordering.git
Import the project into Eclipse as a Dynamic Web Project.

Place mysql-connector.jar inside the lib/ folder.

Configure MySQL in DBConnection.java:

java
Copy
Edit
String url = "jdbc:mysql://localhost:3306/quickbite_db";
String username = "root";
String password = "yourpassword";
Run the project on Apache Tomcat.

Access:

User: http://localhost:8080/QuickBite/login.jsp

Admin: http://localhost:8080/QuickBite/admin-login.jsp

📸 Screenshots (Optional but recommended)
Homepage with Restaurant List

Menu Display per Restaurant

Add to Cart & Checkout Page

Admin Dashboard

Add/Edit Menu & Restaurant Forms

✅ What You’ll Learn
Full-stack web development using Java EE (Servlets + JSP)

Integration with MySQL using JDBC

Session and request handling

Modular and maintainable code structure

Role-based access management (User vs Admin)

UI/UX improvement using HTML, CSS, FontAwesome

🧑‍💻 Author
Afreedh Syed
📧 syedafreedh30@gmail.com
🔗 LinkedIn:www.linkedin.com/in/afreedh-syed-07b093264

