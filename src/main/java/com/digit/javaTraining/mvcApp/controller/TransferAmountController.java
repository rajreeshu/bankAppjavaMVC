package com.digit.javaTraining.mvcApp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.javaTraining.mvcApp.model.BankApp;

@WebServlet("/transfer")
public class TransferAmountController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int senderAccNo = (int) session.getAttribute("accno");
        String receiverIfsc = req.getParameter("receiver_ifsc");
        int receiverAccNo = Integer.parseInt(req.getParameter("receiver_acc_no"));
        int amount = Integer.parseInt(req.getParameter("amount"));
        int senderPin = Integer.parseInt(req.getParameter("pin"));
		
        BankApp bankApp = new BankApp();
        bankApp.setAcc_no(senderAccNo);
        bankApp.setPin(senderPin);
        boolean isTransfer = bankApp.transferAmount(receiverIfsc, receiverAccNo, amount, session);
        if(isTransfer) { 
        	res.sendRedirect("successTransfer.jsp");
        }else {
        	res.sendRedirect("failTransfer.jsp");
			
        }
        
	}
}
