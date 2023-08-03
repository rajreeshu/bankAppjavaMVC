<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
  <title>Change Password - YourBank</title>
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
      padding: 20px;
      border: 1px solid #ccc;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .logo {
      text-align: center;
      margin-bottom: 30px;
    }
    .logo img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #337ab7;
      padding: 15px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .btn-change {
      width: 100%;
    }
    .register-link {
    margin-top:30px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="logo">
      <img src="https://www.pngplay.com/wp-content/uploads/6/Bank-Logo-Transparent-Background.png" alt="YourBank Logo">
    </div>
    <form action="changePin" method="post">
      <div class="form-group">
        <label for="old-password">Old PIN</label>
        <input type="password" class="form-control" name="prevPin" placeholder="Enter old PIN">
      </div>
      <div class="form-group">
        <label for="new-password">New PIN</label>
        <input type="password" class="form-control" name="newPin" placeholder="Enter new PIN">
      </div>
      <div class="form-group">
        <label for="confirm-password">Confirm PIN</label>
        <input type="password" class="form-control" name="cnfrmPin" placeholder="Confirm new PIN">
      </div>
      <button type="submit" class="btn btn-primary btn-change">Change PIN</button>
      
      <div class="register-link">
	      <a href="home.jsp">Goto Home</a>
	  </div>
    </form>
  </div>
</body>
</html>
