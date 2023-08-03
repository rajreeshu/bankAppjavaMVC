
    
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

.transaction-item .span {
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

 .register-link {
    margin-top:30px;
      text-align: center;
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
		<h2>Your Transactions:</h2>
		</div>
 <ul class="transaction-list">

	<%
	int acc_no = (int)session.getAttribute("accno");
	
	String url= "jdbc:mysql://localhost:3306/bankingApp";
	String user = "root";
	String pwd = "Dhoni$1234";
	
	try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection(url, user, pwd);
          
          PreparedStatement pstmt = con.prepareStatement("select * from transferStatus where sender_acc_no = ? or receiver_acc_no=? order by transaction_id desc");
          pstmt.setInt(1, acc_no);
          pstmt.setInt(2, acc_no);
          
          ResultSet transDetails = pstmt.executeQuery();
          
          while(transDetails.next()){
    %> 
             
      <li class="transaction-item">
        <span class="span"> Payment
        <%
        	if(transDetails.getInt("sender_acc_no")==acc_no){
        		
        		pstmt = con.prepareStatement("select * from bankApp where acc_no = ?");
                pstmt.setInt(1, transDetails.getInt("receiver_acc_no"));
                ResultSet secondPerson = pstmt.executeQuery();
                secondPerson.next();
                
        		out.println("Sent:</span><br>");
        		out.println("<span>Sent To: " + transDetails.getInt("receiver_acc_no")+"</span><br>");
        		out.println("<span>Receiver Name: " + secondPerson.getString("customer_name")+"</span><br>");
        		
        	}else{
        		pstmt = con.prepareStatement("select * from bankApp where acc_no = ?");
                pstmt.setInt(1, transDetails.getInt("sender_acc_no"));
                ResultSet secondPerson = pstmt.executeQuery();
                secondPerson.next();
                
                out.println("Received:</span><br>");
        		out.println("<span>Received From: " + transDetails.getInt("receiver_acc_no")+"</span><br>");
        		out.println("<span>Sender Name: " + secondPerson.getString("customer_name")+"</span><br>");
        		
        	}
        %>
     	
        <p>Amount: Rs <%
        	out.println(transDetails.getInt("amount"));
        %></p>
      </li>
      <!-- Add more transaction items as needed -->
		    <%  
	  
          }
	}catch (Exception e) {
		e.printStackTrace();
	}
	%>
		</ul>
		
		<div class="register-link">
	      <a href="home.jsp">Goto Home</a>
	  </div>
	  
		

		<div class="footer">
			<p>Copyright © 2023 Banking App. All rights reserved to Digit
				Insurance.</p>
		</div>
	</div>
</body>
</html>
    