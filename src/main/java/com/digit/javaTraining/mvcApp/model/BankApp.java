package com.digit.javaTraining.mvcApp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class BankApp {
	int bank_id;
	String bank_name;
	String ifsc_code;
	int acc_no;
	int pin;
	int cust_id;
	String customer_name;
	int balance;
	String email;
	long phone;
	private PreparedStatement pstmt;

	public static Connection con;

	public BankApp() { 
		String url = "jdbc:mysql://localhost:3306/bankingApp";
		String user = "root";
		String pwd = "Dhoni$1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getBank_id() {
		return bank_id;
	}

	public void setBank_id(int bank_id) {
		this.bank_id = bank_id;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getIfsc_code() {
		return ifsc_code;
	}

	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}

	public int getAcc_no() {
		return acc_no;
	}

	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public boolean register() {
		try {

			pstmt = con.prepareStatement("insert into bankApp values(?,?,?,?,?,?,?,?,?,?)");
			System.out.println(pstmt);
			pstmt.setInt(1, bank_id);

			pstmt.setString(2, bank_name);

			pstmt.setString(3, ifsc_code);

			pstmt.setLong(4, acc_no);

			pstmt.setInt(5, pin);

			pstmt.setInt(6, cust_id);

			pstmt.setString(7, customer_name);

			pstmt.setInt(8, balance);

			pstmt.setString(9, email);

			pstmt.setLong(10, phone);

			int x = pstmt.executeUpdate();
			if (x > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean login() {
		try {
			pstmt = con.prepareStatement("select * from bankApp where cust_id = ?");
			pstmt.setInt(1, cust_id);
			ResultSet result = pstmt.executeQuery();
			if (result.next()) {
				if (result.getInt("pin") == this.pin) {
					this.setAcc_no(result.getInt("acc_no"));
					this.setCustomer_name(result.getString("customer_name"));
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public int checkBalance() {
		try {
			pstmt = con.prepareStatement("select * from bankApp where acc_no = ?");
			pstmt.setInt(1, this.acc_no);

			ResultSet result = pstmt.executeQuery();

			if (result.next()) {
				return result.getInt("balance");
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public boolean changePin(int newPin) {
		try {

			pstmt = con.prepareStatement("update bankApp set pin = ? where acc_no = ? and pin = ?");
			pstmt.setInt(1, newPin);
			pstmt.setInt(2, this.acc_no);
			pstmt.setInt(3, this.pin);

			int x = pstmt.executeUpdate();
			if (x > 0)
				return true;
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ResultSet loan(int loanId) {
		ResultSet result = null;
		try {
			pstmt = con.prepareStatement("select * from loanDetail where loan_id = ?");
			pstmt.setInt(1, loanId);
			result = pstmt.executeQuery();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean transferAmount(String receiverIfsc, int receiverAccNo, int amount, HttpSession session) {
		try {
			Random rand = new Random();
			int senderPin = this.pin;
			int transId = rand.nextInt(100000);
			
			pstmt = con.prepareStatement("select * from bankApp where acc_no=? and pin = ?");
	        pstmt.setInt(1, this.acc_no);
	        pstmt.setInt(2, senderPin);
	        
	        ResultSet senderInfo = pstmt.executeQuery();
	        //first
	        if(senderInfo.next()) {
	        	int senderId = senderInfo.getInt("cust_id");
	        	String senderBankName = senderInfo.getString("bank_name");
	        	String senderIfsc = senderInfo.getString("ifsc_code");
	        			
	        	pstmt = con.prepareStatement("select * from bankApp where ifsc_code=? and acc_no=?");
	        	pstmt.setString(1, receiverIfsc);
	        	pstmt.setInt(2, receiverAccNo);
	        	
	        	ResultSet receiverInfo = pstmt.executeQuery();
	        	//second
	        	if(receiverInfo.next()) {
	        		//third
	        		if(senderInfo.getInt("balance")>amount) {
	        			pstmt = con.prepareStatement("update bankApp set balance = balance - ? where acc_no = ?");
	        			pstmt.setInt(1, amount);
	        			pstmt.setInt(2, this.acc_no);
	        			int updateSenderBalance=pstmt.executeUpdate();
	        			//fourth
	        			if(updateSenderBalance>0) {
	        				pstmt = con.prepareStatement("update bankApp set balance = balance + ? where acc_no =?");
	        				pstmt.setInt(1, amount);
	        				pstmt.setInt(2, receiverAccNo);
	        				int updateReceiverBalance = pstmt.executeUpdate();
	        				//fifth
	        				if(updateReceiverBalance>0) {
	        					pstmt = con.prepareStatement("insert into transferStatus values (?,?,?,?,?,?,?,?)");
	        					pstmt.setInt(1,senderId);
	        					pstmt.setString(2,senderBankName);
	        					pstmt.setString(3,senderIfsc);
	        					pstmt.setInt(4,this.acc_no);
	        					pstmt.setString(5,receiverIfsc);
	        					pstmt.setInt(6,receiverAccNo);
	        					pstmt.setInt(7, amount);
	        					pstmt.setInt(8, transId);
	        					
	        					int updateTransferTable = pstmt.executeUpdate();
	        					
	        					//sixth
	        					if(updateTransferTable>0) {
	        						session.setAttribute("transactionId", transId);
	        						return true;
	        					}else {
	        						session.setAttribute("transferFailMsg", "Updation of data Failed!");
	        						return false;
	        					}
	        					
	        				}else {
	        					
        						session.setAttribute("transferFailMsg", "Money can not be added to receiver account!");
	        					return false;
	        				}
	        			}else {
	        				
    						session.setAttribute("transferFailMsg", "Money can't be deducted from Sender's Account!");
	        				return false;
	        			}
	        		}else {
	        			
						session.setAttribute("transferFailMsg", "Insufficient Balance!");
	        			return false;
	        		}
	        	}else {
	        		
					session.setAttribute("transferFailMsg", "Unknown Receiver!");
	        		return false;
	        	}
	        }else {
				session.setAttribute("transferFailMsg", "Sender Verification failed!");
	        	return false;

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ResultSet showAllTransaction() {
		try { 
		PreparedStatement pstmt = con.prepareStatement("select * from transferStatus where sender_acc_no = ? or receiver_acc_no=? order by transaction_id desc");
         pstmt.setInt(1, acc_no);
         pstmt.setInt(2, acc_no);
         
         ResultSet transDetails = pstmt.executeQuery();
         return transDetails;
         
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
