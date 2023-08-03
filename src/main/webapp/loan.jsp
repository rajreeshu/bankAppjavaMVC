<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title>Loan - YourBank</title>
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
    .btn-login {
      width: 100%;
    }
    .register-link {
      text-align: center;
    }
    .information {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
    }
    
      .account-summary {
      background-color: #f5f5f5;
      padding: 15px;
      border-radius: 5px;
      margin-bottom: 20px;
      
    }
    .account-summary h4 {
      margin-top: 0;
      margin-bottom: 20px;
      color: #333;
      font-size:18px;
    }
    .account-item {
      margin-bottom: 10px;
    }
    .account-item ol {
      font-size: 14px;
      color: #888;
    }
    .account-item h5 {
      margin-top: 5px;
      margin-bottom: 0;
      color: #333;
      font-size:14px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="logo">
      <img src="https://www.pngplay.com/wp-content/uploads/6/Bank-Logo-Transparent-Background.png" alt="YourBank Logo">
    </div>
    
        
        <div class="account-summary">
      <h4>Types of Loan</h4>
      <div class="account-item">
        <ol>
        	<li>Home Loan</li>
        	<li>Education Loan</li>
        	<li>Personal Loan</li>
        	<li>Vehicle Loan</li>
        	<li>Gold Loan</li>
        </ol>
      </div>

      <!-- Add more account summary items as needed -->
    </div>
    
    <form action="loan" method="post">
      <div class="form-group">
        <label for="email">Select Loan Type</label>
		<select class="form-control" name="loan-type">
			  <option value="1">Home Loan</option>
			  <option value="2">Education Loan</option>
			  <option value="3">Vehicle Loan</option>
			  <option value="4">Gold Loan</option>
			  <option value="5">Personal Loan</option>
		</select>
      </div>
     
      <button type="submit" class="btn btn-primary btn-login">Login</button>
      <div class="register-link">
        <a href="home.jsp">Goto Home.</a>
      </div>
      
    </form>
  </div>
</body>
</html>


