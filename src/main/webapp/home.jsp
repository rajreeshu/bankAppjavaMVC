<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<meta charset="UTF-8">
<!-- Add Bootstrap 3 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="logo">
				<img
					src="https://www.pngplay.com/wp-content/uploads/6/Bank-Logo-Transparent-Background.png"
					alt="Bank Logo">
			</div>
			<h2>
				Welcome,
				<%
      String name =(String)session.getAttribute("cust_name");
		out.print(name.substring(0, 1).toUpperCase() + name.substring(1));
	 %>

				!
			</h2>
		</div>
		<div class="user-info">
			<p>
				Account Number:
				<%
		out.print(session.getAttribute("accno"));
	 %>
			</p>
			<h3>
				Available Balance: <a href="checkBalance">Check Balance</a>
			</h3>
		</div>


		<div class="account-summary">
			<h4>Actions</h4>
			<div class="account-item">
				<span>Check Balance:</span> <a href="checkBalance">Click here</a>
			</div>
			<div class="account-item">
				<span>Change PIN:</span> <a href="changePin.jsp">Click here</a>
			</div>
			<div class="account-item">
				<span>Apply Loan:</span> <a href="loan.jsp">Click here</a>
			</div>
			
			<div class="account-item">
				<span>Transfer Amount :</span> <a href="transfer.jsp">Click here</a>
			</div>
			
			<div class="account-item">
				<span>Show All Transaction :</span> <a href="showAllTransaction.jsp">Click here</a>
			</div>
			
			
			<!-- Add more account summary items as needed -->
		</div>

		<div class="account-summary">
			<h4>Account Summary</h4>
			<div class="account-item">
				<span>Account Type:</span>
				<h5>Saving Account</h5>
			</div>
			<div class="account-item">
				<span>Account Status:</span>
				<h5>Active</h5>
			</div>
			<!-- Add more account summary items as needed -->
		</div>
		
		
		<a href="logout" class="btn btn-primary btn-sm" style="float: right;"
			type="button" data-toggle="modal" data-target="#logoutModal">
			Logout</a>
		<br>

		<div class="footer">
			<p>Copyright © 2023 Banking App. All rights reserved to Digit
				Insurance.</p>
		</div>
	</div>
</body>
</html>
