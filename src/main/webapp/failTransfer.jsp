<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title>Failed Page - YourBank</title>
  <meta charset="UTF-8">
  <!-- Add Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Add custom CSS -->
  <style>
    body {
      background-color: #f8f8f8;
    }
    .container {
      max-width: 400px;
      margin: 100px auto;
      padding: 40px;
      border: 1px solid #ccc;
      background-color: #fff;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    .logo {
      margin-bottom: 30px;
    }
    .logo img {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #337ab7;
      padding: 10px;
    }
    .failed-icon {
      font-size: 80px;
      color: #dc3545;
      animation: scaleUp 0.6s ease-in-out;
    }
    .failed-message {
      font-size: 24px;
      font-weight: bold;
      color: #dc3545;
      animation: fadeIn 1s;
    }
    .return-home {
      margin-top: 40px;
      font-size: 18px;
      color: #888;
      animation: fadeIn 1s;
    }
    /* Animations */
    @keyframes scaleUp {
      0% {
        transform: scale(0);
        opacity: 0;
      }
      100% {
        transform: scale(1);
        opacity: 1;
      }
    }
    @keyframes fadeIn {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="logo">
      <img src="https://www.pngplay.com/wp-content/uploads/6/Bank-Logo-Transparent-Background.png" alt="YourBank Logo">
    </div>
    <div class="failed-icon">&#10008;</div>
    <div class="failed-message">Transfer Failed!</div>
    <span>Transaction Id:
    <%
		out.print(session.getAttribute("transferFailMsg"));
	 %>
    </span>
    <div class="return-home"><a href="home.jsp">Click Here</a> to goto Home page</div>
  </div>
</body>
</html>
