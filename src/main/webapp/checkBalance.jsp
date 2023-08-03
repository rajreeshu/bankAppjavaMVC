<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
  <title>Balance Page - YourBank</title>
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
      background-color: rgba(255, 255, 255, 0.8);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      position: relative;
      overflow: hidden;
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
    .balance {
      font-size: 36px;
      font-weight: bold;
      color: #3c763d;
      margin-bottom: 30px;
      animation: slideInFromLeft 1s;
    }
    .btn-back-home {
      width: 100%;
      font-size: 18px;
      color: #fff;
      background-color: #337ab7;
      border: none;
      padding: 12px 20px;
      border-radius: 6px;
      cursor: pointer;
      animation: slideInFromBottom 1s;
    }
    /* Animations */
    @keyframes slideInFromLeft {
      0% {
        transform: translateX(-100%);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }
    @keyframes slideInFromBottom {
      0% {
        transform: translateY(100%);
        opacity: 0;
      }
      100% {
        transform: translateY(0);
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
    <div class="balance">Your Account Balance:<br> Rs
    <% 
		session = request.getSession();
		out.println(session.getAttribute("balance"));
	%>
    </div>
    <a href="home.jsp" class="btn btn-back-home btn-back-home">Go Back to Home</a>
  </div>
</body>
</html>
