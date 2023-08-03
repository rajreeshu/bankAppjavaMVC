<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Loan Detail</title>
  <meta charset="UTF-8">
  <!-- Add Bootstrap 3 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Add custom CSS -->
  <style>
    body {
      background-color: #f8f8f8;
      font-family: Arial, sans-serif;
    }
    .container {
      max-width: 600px;
      margin: 35px auto;
      padding: 20px;
      border: 1px solid #ccc;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .header {
      text-align: center;
      margin-bottom: 30px;
    }
    .logo {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #337ab7;
      margin-bottom: 10px;
    }
    .logo img {
      
      height: 100%;
      padding: 15px;
    }
    .user-info {
      text-align: center;
      margin-bottom: 20px;
    }
    .user-info p {
      font-size: 14px;
      color: #888;
    }
    .user-info h3 {
      margin-top: 5px;
      margin-bottom: 0;
      color: #333;
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
    }
    .account-item {
      margin-bottom: 10px;
    }
    .account-item span {
      font-size: 14px;
      color:#000;
    }
    .account-item .span2{
    color: #888;
    }
    .account-item h5 {
      margin-top: 5px;
      margin-bottom: 0;
      color: #333;
    }
    .transaction-list {
      list-style-type: none;
      padding-left: 0;
    }
    .transaction-item {
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }
    .transaction-item:last-child {
      border-bottom: none;
    }
    .transaction-item span {
      font-size: 14px;
      color: #888;
    }
    .transaction-item h5 {
      margin-top: 5px;
      margin-bottom: 0;
      color: #333;
    }
    .footer {
      text-align: center;
      margin-top: 30px;
      padding-top: 10px;
      border-top: 1px solid #ccc;
    }
    .footer p {
      font-size: 12px;
      color: #888;
    }
    
    
.thanks p {
	font-size:18px;	
  
}

.animated-heart img{
animation: heart-beat 1s infinite;
height:20px;
}

@keyframes heart-beat {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
  100% {
    transform: scale(1);
  }
}
  </style>
</head>
<body>
  <div class="container">
  <div class="header">
    <div class="logo">
      <img src="https://www.pngplay.com/wp-content/uploads/6/Bank-Logo-Transparent-Background.png" alt="Bank Logo">
    </div>
    <h2>Loan Detail !</h2>
  </div>
  <div class="user-info">
    <p>Account Number: 
      <%
		out.print(session.getAttribute("accno"));
	 %>
      </p>
    <h3>Loan Type: 
      <%
		out.print(session.getAttribute("loan_type"));
	 %>
      </h3>
  </div>

    
  <div class="account-summary">
    <h4>Details</h4>
    <div class="account-item">
      <span>Tenure:</span>
      <span class="span2">
        <%
		out.print(session.getAttribute("loan_tenure"));
	 %> Years
	 </span>
    </div>
    <div class="account-item">
      <span>Loan Interest:</span>
      <span class="span2">
        <%
		out.print(session.getAttribute("loan_interest"));
	 %> Years
	 </span>
    </div>
    <div class="account-item">
      <span>Apply Loan:</span>
      <span class="span2">
        <%
		out.print(session.getAttribute("loan_description"));
	 %> Years
	 </span>
    </div>
    <!-- Add more account summary items as needed -->
  </div>
  
  <div class="thanks">
        <p>Our Agent will Contact you Soon! Thanks for Being patience.</p>
        <div class="animated-heart">
        <img src="https://freepngimg.com/thumb/heart/6-2-heart.png">
        </div>
      </div>

<br>      
  <a href="home.jsp">Go Home</a>
  
  

    <div class="footer">
      <p>Copyright © 2023 Banking App. All rights reserved to Digit Insurance.</p>
    </div>
  </div>
</body>
</html>
